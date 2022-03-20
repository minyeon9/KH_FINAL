package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	private int memberNo;
	
	private int proNo;
	
	private String proName;
	
	private int proPrice;
	
	private String proOpt;
	
	private int proOptNo;
	
	private int cartQty;
	
	private char cartStat;
	
	private Date cartDate;
	
	private int proStat;
	
	private String proModifyImg;
}
