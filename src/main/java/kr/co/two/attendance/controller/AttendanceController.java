package kr.co.two.attendance.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.attendance.service.AttendanceService;

@Controller
public class AttendanceController {
	
	@Autowired AttendanceService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
