package com.kh.earth.store.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Application;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.Delivery;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Review;
import com.kh.earth.store.model.vo.Wish;

public interface StoreService {

	int getProductCount();

	List<Product> getProductList(PageInfo pageInfo, String arrange);

	int getProductCount(String category);

	int getProductCount(List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category, String arrange);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail, String arrange);

	Product findProductByNo(int no);

	List<ProductOption> findProductOption(int no);

	int addCart(Cart cart);
	
	int deleteCart(Cart cart);

	List<Cart> getCartList(int no);

	String getProductNameByNo(int productNo);

	int addWish(Wish wish);

	int getWish(Wish wish);

	int updateWish(Wish wish);

	String getWishStat(Wish wish);
	
	int getWishCount(int no);

	List<Product> getWishList(PageInfo pageInfo, int no);

	int writeQna(ProductInquiry productInquiry);

	List<ProductInquiry> getProductInqList(PageInfo inqPageInfo, int no);

	int getProductInqCount(int no);

	int createOrderSum(OrderSum orderSum);

	int addOrderDetail(OrderDetail orderDetail);

	int updateOrderSum(OrderSum orderSum);

	List<OrderDetail> getOrderDetailList(int orderNo);

	OrderSum findOrderSumByNo(int orderNo);

	int completeOrderSum(OrderSum orderSum);

	int deleteOrderSum(int memberNo);

	int addDelivery(Delivery delivery);

	int getOrderCount(int memberNo);

	List<OrderSum> getOrderList(PageInfo pageInfo, int memberNo);

	int findOrderDetail(int memberNo, int proNo);

	int findOrderDetail(int memberNo, int proNo, String optName);

	int getOrderNoForReview(int memberNo, int proNo, String optName, int i);

	int writeReview(Review review);

	int getReviewCount(int orderNo, int proNo, String optName);

	int getProductRevCount(int no);

	List<Review> getProductRevList(PageInfo revPageInfo, int no);

	int getProductRating(int proNo);
	
	int updateProductRating(int proNo, double rating);

	List<ProductImgs> getProductImgs(int no);

	int getCategoryNo(String appCatName);

	int writeApplication(Application application);





	
	
}
