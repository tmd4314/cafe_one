package co.yedam.mapper;

import java.util.List;
import co.yedam.vo.WishlistVO;

public interface WishlistMapper {
    int insert(WishlistVO vo);
    int delete(WishlistVO vo);
    List<WishlistVO> selectByUser(String userId);
    boolean exists(WishlistVO vo);
    int insertOrUpdateCnt(WishlistVO vo); // 개수 증가용
}