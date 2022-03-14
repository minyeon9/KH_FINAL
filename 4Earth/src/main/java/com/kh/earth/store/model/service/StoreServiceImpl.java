package com.kh.earth.store.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.dao.StoreMapper;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.Delivery;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Review;
import com.kh.earth.store.model.vo.Wish;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreMapper mapper;
	
	// 상품 개수
	@Override
	public int getProductCount() {
		
		return mapper.getProductCount();
	}

	// 상품 목록 - 등록일순
	@Override
	public List<Product> getProductList(PageInfo pageInfo, String arrange) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getProductList(rowBounds, arrange);
	}

	// 상품 개수 - 카테고리 적용
	@Override
	public int getProductCount(String category) {		
		
		return mapper.getProductCount(category);
	}

	// 상품 개수 - 카테고리 + 상세 필터 적용
	@Override
	public int getProductCount(List<String> detail) {		
		Map<String, Object> map = new HashMap<>();
					
		map.put("detail", detail);
		
		return mapper.getProductCountByDetail(map);
	}

	// 상품 목록 - 카테고리 적용
	@Override
	public List<Product> getProductListByCategory(PageInfo pageInfo, String category) {
		Map<String, Object> map = new HashMap<>();

		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);		
		
		map.put("category", category);
		
		return mapper.getProductListByCategory(rowBounds, map);
	}

	// 상품 목록 - 카테고리 + 상세 필터 적용
	@Override
	public List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail) {
		Map<String, Object> map = new HashMap<>();
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	

		map.put("detail", detail);
		
		return mapper.getProductListByDetail(rowBounds, map);
	}

	// 상품 목록 - 카테고리 적용 & 정렬
	@Override
	public List<Product> getProductListByCategory(PageInfo pageInfo, String category, String arrange) {
		Map<String, Object> map = new HashMap<>();
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		map.put("category", category);
		map.put("arrange", arrange);
		
		return mapper.getProductListByCategory(rowBounds, map);
	}

	// 상품 목록 - 카테고리 + 상세 필터 적용 & 정렬
	@Override
	public List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail, String arrange) {
		Map<String, Object> map = new HashMap<>();
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		map.put("detail", detail);
		map.put("arrange", arrange);
		
		return mapper.getProductListByDetail(rowBounds, map);
	}

	// 상품 상세
	@Override
	public Product findProductByNo(int no) {		
		
		return mapper.findProductByNo(no);
	}

	// 상품 상세 - 상품 옵션 가져오기
	@Override
	public List<ProductOption> findProductOption(int no) {
		
		return mapper.findProductOption(no);
	}

	// 상품 상세 - 장바구니 담기
	@Override
	public int addCart(Cart cart) {
		
		return mapper.addToCart(cart);
	}
	
	// 장바구니 삭제
	@Override
	public int deleteCart(Cart cart) {
		
		return mapper.deleteCart(cart);
	}

	// 장바구니 조회
	@Override
	public List<Cart> getCartList(int no) {
		
		return mapper.getCartList(no);
	}

	// 상품 번호로 상품 이름 조회
	@Override
	public String getProductNameByNo(int productNo) {
		
		return mapper.getProductNameByNo(productNo);
	}

	// 찜하기
	@Override
	public int addWish(Wish wish) {
		
		return mapper.addToWish(wish);
	}

	// 찜 여부 조회
	@Override
	public int getWish(Wish wish) {
		
		return mapper.getWish(wish);
	}

	// 찜 삭제
	@Override
	public int updateWish(Wish wish) {
		
		return mapper.updateWish(wish);
	}

	// 찜 이력 조회
	@Override
	public String getWishStat(Wish wish) {
		
		return mapper.getWishStat(wish);
	}

	// 찜 목록 조회
	@Override
	public List<Product> getWishList(PageInfo pageInfo, int no) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);			
		
		return mapper.getWishList(rowBounds, no);
	}

	// 찜 개수 조회
	public int getWishCount(int no) {
		
		return mapper.getWishCount(no);
	}

	// 상품 문의 작성
	@Override
	public int writeQna(ProductInquiry productInquiry) {
		
		return mapper.writeQna(productInquiry);
	}

	// 상품 문의 목록 조회
	@Override
	public List<ProductInquiry> getProductInqList(PageInfo inqPageInfo, int no) {
		int offset = (inqPageInfo.getCurrentPage() - 1) * inqPageInfo.getListLimit();
		int limit = inqPageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.getProductInqList(rowBounds, no);
	}

	// 상품 문의 개수 조회
	@Override
	public int getProductInqCount(int no) {
		
		return mapper.getProductInqCount(no);
	}

	// 주문번호 생성
	@Override
	public int createOrderSum(OrderSum orderSum) {
		
		return mapper.createOrderSum(orderSum);
	}	

	// 주문 상세 INSERT
	@Override
	public int addOrderDetail(OrderDetail orderDetail) {
		
		return mapper.addOrderDetail(orderDetail);
	}

	// 주문 가격 UPDATE
	@Override
	public int updateOrderSum(OrderSum orderSum) {
		
		return mapper.updateOrderSum(orderSum);
	}

	// 주문 번호로 주문 상세 리스트 조회
	@Override
	public List<OrderDetail> getOrderDetailList(int orderNo) {
		
		return mapper.getOrderDetailList(orderNo);
	}

	// 주문 번호로 주문 조회
	@Override
	public OrderSum findOrderSumByNo(int orderNo) {
		
		return mapper.findOrderSumByNo(orderNo);
	}

	// 주문 내역 UPDATE - 결제 완료
	@Override
	public int completeOrderSum(OrderSum orderSum) {
		
		return mapper.completeOrderSum(orderSum);
	}

	// 회원 번호로 '주문 생성' 상태인 주문들 DELETE
	@Override
	public int deleteOrderSum(int memberNo) {
		
		return mapper.deleteOrderSum(memberNo);
	}

	// 배송 정보 INSERT
	@Override
	public int addDelivery(Delivery delivery) {
		
		return mapper.addDelivery(delivery);
	}

	// 회원번호로 주문(OrderSum) 개수 조회
	@Override
	public int getOrderCount(int memberNo) {
		
		return mapper.getOrderCount(memberNo);
	}

	// 회원번호로 주문(OrderSum) 목록 조회
	@Override
	public List<OrderSum> getOrderList(PageInfo pageInfo, int memberNo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getOrderList(rowBounds, memberNo);
	}

	// 회원 번호 + 상품 번호로 상품에 대한 주문 이력 조회
	@Override
	public int findOrderDetail(int memberNo, int proNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNo", memberNo);
		map.put("proNo", proNo);
		
		return mapper.findOrderDetail(map);
	}

	// ORDER_DETAIL에서 회원 번호 + 상품 번호로 상품에 대한 주문 횟수 조회
	@Override
	public int findOrderDetail(int memberNo, int proNo, String optName) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNo", memberNo);
		map.put("proNo", proNo);
		map.put("optName", optName);
		
		return mapper.findOrderDetail(map);
	}

	@Override
	public int getOrderNoForReview(int memberNo, int proNo, String optName, int i) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberNo", memberNo);
		map.put("proNo", proNo);
		map.put("optName", optName);
		map.put("i", i);
		
		return mapper.getOrderNoForReview(map);
	}

	// 리뷰 작성
	@Override
	public int writeReview(Review review) {
		
		return mapper.writeReview(review);
	}

	// orderNo + proNo + optName 으로 등록된 리뷰 개수 조회
	@Override
	public int getReviewCount(int orderNo, int proNo, String optName) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("orderNo", orderNo);
		map.put("proNo", proNo);
		map.put("optName", optName);
		
		return mapper.getReviewCount(map);
	}

	// 상품 번호로 상품 리뷰 개수 조회
	@Override
	public int getProductRevCount(int no) {
		
		return mapper.getProductRevCount(no);
	}

	// 상품 번호로 상품 리뷰 목록 조회
	@Override
	public List<Review> getProductRevList(PageInfo revPageInfo, int no) {
		int offset = (revPageInfo.getCurrentPage() - 1) * revPageInfo.getListLimit();
		int limit = revPageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);	
		
		return mapper.getProductRevList(rowBounds, no);
	}

	// 리뷰 평점 평균 구하기
	@Override
	public int getProductRating(int proNo) {
		
		return mapper.getProductRating(proNo);
	}
	
	// 리뷰 등록 시 상품 평점 업데이트
	@Override
	public int updateProductRating(int proNo, double rating) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("proNo", proNo);
		map.put("rating", rating);		
		
		return mapper.updateProductRating(map);
	}


	

	
	

	
	

	

}
