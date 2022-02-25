package com.kh.earth.store.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.dao.StoreMapper;
import com.kh.earth.store.model.vo.Product;

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
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getProductList(rowBounds);
	}

	

}
