package kr.co.two.board.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.board.dao.InformDAO;
import kr.co.two.board.dto.InformDTO;

@Service
public class InformService {
	
	@Autowired InformDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());

	
	
	
	   public ModelAndView informWriteDo(InformDTO dto) {
		      ModelAndView mav = new ModelAndView();
		      String page = "informWrite";
		      if(dao.informWriteDo(dto)>0) {
		         page = "redirect:/informList.go";
		      }
		      mav.setViewName(page);
		      return mav;
		      
		   }




	public ModelAndView informList() {
		
		ArrayList<InformDTO> list = dao.informList();
		ModelAndView mav = new ModelAndView("list");
		mav.addObject("list", list);
		
		return mav;
	}

}
