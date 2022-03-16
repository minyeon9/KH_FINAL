package com.kh.earth.common.util;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class MailUtil {
	
	private static JavaMailSender mailSender;
	
	@Autowired
	public void MailUtil(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	public static int mailSend(String title, String from, String text, String to, String cc) {
		if(from == null || from.equals("")) {
			from = "4earthkh@gmail.com";
		}
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			message.setFrom(new InternetAddress(from));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			if(cc != null && !cc.equals("")) {
				message.setRecipient(Message.RecipientType.CC, new InternetAddress(cc));
			}
			
			message.setSubject(title);
			// message.setText(text);                 				 // 텍스트만 보낼 경우
			message.setContent(text, "text/html; charset=UTF-8");    // html 형식(+한글)으로 보낼 경우
			
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return 1;
	}
}