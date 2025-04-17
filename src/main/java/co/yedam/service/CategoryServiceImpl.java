package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.common.DataSource;
import co.yedam.mapper.CategoryMapper;
import co.yedam.vo.CategoryVO;

public class CategoryServiceImpl implements CategoryService {

    SqlSession session = DataSource.getInstance().openSession(true);
    CategoryMapper mapper = session.getMapper(CategoryMapper.class);

    @Override
    public List<CategoryVO> getCategoryList() {
        return mapper.selectCategoryList();
    }
}
