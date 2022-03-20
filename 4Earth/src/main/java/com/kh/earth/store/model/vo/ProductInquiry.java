package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductInquiry {
	private int proNo;
	
	private int memberNo;
	
	private String memberId;
	
	private int inqNo;
	
	private Date inqDate;
	
	private String inqDateFormat;
	
	private Date inqModDate;
	
	private String inqTitle;
	
	private String inqContent;
	
	private String inqStat;
	
	private String inqSecret; // 비밀글 여부
	
	private String inqAns;
	
	private Date inqAnsDate;
}
