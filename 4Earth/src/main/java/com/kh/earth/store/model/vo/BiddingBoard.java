package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BiddingBoard {
	private int boardNo;
	
	private int memberNo;
	
	private int bidNo;
	
	private String boardContent;
	
	private Date boardDate;
	
	private String boardStat;
	
	private String memberId;
}
