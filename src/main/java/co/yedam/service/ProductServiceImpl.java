package co.yedam.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.ProductMapper;

public class ProductServiceImpl implements ProductService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

	@Override
	public List<Map<String, Object>> cheeringMessage() {
		return mapper.selectMessage();
	}

	@Override
	public List<Map<String, Object>> hintMessage(String remainTimeString) {
		// TODO Auto-generated method stub
		return mapper.selectHint(remainTimeString);
	}
}
