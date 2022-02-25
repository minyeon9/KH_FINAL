package com.kh.earth.store.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Product;

public interface StoreService {

	int getProductCount();

	List<Product> getProductList(PageInfo pageInfo);

	
	
}
