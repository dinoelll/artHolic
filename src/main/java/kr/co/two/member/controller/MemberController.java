package kr.co.two.member.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired MemberService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value="/employeeWrite")
	public String employeeWrite() {
		
		logger.info("employeeWrite Controller");
		
		return "employeeWrite";
	}
	
	@RequestMapping(value="/employeeList.go")
	public String employeeList() {
		
		logger.info("employeeList Controller");
		
		return "employeeList";
	}
	
	@RequestMapping(value="/employeeList.ajax")
	@ResponseBody
	public HashMap<String, Object> employeeListCall(@RequestParam HashMap<String,Object> params) {
		
		logger.info("employeeList Call Controller");
		return service.employeeList(params);
	}
	
	@PostMapping(value="/join.do")
	public String employeeJoin() {
		
		logger.info("employeeJoin Controller");
		
		return null;
	}
}
