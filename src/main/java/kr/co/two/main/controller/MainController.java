package kr.co.two.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.main.dto.MainDTO;
import kr.co.two.main.service.MainService;

@Controller
public class MainController {

	@Autowired MainService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/")
	public String login() {
		
		return "login";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main(HttpSession session, Model model) {
		
		
        String member_id = (String) session.getAttribute("loginId");
        session.getAttribute("admin");

        MainDTO memberDto = service.mainMember(member_id);
        model.addAttribute("member", memberDto);
        MainDTO AnnaulDto = service.myAnnaul(member_id);
        model.addAttribute("Annaul", AnnaulDto);

        String storedPassword = service.getPassword(member_id); // 암호화된 비밀번호 가져오기
        String inputPassword = "1111"; // 비교할 비밀번호 입력

        PasswordEncoder encoder = new BCryptPasswordEncoder();
        boolean isMatch = encoder.matches(inputPassword, storedPassword);

        if (isMatch) {
            model.addAttribute("msg", "현재 비밀번호는 임시 비밀번호입니다. 비밀번호를 변경해주세요.");
        }

        return "main";
    }
	
	@RequestMapping(value="/mainInformList.ajax", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> informList(@RequestParam HashMap<String,Object> params,HttpSession session) {
		
		logger.info("informList Call Controller");
		logger.info("params :"+params);
		String member_id = (String) session.getAttribute("loginId");
		
		return service.informList(params);
	}
	
	@RequestMapping(value="/mainmyMaillistCall.ajax", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> myMailList(@RequestParam HashMap<String,Object> params,HttpSession session) {
		
		logger.info("myMailList Call Controller");
		logger.info("params :"+params);
		String member_id = (String) session.getAttribute("loginId");
		logger.info("member_id :"+member_id);
		
		return service.myMailList(member_id);
	}
	
	@RequestMapping(value="/myPaymentlistCall.ajax", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> myPaymentlist(@RequestParam HashMap<String,Object> params,HttpSession session) {
		
		logger.info("myPaymentlist Call Controller");
		logger.info("params :"+params);
		String member_id = (String) session.getAttribute("loginId");
		logger.info("member_id :"+member_id);
		
		return service.myPaymentlist(member_id);
	}
	
	@RequestMapping(value="/myProjectlistCall.ajax", method=RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> myProjectlist(@RequestParam HashMap<String,Object> params,HttpSession session) {
		
		logger.info("myProjectlist Call Controller");
		logger.info("params :"+params);
		String member_id = (String) session.getAttribute("loginId");
		logger.info("member_id :"+member_id);
		
		return service.myProjectlist(member_id);
	}

	
	
	
}
