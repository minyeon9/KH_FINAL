package com.kh.earth.store.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.store.model.vo.Product;

@Mapper
public interface StoreMapper {

	int getProductCount();

	List<Product> getProductList(RowBounds rowBounds);

}
