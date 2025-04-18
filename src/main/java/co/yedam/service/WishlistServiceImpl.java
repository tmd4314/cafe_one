package co.yedam.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import co.yedam.common.DataSource;
import co.yedam.mapper.WishlistMapper;
import co.yedam.vo.WishlistVO;

public class WishlistServiceImpl implements WishlistService {
    SqlSession session = DataSource.getInstance().openSession(true);
    WishlistMapper mapper = session.getMapper(WishlistMapper.class);

    @Override
    public boolean addToWishlist(WishlistVO vo) {
        return mapper.insert(vo) == 1;
    }

    @Override
    public boolean removeFromWishlist(WishlistVO vo) {
        return mapper.delete(vo) == 1;
    }

    @Override
    public List<WishlistVO> getUserWishlist(String userId) {
        return mapper.selectByUser(userId);
    }

    @Override
    public boolean isInWishlist(WishlistVO vo) {
        return mapper.exists(vo);
    }

    @Override
    public boolean addToWishlist(String userId, String pdCode) {
        WishlistVO vo = new WishlistVO();
        vo.setUserId(userId);
        vo.setPdCode(pdCode);
        return addToWishlist(vo);
    }
}
