package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
	private int orderNo;
	
	private int memberNo;
	
	private int detailProNo;
	
	private String detailProName;
	
	private int detailOpt;
	
	private String detailOptName;
	
	private int detailQty;
	
	private int detailPrice;
	
	private String orderStat;
	
	private Date orderDate;
	
	private String proModifyImg;
}
