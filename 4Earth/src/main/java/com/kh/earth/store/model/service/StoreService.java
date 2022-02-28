package com.kh.earth.store.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Product;

public interface StoreService {

	int getProductCount();

	List<Product> getProductList(PageInfo pageInfo, String arrange);

	int getProductCount(String category);

	int getProductCount(List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail);

	List<Product> getProductListByCategory(PageInfo pageInfo, String category, String arrange);

	List<Product> getProductListByDetail(PageInfo pageInfo, List<String> detail, String arrange);

	
	
}
