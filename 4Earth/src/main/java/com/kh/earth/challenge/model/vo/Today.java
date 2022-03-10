package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Today {
	
	private int category;
	
	private int chalNo;
	
	private String chalTitle;
	
	private String chalContent;	
	
	private String chalImgPath;
	
	private int chalPoint;
	
	private Date startDate;
	
	private Date endDate;
	
	private char chalStatus;
}
