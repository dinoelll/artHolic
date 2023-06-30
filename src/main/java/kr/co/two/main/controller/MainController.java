package kr.co.two.main.controller;

import javax.servlet.http.HttpSession;

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

import kr.co.two.main.service.MainService;

@Controller
public class MainController {

	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/")
	public String main() {
		
		return "login";
	}
	
	@GetMapping(value="/example.go")
	public String example() {
		
		return "example";
	}
	
	@PostMapping(value="/login.ajax")
	@ResponseBody
	public String login(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {
	      
		String page = "example";
		
		if(service.login(id, pw)) {
			page = "/";
			session.setAttribute("loginId", id);
		}else {
			model.addAttribute("msg","id 또는 pw를 확인 해 주세요");
		}
		return page;
	   }
	
	
}
