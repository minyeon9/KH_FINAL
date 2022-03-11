package com.kh.earth.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.Delivery;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Wish;

@Mapper
public interface StoreMapper {

	int getProductCount();

	List<Product> getProductList(RowBounds rowBounds, String arrange);

	int getProductCount(String category);

	int getProductCountByDetail(Map<String, Object> map);

	List<Product> getProductListByCategory(RowBounds rowBounds, Map<String, Object> map);

	List<Product> getProductListByDetail(RowBounds rowBounds, Map<String, Object> map);

	Product findProductByNo(int no);

	List<ProductOption> findProductOption(int no);

	int addToCart(Cart cart);

	List<Cart> getCartList(int no);

	String getProductNameByNo(int productNo);

	int addToWish(Wish wish);

	int getWish(Wish wish);

	int updateWish(Wish wish);

	String getWishStat(Wish wish);

	List<Product> getWishList(RowBounds rowBounds, int no);

	int getWishCount(int no);

	int writeQna(ProductInquiry productInquiry);

	int getProductInqCount(int no);

	List<ProductInquiry> getProductInqList(RowBounds rowBounds, int no);

	int createOrderNo();

	int addOrderDetail(OrderDetail orderDetail);

	int createOrderSum(OrderSum orderSum);

	int updateOrderSum(OrderSum orderSum);

	List<OrderDetail> getOrderDetailList(int orderNo);

	int deleteCart(Cart cart);

	OrderSum findOrderSumByNo(int orderNo);

	int completeOrderSum(OrderSum orderSum);

	int deleteOrderSum(int memberNo);

	int addDelivery(Delivery delivery);



}
