package com.kh.earth.challenge.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MonthMember {
	
	private int no;

	private int memNo;
	
	private String id;
	
	private int chalNo;
	
	private String chalTitle;
	
	private Date chalDate;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private String modifyImgName;
	
	private int chalCount;
	
	private char chalStatus;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
	// private List<Month> month;
	
}
