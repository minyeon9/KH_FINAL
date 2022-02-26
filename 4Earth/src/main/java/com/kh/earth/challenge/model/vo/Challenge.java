package com.kh.earth.challenge.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Challenge {
	
	private int chalNo;
	
	private String chalCategory;
	
	private List<Today> today;
	
//	private List<Month> Month;
	
}
