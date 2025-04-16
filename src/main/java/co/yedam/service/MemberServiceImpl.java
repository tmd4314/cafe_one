package co.yedam.service;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.MemberMapper;
import co.yedam.vo.MemberVo;

// 업무(service 구현객체)
public class MemberServiceImpl implements MemberService{

	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	
	@Override
	public MemberVo login(String id, String pw) {
		return mapper.selectMember(id, pw);
	}
	
	
}
