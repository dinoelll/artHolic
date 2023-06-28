package kr.co.two.board.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.board.dto.InformDTO;
import kr.co.two.board.service.InformService;

@Controller
public class InformController {
	
	@Autowired InformService service;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping(value = "informWrite.go")
	public String informWrite() {
		
		return "informWrite";
	}
	
	@GetMapping(value = "informList.go")
	public String informList() {
		
		return "informList";
	}
	
	@GetMapping(value = "informList.do")
	public ModelAndView informListDo() {
		
		return service.informList();
	}
	
	   @PostMapping(value = "/informWrite.do")
	   public ModelAndView infromWriteDo(InformDTO dto) {
	      logger.info(dto.getSubject()+"/"+dto.getMember_id());
	      logger.info("content size : "+dto.getContent().length());
	      return service.informWriteDo(dto);
	   }


	
}
