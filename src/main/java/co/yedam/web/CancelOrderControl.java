package co.yedam.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonSyntaxException;

import co.yedam.common.Control;
import co.yedam.service.OrderService;
import co.yedam.service.OrderServiceImpl;

public class CancelOrderControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        if (userId == null) {
            resp.sendRedirect("login.do");
            return;
        }

        String orderNo = req.getParameter("orderNo");
        String cancelReason = req.getParameter("cancelReason");

        if (orderNo == null || cancelReason == null || orderNo.isEmpty() || cancelReason.isEmpty()) {
            req.setAttribute("errorMsg", "주문 번호와 취소 사유를 모두 입력해주세요.");
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
            return;
        }

        OrderService orderService = new OrderServiceImpl();
        String impUid = orderService.getImpUidByOrderNo(orderNo);

        if (impUid == null || impUid.isEmpty()) {
            req.setAttribute("errorMsg", "해당 주문 번호로 결제된 정보를 찾을 수 없습니다.");
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
            return;
        }

        try {
            String accessToken = getAccessToken();

            if (accessToken == null) {
                req.setAttribute("errorMsg", "아임포트 Access Token 발급 실패");
                req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
                return;
            }

            boolean cancelSuccess = cancelPayment(impUid, accessToken, cancelReason);

            if (cancelSuccess) {
                orderService.updateOrderStatusToCancelled(orderNo);

                req.setAttribute("successMsg", "주문이 성공적으로 취소되었습니다.");
                resp.sendRedirect("orderForm.do");
                return;
            } else {
                req.setAttribute("errorMsg", "아임포트 결제 취소 API 호출 실패.");
                req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "주문 취소 중 오류가 발생했습니다: " + e.getMessage());
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp);
            return;
        }
    }

    private String getAccessToken() throws IOException {
        String apiKey = "8016845353834585";
        String secretKey = "oULGMTPRaiwTIYmu4pDWnvqEqdnhNRdl4oPVnHHdZPz2Kx0gU89MCI1aPwqJWdUF7hQbH3AniaOH1IEQ";

        URL url = new URL("https://api.iamport.kr/users/getToken");
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setDoOutput(true);

        String postParams = String.format("{\"imp_key\":\"%s\",\"imp_secret\":\"%s\"}", apiKey, secretKey);

        DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
        wr.write(postParams.getBytes(StandardCharsets.UTF_8));
        wr.flush();
        wr.close();

        int responseCode = connection.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            System.err.println("아임포트 API 에러 응답: " + connection.getResponseMessage());
        }
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();

        String accessToken = null;
        try {
            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
            JsonObject responseObject = jsonResponse.getAsJsonObject("response");
            accessToken = responseObject.get("access_token").getAsString();
        } catch (JsonSyntaxException | NullPointerException e) {
            System.err.println("JSON 파싱 에러: " + e.getMessage());
            System.err.println("응답 내용: " + response.toString());
            e.printStackTrace();
            return null;
        }

        return accessToken;
    }

    private boolean cancelPayment(String impUid, String accessToken, String cancelReason) throws IOException {
        URL url = new URL("https://api.iamport.kr/payments/cancel");
        HttpsURLConnection connection = (HttpsURLConnection) url.openConnection();
        connection.setRequestMethod("POST");
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestProperty("Authorization", accessToken);
        connection.setDoOutput(true);

        String encodedCancelReason = URLEncoder.encode(cancelReason, StandardCharsets.UTF_8.toString());
        String postParams = String.format("{\"imp_uid\":\"%s\",\"reason\":\"%s\"}", impUid, encodedCancelReason);

        DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
        wr.write(postParams.getBytes(StandardCharsets.UTF_8));
        wr.flush();
        wr.close();

        int responseCode = connection.getResponseCode();
        System.out.println("아임포트 API 응답 코드: " + responseCode);

        BufferedReader br;
        StringBuilder response = new StringBuilder();
        boolean cancelSuccess = false; // 취소 성공 여부 변수 초기화

        if (responseCode == 200) {
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        } else {
            br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            System.err.println("아임포트 API 에러 응답: " + connection.getResponseMessage());
        }

        String inputLine;
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();

        System.out.println("아임포트 API 전체 응답: " + response.toString());

        try {
            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
            int code = jsonResponse.get("code").getAsInt();
            cancelSuccess = (code == 0);
        } catch (JsonSyntaxException | NullPointerException e) {
            System.err.println("JSON 파싱 에러: " + e.getMessage());
            System.err.println("응답 내용: " + response.toString());
            e.printStackTrace();
            cancelSuccess = false; // JSON 파싱 에러 발생 시 취소 실패로 처리
        }

        return cancelSuccess;
    }
}
