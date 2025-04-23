package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;
import co.yedam.vo.MemberVo;

public class MemberUpdateControl implements Control {

    @Override
    public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("logId");

        if (userId == null) {
            resp.sendRedirect("loginForm.do");
            return;
        }

        // 파라미터 수집
        String userName = req.getParameter("userName");
        String phone = req.getParameter("phone");
        String post = req.getParameter("post");
        String address1 = req.getParameter("address1");
        String address2 = req.getParameter("address2");
        String address3 = req.getParameter("address3");
        String email = req.getParameter("email");

        // MemberVo 객체 생성 및 값 설정
        MemberVo vo = new MemberVo();
        vo.setUserId(userId);
        vo.setUserName(userName);
        vo.setPhone(phone);
        vo.setPost(post);
        vo.setAddress1(address1);
        vo.setAddress2(address2);
        vo.setAddress3(address3);
        vo.setEmail(email);
        

        // 서비스 호출
        MemberService service = new MemberServiceImpl();
        boolean result = service.updateMemberInfo(vo);
        System.out.println(result);
        
        if (result == true) {
        	 // 세션 무효화 (로그아웃 처리)
            session.invalidate();

            // 알림 메시지 설정 (setAttribute 사용)
            req.setAttribute("updateSuccessMsg", "회원 정보가 수정되었습니다. 다시 로그인해주세요.");

            // loginForm.do로 리다이렉트
            resp.sendRedirect("loginForm.do");
        } else {
            req.setAttribute("errorMsg", "회원 정보 수정에 실패했습니다.");
            req.getRequestDispatcher("member/myPage.tiles").forward(req, resp);
        }
    }
}
