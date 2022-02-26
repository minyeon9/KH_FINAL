package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Today {
	
	private int memNo;
	
	private int chalNo;
	
	private int chalNo2;
	
	private String chalTitle;
	
	private String chalContent;	
	
	private Date chalDate;
	
	private char chalStatus;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
}
