package kr.co.two.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.two.main.service.MainService;

@Controller
public class MainController {

	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/main")
	public String main(@RequestParam String id, HttpSession session) {
		
		return "main";
	}
	
	@GetMapping(value="/example.go")
	public String example() {
		
		return "example";
	}
	
	
	
	
}
