package com.kh.earth.store.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Application {
	private int appNo;
	
	private int memberNo;
	
	private String appName;
	
	private String appUrl;
	
	private String appTitle;
	
	private String appContent;
	
	private int appStatNo;
	
	private int appCatNo;
	
	private String appCatName;
	
	private Date appDate;
}
