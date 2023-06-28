package kr.co.two.project.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired ProjectService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/projectList.go")
	public String projectList() {
		
		return "projectList";
	}
	
	@RequestMapping(value="/projectCalendar.go")
	public String projectCalendar() {
		
		return "projectCalendar";
	}
	
	@RequestMapping(value="/projectPeed.go")
	public String projectPeed() {
		
		return "projectPeed2";
	}
	
	@RequestMapping(value="/projectDetail.go")
	public String projectDetail() {
		
		return "projectDetail";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="/modals.go")
	public String modals() {
		
		return "modals";
	}
	
	@RequestMapping(value="/calendar.go")
	public String calendar() {
		
		return "calendar";
	}
	

	@RequestMapping(value="/profile.go")
	public String profile() {
		
		return "profile";
	}
	
	
	@RequestMapping(value="/uploadPeed.ajax")
	@ResponseBody
	public HashMap<String, String> upload(@RequestParam HashMap<String, String>params) {
		
		logger.info("params:"+params);
		
		
		return params;
	}
}
