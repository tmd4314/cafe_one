package co.yedam.mapper;

import org.apache.ibatis.annotations.Param;
import co.yedam.vo.AdminVO;

public interface AdminMapper {
    AdminVO selectAdmin(@Param("id") String id, @Param("pw") String pw);
}
