package co.yedam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import co.yedam.vo.ProductVO;

public class ProductListDAO extends DAO {

	public List<ProductVO> AllProductList() {
		List<ProductVO> list = new ArrayList<>();
		Connection conn = getConnect();
		try {
			PreparedStatement psmt = conn.prepareStatement("select * from product");
			ResultSet rs = psmt.executeQuery();
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setPdimg(rs.getString("primg"));

				list.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
