package co.yedam.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.yedam.common.Control;
import co.yedam.service.MemberService;
import co.yedam.service.MemberServiceImpl;
import co.yedam.vo.MemberVo;

public class SignUpControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		if (req.getMethod().equals("GET")) {
			// 1.회원가입화면. WEB-INF/views/signForm.jsp
			req.getRequestDispatcher("member/signForm.tiles").forward(req, resp);
		} else {
			// 2.회원가입처리. (파일업로드:images, db등록)
			// 파라미터 & 값.
			String uid = req.getParameter("userId");
			String upw = req.getParameter("password");
			String ucp = req.getParameter("cpass");
			String unm = req.getParameter("userName");
			String upn = req.getParameter("phone");
			String addr1 = req.getParameter("address1");
			String addr2 = req.getParameter("address2");
			String addr3 = req.getParameter("address3");
			String addr4 = req.getParameter("address4");
			String uem = req.getParameter("email");
			
			String addr = (addr1 != null ? addr1 : "") +
			             (addr2 != null ? addr2 : "") +
			             (addr3 != null ? addr3 : "") +
			             (addr4 != null ? addr4 : "");
			
			if (upw.equals(ucp)) {
				MemberVo mvo = new MemberVo();
				mvo.setUserId(uid);
				mvo.setPassword(upw);
				mvo.setUserName(unm);
				mvo.setPhone(upn);
				mvo.setAddress(addr);
				mvo.setEmail(uem);
				mvo.setMailage(0);

				// 업무처리.
				MemberService svc = new MemberServiceImpl();
				if (svc.addMember(mvo)) {
					// resp.sendRedirect("loginForm.do");
					req.getRequestDispatcher("product/index.tiles").forward(req, resp);
				} else {
					System.out.println("처리오류");
					req.getRequestDispatcher("member/signForm.tiles").forward(req, resp);
				}

			} else {
				req.setAttribute("mes", "비밀번호가 일치하지 않습니다.");
				req.getRequestDispatcher("member/signForm.tiles").forward(req, resp);
			}
		}
	}
}

