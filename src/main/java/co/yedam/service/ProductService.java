package co.yedam.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
	List<Map<String, Object>> cheeringMessage();
	List<Map<String, Object>> hintMessage(String remainTimeString);
}
