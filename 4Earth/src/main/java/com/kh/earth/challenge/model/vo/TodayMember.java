package com.kh.earth.challenge.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TodayMember {
	
	private int no;

	private int memNo;
	
	private int chalNo;
	
	private String chalTitle;
	
	private Date chalDate;
	
	private char chalStatus;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
}
