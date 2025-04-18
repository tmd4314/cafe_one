package co.yedam.mapper;
 
 import java.util.List;

import co.yedam.vo.WishlistVO;
 
 public interface WishlistMapper {
     int insert(WishlistVO vo); // 찜 추가
     int delete(WishlistVO vo); // 찜 삭제
     List<WishlistVO> selectByUser(String userId); // 사용자별 찜 목록
     boolean exists(WishlistVO vo); // 해당 상품이 이미 찜 되어 있는지 확인
 }