package com.kh.earth.challenge.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Month {
	private int category;
	
	private int chalNo;
	
	private String chalTitle;
	
	private String chalContent;
	
	private String originalFilename;
	
	private String renamedFilename;
	
	private int chalPoint;
	
	private int chalCount;
	
	private Date startDate;
	
	private Date endDate;
	
	private char chalStatus;
	
	private List<Reply> replies;
	
	private List<NestedReply> nestedReplies;
	
	private int memNo;
}
