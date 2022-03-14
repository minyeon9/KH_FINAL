package com.kh.earth.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	
	private String id;
	
	private String password;
	
	private String name;
	
	private String email;
	
	private String phone;
	
	private String postcode;
	
	private String address;
	
	private String extra_address;

	private String detail_address;
	
	private String status;
	
	private String member_type;
	
	private String platform_type;

	private String img_name;
	
	private String modify_img_name;
	
	private Date enrollDate;
	
	private Date modifyDate;

	public Member(String id, String password, String name) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
	}
	
	
}
