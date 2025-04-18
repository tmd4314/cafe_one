package co.yedam.service;

import java.util.List;

import co.yedam.vo.WishlistVO;

public interface WishlistService {
    boolean addToWishlist(WishlistVO vo);
    boolean removeFromWishlist(WishlistVO vo);
    List<WishlistVO> getUserWishlist(String userId);
    boolean isInWishlist(WishlistVO vo);
	boolean addToWishlist(String userId, String pdCode);
}
