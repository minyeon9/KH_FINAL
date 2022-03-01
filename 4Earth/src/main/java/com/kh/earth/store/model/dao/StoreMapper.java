package com.kh.earth.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.store.model.vo.Product;

@Mapper
public interface StoreMapper {

	int getProductCount();

	List<Product> getProductList(RowBounds rowBounds, String arrange);

	int getProductCount(String category);

	int getProductCountByDetail(Map<String, Object> map);

	List<Product> getProductListByCategory(RowBounds rowBounds, Map<String, Object> map);

	List<Product> getProductListByDetail(RowBounds rowBounds, Map<String, Object> map);

}
