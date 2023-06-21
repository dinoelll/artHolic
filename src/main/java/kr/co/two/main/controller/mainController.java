package kr.co.two.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.two.main.service.mainService;

@Controller
public class mainController {

	@Autowired mainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/")
	public String main() {
		
		return "main";
	}
}
