package co.yedam.mapper;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.MemberVo;

public interface MemberMapper {
	// 아이디&비밀번호 단건조회.
	MemberVo selectMember(@Param("id") String id, @Param("pw") String pw);

	// 회원가입
	int insertMember(MemberVo member);

	// 회원정보조회
	MemberVo selectMemberId(String id);
	
	// 정보 수정
	int updatePasswd(MemberVo member);

	// 회원 탈퇴
	int deleteMember(String userId);    
     // 마일리지 업데이트
     int updateMemberMaile(MemberVo member);
}