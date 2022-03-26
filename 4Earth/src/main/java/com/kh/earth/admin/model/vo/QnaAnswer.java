package com.kh.earth.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QnaAnswer {
	private int answerNo;
	
	private int qnaNo;
	
	private int writerNo;
	
	private String answerContent;
	
	private Date answerDate;
	
	private char answerStatus;
	
	private int no;
	
	private String writerId;
	
	private int cat;
	
	private String category;
	
	private int categoryNo;
	
	private String title;
	
	private String content;
	
	private String originalFileName;
	
	private String renamedFileName;
	
	private int readCount;
	
	private String status;
	
	private String qnaAnswer;
	
	private Date createDate;
	
	private Date modifyDate;
}
