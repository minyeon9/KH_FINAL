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
	
	private int chalNo;
	
	private Date chalDate;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private int chalCount;
	
	private char chalStatus;
	
	private int chalPoint;
	
	private char chalPointStatus;
	
	private List<Month> month;
	
}
