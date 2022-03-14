package com.kh.earth.common.util;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;


public class SendSMSTwilio {
	
	  // Find your Account Sid and Token at twilio.com/user/account
	  public static final String ACCOUNT_SID = "AC16c80f4eb591bd2d04be3c5dda19aa6f"; // 발급받은 SID
	  public static final String AUTH_TOKEN = "2bcd7a922269f711a9a412029cc15a81";  // 발급받은 TOKEN
	  
	  // SMS 전송
	  public static int sendSMS (String country, String phoneNum) {

		Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
	    
	    // 휴대폰 인증번호 생성
	    int authNum = randomRange(100000, 999999);
	    
	    
	    // 전송대상 휴대폰 번호
	    String sendTarget = "+"+ country + phoneNum;
	    
	    // 전송 메세지
	    String authMsg = "[4Earth] 인증번호는 [" + authNum + "]"+"입니다.";
	    
	    
	    Message message = Message.creator(
	    	// to
	    	new PhoneNumber(sendTarget),
	        // from
	    	new PhoneNumber("+15392691610"),  // Twilio에서 발급받은 번호
	        // message
	    	authMsg).create();
	    
		return authNum;
		
	  }
	    
	  // 인증번호 범위 지정
	  public static int randomRange(int n1, int n2) {
	    return (int) (Math.random() * (n2 - n1 + 1)) + n1;
	  }
	  
	  
	};