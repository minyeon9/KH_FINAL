package com.kh.earth.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductBidding {
	private int bidNo;
	
	private String bidName;
	
	private int bidCond;
	
	private int bidCurr;
	
	private int bidStatNo;
	
	private int proCat;
	
	private String proCatName;
	
	private String bidUrl;
	
	private String originalFileName;
	
	private String renamedFileName;
}
