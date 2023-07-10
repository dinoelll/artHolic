package kr.co.two.project.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	ProjectService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping(value = "/projectList.go")
	public String projectList() {

		return "projectList";
	}

	@PostMapping(value = "/projectList.ajax")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String keyword) {

		return service.listCall(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword);
	}

	@PostMapping(value = "/projectWrite.do")
	public String projectWrite(@RequestParam HashMap<String, Object> params, Model model) {

		logger.info("params" + params);

		  String msg = "다시 시도해주세요.";
		  
		  int row = service.projectWrite(params); 
		  if (row==1) { 
			  msg = "프로젝트가 등록되었습니다."; 
			 } 
		  	model.addAttribute("msg", msg);

		return "redirect:/projectList.go";
	}

	@RequestMapping(value = "/projectCalendar.go")
	public String projectCalendar() {

		return "projectCalendar";
	}

	@RequestMapping(value = "/projectPeed.go")
	public String projectPeed() {

		return "projectPeed2";
	}
	
	/*
	 * @GetMapping(value="/feedWrite.go") public String feedWriteGo(Model model) {
	 * 
	 * return "feedWrite"; }
	 * 
	 * @RequestMapping(value = "/feedWrite.do") public String
	 * feedWrite(MultipartFile[] attachment,
	 * 
	 * @RequestParam HashMap<String, String> params, Model model) {
	 * logger.info("params : " + params); logger.info("intsert 접근 : "); return
	 * service.feedWrite(attachment, params, model); }
	 */

	@RequestMapping(value = "/projectDetail.go")
	public String projectDetail() {

		return "projectDetail";
	}

	@RequestMapping(value = "/modals.go")
	public String modals() {

		return "modals";
	}

	@RequestMapping(value = "/calendar.go")
	public String calendar() {

		return "calendar";
	}

	@RequestMapping(value = "/profile.go")
	public String profile() {

		return "profile";
	}

	@RequestMapping(value = "/uploadPeed.ajax")
	@ResponseBody
	public HashMap<String, String> upload(@RequestParam HashMap<String, String> params) {

		logger.info("params:" + params);

		return params;
	}
}
