package com.kh.earth.challenge.model.vo;

import java.util.Date;

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
	
	private Date chalDate;
	
	private char chalStatus;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
}
