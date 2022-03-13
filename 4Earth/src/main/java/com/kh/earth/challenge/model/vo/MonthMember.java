package com.kh.earth.challenge.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MonthMember {
	
	private int no;

	private int memNo;
	
	// Member
	private String id;
	
	private int chalNo;
	
	private String chalTitle;
	
	private String chalContent;
	
	private Date chalDate;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private String modifyImgName;
	
	private int chalCount;
	
	private int myCount;
	
	private char chalStatus;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
}
