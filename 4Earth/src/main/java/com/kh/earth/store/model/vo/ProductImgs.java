package com.kh.earth.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductImgs {
	private int proNo;
	
	private String originalFileName;
	
	private String renamedFileName;
}
