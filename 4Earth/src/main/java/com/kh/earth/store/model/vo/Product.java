package com.kh.earth.store.model.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	
	private String proModifyImg;
	
	private String proInfo;
	
	private int proStat;
	
	private int proCat;
	
	private int proSold;
	
	private int proStock;
	
	private String proMfg;
	
	private double proRating;
	
	private int isNew;
	
	private List<ProductOption> option;
}
