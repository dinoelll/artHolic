package kr.co.two.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.board.service.BriefingService;

@Controller
public class BriefingController {

	@Autowired BriefingService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
