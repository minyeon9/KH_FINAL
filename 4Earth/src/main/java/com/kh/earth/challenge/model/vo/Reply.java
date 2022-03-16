package com.kh.earth.challenge.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	
	private int replyNo;
	
	private int memNo;
	
	private int chalNo;
	
	private String content;	
	
	private Date replyDate;
	
	private Date modifyDate;
	
	private String modifyImgName;
	
	private String id;
	
}
