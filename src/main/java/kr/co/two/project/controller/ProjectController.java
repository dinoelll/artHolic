package kr.co.two.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired ProjectService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
