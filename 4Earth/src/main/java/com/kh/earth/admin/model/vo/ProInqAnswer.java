package com.kh.earth.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProInqAnswer {
	private int proNo;
	
	private int memberNo;
	
	private int inqNo;
	
	private String inqAns;
	
	private Date inqAnsDate;
}
