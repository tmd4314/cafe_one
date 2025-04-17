package co.yedam.mapper;

import java.util.List;
import java.util.Map;

public interface ProductMapper {
	List<Map<String, Object>> selectMessage();
	List<Map<String, Object>> selectHint(String remainTimeString);
	//List<Map<String, Object>> selectProduct(String pdCode);

	
	// 목록조회
}
