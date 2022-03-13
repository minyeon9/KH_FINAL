package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int orderNo;
	
	private int memberNo;
	
	private String memberId;
	
	private int proNo;
	
	private int proOpt;
	
	private String proOptName;
	
	private Date revDate;
	
	private String revTitle;
	
	private String revContent;
	
	private double revRating;
	
	private String originalFileName;
	
	private String renamedFileName;
}
