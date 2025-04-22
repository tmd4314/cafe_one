package co.yedam.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

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
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp); // tiles 레이아웃 적용
            return;
        }

        OrderService orderService = new OrderServiceImpl();
        String impUid = orderService.getImpUidByOrderNo(orderNo); // DB에서 imp_uid 가져오기

        if (impUid == null || impUid.isEmpty()) {
            req.setAttribute("errorMsg", "해당 주문 번호로 결제된 정보를 찾을 수 없습니다.");
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp); // tiles 레이아웃 적용
            return;
        }

        try {
            // 1. 아임포트 API access_token 발급 받기
            String accessToken = getAccessToken();

            if (accessToken == null) {
                req.setAttribute("errorMsg", "아임포트 Access Token 발급 실패");
                req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp); // tiles 레이아웃 적용
                return;
            }

            // 2. 아임포트 결제 취소 API 호출
            boolean cancelSuccess = cancelPayment(impUid, accessToken, cancelReason);

            if (cancelSuccess) {
                // 3. DB 주문 상태 업데이트
                orderService.updateOrderStatusToCancelled(orderNo);

                // 4. 성공 메시지 설정 및 페이지 이동
                req.setAttribute("successMsg", "주문이 성공적으로 취소되었습니다.");
                resp.sendRedirect("orderForm.do");
                return;
            } else {
                req.setAttribute("errorMsg", "아임포트 결제 취소 API 호출 실패.");
                req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp); // tiles 레이아웃 적용
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMsg", "주문 취소 중 오류가 발생했습니다: " + e.getMessage());
            req.getRequestDispatcher("cash/cancelOrderForm.tiles").forward(req, resp); // tiles 레이아웃 적용
            return;
        }
    }

    // 아임포트 access token 발급
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
        wr.writeBytes(postParams);
        wr.flush();
        wr.close();

        int responseCode = connection.getResponseCode();
        BufferedReader br;
        if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            System.err.println("아임포트 API 에러 응답: " + connection.getResponseMessage()); // 에러 메시지 출력
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
            System.err.println("응답 내용: " + response.toString()); // 전체 응답 내용 출력
            e.printStackTrace();
            return null; // accessToken 발급 실패 시 null 반환
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

        String postParams = String.format("{\"imp_uid\":\"%s\",\"reason\":\"%s\"}", impUid, cancelReason);

        DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
        wr.writeBytes(postParams);
        wr.flush();
        wr.close();

        int responseCode = connection.getResponseCode();
        System.out.println("아임포트 API 응답 코드: " + responseCode); // 응답 코드 로깅

        BufferedReader br;
        if (responseCode == 200) { // 정상 호출
            br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            System.err.println("아임포트 API 에러 응답: " + connection.getResponseMessage()); // 에러 메시지 출력
        }
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
        }
        br.close();

        System.out.println("아임포트 API 전체 응답: " + response.toString()); // 전체 응답 내용 로깅

        boolean cancelSuccess = false;
        try {
            JsonObject jsonResponse = JsonParser.parseString(response.toString()).getAsJsonObject();
            int code = jsonResponse.get("code").getAsInt();
            cancelSuccess = (code == 0);
        } catch (JsonSyntaxException | NullPointerException e) {
            System.err.println("JSON 파싱 에러: " + e.getMessage());
            System.err.println("응답 내용: " + response.toString()); // 전체 응답 내용 출력
            e.printStackTrace();
        }

        return cancelSuccess;
    }
}
