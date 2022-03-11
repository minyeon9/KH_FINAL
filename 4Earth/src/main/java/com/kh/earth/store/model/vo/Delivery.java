package com.kh.earth.store.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Delivery {
	private int orderNo;
	
	private int memberNo;
	
	private String delStat;
	
	private String delName;
	
	private String delPhone;
	
	private String delPostcode;
	
	private String delAdd;
	
	private String delExtraAdd;
	
	private String delDetailAdd;
	
	private String delMsg;
	
	private String delCo; // 택배사
	
	private int delIv; // 송장번호
}
