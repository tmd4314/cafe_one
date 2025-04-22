package co.yedam.service;

import org.apache.ibatis.session.SqlSession;
import co.yedam.common.DataSource;
import co.yedam.mapper.AdminMapper;
import co.yedam.vo.AdminVO;

public class AdminServiceImpl implements AdminService {

    SqlSession session = DataSource.getInstance().openSession(true);
    AdminMapper mapper = session.getMapper(AdminMapper.class);

    @Override
    public AdminVO login(String id, String pw) {
        return mapper.selectAdmin(id, pw);
    }
}
