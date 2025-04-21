package co.yedam.service;

import co.yedam.vo.AdminVO;

public interface AdminService {
    AdminVO login(String id, String pw);
}
