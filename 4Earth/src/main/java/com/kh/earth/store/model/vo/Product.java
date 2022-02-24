package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int proNo;
	
	private String proName;
	
	private int proPrice;
	
	private Date proDate;
	
	private Date proModifyDate;
	
	private String proVol;
	
	private String proImg;
	
	private String proInfo;
	
	private int proStat;
	
	private int proCat;
	
	private int proSold;
	
	private String proMfg;
	
	private int proRating;
}
