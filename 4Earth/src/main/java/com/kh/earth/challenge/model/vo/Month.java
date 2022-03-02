package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Month {
	private int category;
	
	private int chalNo;
	
	private String chalTitle;
	
	private String chalContent;
	
	private String chalImgPath;
	
	private int chalPoint;
	
	private int chalCount;
	
	private Date chalDate;
	
	private Date chalModifyDate;
}
