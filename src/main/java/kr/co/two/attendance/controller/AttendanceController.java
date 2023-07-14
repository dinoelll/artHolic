package kr.co.two.attendance.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.attendance.dto.AttendanceDTO;
import kr.co.two.attendance.service.AttendanceService;

@Controller
public class AttendanceController {

	@Autowired
	AttendanceService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/attendance.go")
	public String attendance() {

		return "attendance";
	}
	
	
	
	
	@RequestMapping(value = "/attendance.ajax")
	@ResponseBody
	public HashMap<String, Object> attendance(@RequestParam String member_id) {
		/* String member_id =(String) session.getAttribute("loginId"); */
		logger.info("불러올아이디!!!!!!!!!:"+member_id);
		HashMap<String , Object>map = new HashMap<String, Object>();
		map.put("attendance", service.attendance(member_id));
	
		return map;
	}
	
	@RequestMapping(value = "/atList.ajax")
	@ResponseBody
	public HashMap<String, Object> atList(@RequestParam String page,@RequestParam String cnt,@RequestParam String opt,@RequestParam String keyword) {
		

		return service.atList(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
	}
	
	
}
