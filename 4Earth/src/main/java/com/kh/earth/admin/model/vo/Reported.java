package com.kh.earth.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reported {
	private int No;
	
	private String id;
	
	private int reportedMemberNo;
	
	private String member_type;
	
	private String name;
	
	private String status;
	
	private Date enrollDate;
	
	private Date modifyDate;
	
	private int reportedTimes;
}
