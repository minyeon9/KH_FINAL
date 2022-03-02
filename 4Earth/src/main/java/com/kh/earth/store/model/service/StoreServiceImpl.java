package com.kh.earth.store.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.dao.StoreMapper;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductOption;

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

	@Override
	public List<ProductOption> findProductOption(int no) {
		
		return mapper.findProductOption(no);
	}

	

	
	

	

}
