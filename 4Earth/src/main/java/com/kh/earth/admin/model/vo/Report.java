package com.kh.earth.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
	private int reportNo;
	
	private int reportedMemberNo;
	
	private int reportMemberNo;
	
	private String reportedMemberName;
	
	private String reportMemberName;
	
	private Date reportDate;
	
	private String reportTitle;
	
	private String reportContent;
	
	private String reportCategory;
	
	private char reportStatus;
}
