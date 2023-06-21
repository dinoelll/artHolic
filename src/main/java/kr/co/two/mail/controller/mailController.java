package kr.co.two.mail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.mail.service.mailService;

@Controller
public class mailController {

	@Autowired mailService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
