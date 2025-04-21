package co.yedam.service;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.MemberMapper;
import co.yedam.vo.MemberVo;

// 업무(service 구현객체)
public class MemberServiceImpl implements MemberService {

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);

	@Override
	public MemberVo login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}

	@Override
 	public boolean addMember(MemberVo member) {
 		return mapper.insertMember(member) == 1;
 	}
 
 	@Override
 	public MemberVo getMember(String id) {
 		return mapper.selectMemberId(id);
 	}
 
 	@Override
 	public boolean changePasswd(MemberVo member) {
 		return false;
 	}

	@Override
	public boolean updateMemberMaile(MemberVo member) {
		// TODO Auto-generated method stub
		return mapper.updateMemberMaile(member) == 1;
	}
	
 	@Override
 	public boolean removeMember(String userId) {
 		return mapper.deleteMember(userId) == 1;
 	}
}

