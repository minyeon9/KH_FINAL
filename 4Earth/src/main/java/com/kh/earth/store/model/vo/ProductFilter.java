package com.kh.earth.store.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductFilter {
	private int page;
	
	private String category;
	
	private List<String> detail;
	
	private String arrange;
}
