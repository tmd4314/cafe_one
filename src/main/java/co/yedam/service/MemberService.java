package co.yedam.service;

import co.yedam.vo.MemberVo;

// 업무프로세스(service)
public interface MemberService {
	// 로그인
	MemberVo login(String id, String pw);
	boolean addMember(MemberVo member); //회원등록.
	MemberVo getMember(String id); //회원아이디로 조회.
	boolean changePasswd(MemberVo member); //비번변경.
	public boolean removeMember(String userId); //회원탈퇴.
}
