package kr.co.two.mail.controller;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.mail.dto.MailDTO;
import kr.co.two.mail.service.MailService;

@Controller
public class MailController {

	@Autowired MailService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	// 받은 메일함 이동
	@GetMapping(value="/inBox.go")
	public String inBox() {
		
		return "inBox";
	}
	
	// 내게 쓴 메일함 이동
	@GetMapping(value="/selfBox.go")
	public String selfBox() {
		
		return "selfBox";
	}
	
	// 보낸 메일함 이동
	@GetMapping(value="/sendBox.go")
	public String sendBox() {
		
		return "sendBox";
	}
	
	// 중요 메일함 이동
	@GetMapping(value="/importantBox.go")
	public String importantBox() {
		
		return "importantBox";
	}
	
	// 메일쓰기 이동
	@GetMapping(value="/mailWrite.go")
	public String mailWrite() {
		
		return "mailWrite";
	}
	
	// 휴지통 이동
	@GetMapping(value="/trashBox.go")
	public String trashBox() {
		
		return "trashBox";
	}
	
	// 검색결과 이동
	@GetMapping(value="/searchBox.go")
	public String searchBox() {
		
		return "searchBox";
	}
	
	// 내게쓰기 이동
	@GetMapping(value="/selfBoxWrite.go")
	public String selfBoxWrite() {
		
		return "selfBoxWrite";
	}
	
	// 메일 상세보기 이동
	@GetMapping(value="/mailDetail.go")
	public String mailDetail() {
		
		return "mailDetail";
	}
	
	//내게 쓴 메일 이동
	@GetMapping(value="/selfMailDetail.go")
	public String selfMailDetail() {
		
		return "selfMailDetail";
	}
	
	// 메일 전송 완료 페이지 이동
	@GetMapping(value="/writeComplete.go")
	public String writeComplete() {
		
		return "writeComplete";
	}
	
	// 메일 보내기
	@PostMapping(value="/mailWrite.do")
	public String mailWrite(@RequestParam HashMap<String, Object> params, MultipartFile[] attachment, Model model) {
		
		logger.info("mail");
		logger.info("params:"+params);
		return null;
	}
	
	// 받는사람, 참조자
	@GetMapping(value="/mail/getOption.ajax")
	@ResponseBody
	public HashMap<String, Object> mailgetOptions(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MailDTO> option = service.mailgetOptions();
		map.put("option", option);
		return map;
	}
	
}
