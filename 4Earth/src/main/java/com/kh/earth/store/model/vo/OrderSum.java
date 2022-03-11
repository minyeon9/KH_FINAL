package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderSum {
	private int orderNo;
	
	private int memberNo;
	
	private int orderPrice;
	
	private String orderStat;
	
	private Date orderDate;
	
	private String orderMethod;
	
	private String orderPm;
	
	private int orderPoint;
}
