package co.yedam.mapper;

import org.apache.ibatis.annotations.Param;

import co.yedam.vo.MemberVo;

public interface MemberMapper {
	//아이디&비밀번호 단건조회.
	MemberVo selectMember(@Param("id") String id, @Param("pw") String pw);
	
	// 회원가입
    int insertMember(MemberVo member);
    
    // 정보변경
    MemberVo selectMemberId(String id);
    int updatePasswd(MemberVo member);
}