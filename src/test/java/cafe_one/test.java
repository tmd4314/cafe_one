package cafe_one;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.vo.MemberVo;

public class test {
	public static void main(String[] args) {
		SqlSession sqlSession = DataSource.getInstance().openSession(true);
	}
}
