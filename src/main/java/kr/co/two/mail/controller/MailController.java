package kr.co.two.mail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.two.mail.service.MailService;

@Controller
public class MailController {

	@Autowired MailService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping(value="/inBox.go")
	public String inBox() {
		
		return "inBox";
	}
	
	@GetMapping(value="/selfBox.go")
	public String selfBox() {
		
		return "selfBox";
	}
	
	@GetMapping(value="/sendBox.go")
	public String sendBox() {
		
		return "sendBox";
	}
	
	@GetMapping(value="/importantBox.go")
	public String importantBox() {
		
		return "importantBox";
	}
	
	@GetMapping(value="/mailWrite.go")
	public String mailWrite() {
		
		return "mailWrite";
	}
	
	@GetMapping(value="/trashBox.go")
	public String trashBox() {
		
		return "trashBox";
	}
	
	@GetMapping(value="/searchBox.go")
	public String searchBox() {
		
		return "searchBox";
	}
	
	@GetMapping(value="/selfBoxWrite.go")
	public String selfBoxWrite() {
		
		return "selfBoxWrite";
	}
	
	@GetMapping(value="/mailDetail.go")
	public String mailDetail() {
		
		return "mailDetail";
	}
	
	@GetMapping(value="/selfMailDetail.go")
	public String selfMailDetail() {
		
		return "selfMailDetail";
	}
	
	@GetMapping(value="/writeComplete.go")
	public String writeComplete() {
		
		return "writeComplete";
	}
	
	
}
