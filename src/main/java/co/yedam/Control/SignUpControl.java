package co.yedam.Control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;
import co.yedam.vo.MemberVO;

public class SignUpControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getMethod().equals("GET")) {
			// 1.회원가입화면. WEB-INF/views/signForm.jsp
			req.getRequestDispatcher("member/signForm.tiles").forward(req, resp);
		} else {
			// 2.회원가입처리. (파일업로드:images, db등록)
			// 1)요청정보 2)경로 3)최대크기 4)인코딩 5)리네임정책
			String saveDir = req.getServletContext().getRealPath("images");
			int maxSize = 1024 * 1024 * 5;
			String enc = "UTF-8";
			MultipartRequest mr = new MultipartRequest(req//
					, saveDir//
					, maxSize//
					, enc//
					, new DefaultFileRenamePolicy());
			// 파라미터 & 값.
			String uid = mr.getParameter("userId");
			String upw = mr.getParameter("userPw");
			String unm = mr.getParameter("userName");

			MemberVO mvo = new MemberVO();
			mvo.setUser_id(uid);
			mvo.setUser_name(unm);
			mvo.setUser_pw(upw);

			// 업무처리.
			MemberService svc = new MemberServiceImpl();
			if (svc.addMember(mvo)) {
				resp.sendRedirect("loginForm.do");
			} else {
				System.out.println("처리오류");
			}

		}

	}

}
