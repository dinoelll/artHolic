package kr.co.two.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.mypage.service.mypageService;

@Controller
public class mypageController {

	@Autowired mypageService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
