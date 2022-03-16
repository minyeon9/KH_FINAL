package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int no;
	
	private int pointNo;
	
	private int memNo;
	
	private Date saveDate;
	
	private String saveContent;	
	
	private int savePoint;
	
	private Date spendDate;
	
	private String spendContent;	
	
	private int spendPoint;
	
	private Date disapearDate;
	
	private char pointCategory;
	
	private char saveStatus;
	
}
