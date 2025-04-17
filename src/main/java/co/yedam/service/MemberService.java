package co.yedam.service;

import co.yedam.vo.MemberVo;

// 업무프로세스(service)
public interface MemberService {
	// 로그인
	MemberVo login(String id, String pw);

}

