package kr.co.two.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.two.board.dto.BriefingDTO;
import kr.co.two.board.service.BriefingService;

@Controller
public class BriefingController {

	
	  private final BriefingService service;
	  
	  public BriefingController(BriefingService service) { this.service = service;
	  }
	  
	  Logger logger = LoggerFactory.getLogger(getClass());
	  
	  @RequestMapping(value= "/briefingList.go") 
	  public String main(Model model, HttpSession session) {
		  
			String member_id = (String) session.getAttribute("loginId");
			logger.info("member_id : "+ member_id);
			
			int admin = service.adminChk(member_id);

			model.addAttribute("admin", admin);
			logger.info("admin : "+ admin);
	  
			return "briefingList"; 
	  
	  }
	  
	  
	  @PostMapping(value="/briefingList.ajax")
	  @ResponseBody 
	  public HashMap<String, Object> list(@RequestParam String page,@RequestParam String cnt,
	  @RequestParam String opt,@RequestParam String keyword) {
	  
	  return service.list(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword); 
	  
	  }
	  
	  @RequestMapping(value="/briefingWrite.go") 
	  public String writeForm() {
		  
		  
	  
		  return "briefingWrite"; 
	  }
	  
	  
	  
	  @PostMapping(value="/briefingWrite.do") 
	  public ModelAndView write(BriefingDTO dto) { 
		  logger.info(dto.getSubject()+"/"+dto.getUser_name());
		  logger.info("content size:"+dto.getContent().length()); 
	  
	  	return service.write(dto); 
	  }
	  
	  
	  
	  @GetMapping(value="/briefingDetail.do") public ModelAndView
	  detail(@RequestParam String board_id, @RequestParam String member_id) {
		  
		  
		  return service.detail(board_id,member_id); 
	  }
	  
	   @GetMapping(value = "/briefingDel.do")
	   public ModelAndView delete(String board_id, RedirectAttributes ratt) {
		   return service.delete(board_id, ratt);
	   }
	   
	   @GetMapping(value = "/briefingDel.ajax")
	   @ResponseBody
	   public HashMap<String, Object> briefingDel(@RequestParam(value="delList[]") ArrayList<String> delList){
		   
		   logger.info("왜 안돼? :"+delList);
		   return service.briefingDel(delList);
	   }
	  
	   @GetMapping(value = "/briefingUpdate.go")
	   public ModelAndView briefingUpdate(String board_id) {

		   return service.briefingUpdate(board_id);
	   }
	   
	   @PostMapping(value = "/briefingUpdate.do")
	   public String briefingUpdateDo(@RequestParam HashMap<String, Object> params) {
		   logger.info("params : "+params);
		   return service.briefingUpdateDo(params);
	   }
	  
	 

}
