package co.yedam.mapper;

import java.util.List;
import co.yedam.vo.CategoryVO;

public interface CategoryMapper {
    List<CategoryVO> selectAll();
}
