package co.yedam.web;
 
 import java.io.IOException;
 
 import javax.servlet.ServletException;
 import javax.servlet.http.HttpServletRequest;
 import javax.servlet.http.HttpServletResponse;

 
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
 			String unm = req.getParameter("userName");
 			String upn = req.getParameter("phone");
 			String uad = req.getParameter("address");
 			String uem = req.getParameter("email");
 
 			MemberVo mvo = new MemberVo();
 			mvo.setUserId(uid);
 			mvo.setPassword(upw);
 			mvo.setUserName(unm);
 			mvo.setPhone(upn);
 			mvo.setAddress(uad);
 			mvo.setEmail(uem);
 			mvo.setMailage(0);
 
 			// 업무처리.
 			MemberService svc = new MemberServiceImpl();
 			if (svc.addMember(mvo)) {
 //				resp.sendRedirect("loginForm.do");
 				req.getRequestDispatcher("product/index.tiles").forward(req, resp);
 			} else {
 				System.out.println("처리오류");
 			}
 			
 		}
 
 	}
 
 }
