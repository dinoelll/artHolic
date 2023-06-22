package kr.co.two.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.two.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());

}
