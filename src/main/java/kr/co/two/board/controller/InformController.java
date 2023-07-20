package kr.co.two.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.two.board.dto.InformDTO;
import kr.co.two.board.service.InformService;

@Controller
public class InformController {
	
	@Autowired InformService service;

	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@GetMapping(value = "/informWrite.go")
	public String informWrite() {
		
	
		
		return "informWrite";
	}
	
	   @PostMapping(value = "/informWrite.do")
	   public ModelAndView infromWriteDo(InformDTO dto) {
	      logger.info(dto.getSubject()+"/"+dto.getMember_id());
	      logger.info("content size : "+dto.getContent().length());
	      logger.info("필독 등록 : "+dto.isIs_form());
	      return service.informWriteDo(dto);
	   }
	
	@GetMapping(value = "/informList.go")
	public String informList(Model model, HttpSession session) {
		
		String member_id = (String) session.getAttribute("loginId");
		logger.info("member_id : "+ member_id);
		
		int admin = service.adminChk(member_id);
		

		model.addAttribute("admin", admin);
		logger.info("admin : "+ admin);
		
		return "informList";
	}
	
	   @PostMapping(value = "/informList.ajax")
	   @ResponseBody
	   public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
				 @RequestParam String opt,@RequestParam String keyword){
			
			return service.listCall(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
	   }
	
//	@GetMapping(value = "/informList.do")
//	public ModelAndView informListDo() {
//		
//		return service.informList();
//	}
	
	   @GetMapping(value = "/informDetail.do")
	   public ModelAndView detail(@RequestParam String board_id, @RequestParam String member_id) {
	      return service.informDetail(board_id,member_id);
	   }
	   
	   @GetMapping(value = "/informUpdate.go")
	   public ModelAndView informUpdate(String board_id) {
		   
		   return service.informUpdate(board_id);
	   }
	   
	   @PostMapping(value = "/informUpdate.do")
	   public String informUpdateDo(@RequestParam HashMap<String, Object> params) {
		   logger.info("update Params : "+params);
		   logger.info("is_form : "+ params.get("is_form"));
		   
		   // 필독이 null로 들어오면 0, 체크 돼면 1
		    int isForm = (params.get("is_form") == null) ? 0 : 1;
		    params.put("is_form", isForm);

		   return service.informUpdateDo(params);
	   }
	   
	   @GetMapping(value = "/informDel.do")
	   public ModelAndView delete(String board_id, RedirectAttributes ratt) {
		   return service.delete(board_id, ratt);
	   }
	   
	   @GetMapping(value = "/informDel.ajax")
	   @ResponseBody
	   public HashMap<String, Object> informDel(@RequestParam(value="delList[]") ArrayList<String> delList){
		   
		   logger.info("선택 후 삭제 :"+delList);
		   return service.informDel(delList);
	   }
	   

	   
	   @GetMapping(value = "/is_formDel.ajax")
	   @ResponseBody
	   public HashMap<String, Object> is_formDel(@RequestParam(value="is_formList[]") ArrayList<String> is_formList){
		   
		   logger.info("is_formDel : "+is_formList);
		   return service.is_formDel(is_formList);
	   }
	   
	   
	   
}

