package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wish {
	private int proNo;
	
	private String proName;
	
	private int memberNo;
	
	private char wishStat;
	
	private Date wishDate;
}
