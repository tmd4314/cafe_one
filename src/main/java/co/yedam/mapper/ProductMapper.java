package co.yedam.mapper;

import java.util.List;
import java.util.Map;

import co.yedam.vo.ProductVO;

public interface ProductMapper {
	List<Map<String, Object>> selectMessage();
	List<Map<String, Object>> selectHint(String remainTimeString);
	
	ProductVO selectOne(String pdCode);
}
