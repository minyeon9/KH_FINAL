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
}
