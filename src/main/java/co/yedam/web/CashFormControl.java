package co.yedam.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.yedam.common.Control;
import co.yedam.service.CartService;
import co.yedam.service.CartServiceImpl;
import co.yedam.vo.CartVo;

public class CashFormControl implements Control {

	@Override
	public void exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/json;charset=utf-8");
		// { "data": [ [21, '댓글내용', 'user01', '날짜'], [], []...[] ]}
		String id = req.getParameter("logId");
		String cno = req.getParameter("cno");
		CartService svc = new CartServiceImpl();
		List<CartVo> list = svc.getCash(id, Integer.parseInt(cno));
		System.out.println(list);
		req.setAttribute("blist", list);
		req.getRequestDispatcher("cash/cashForm.tiles").forward(req, resp);
	}

}
