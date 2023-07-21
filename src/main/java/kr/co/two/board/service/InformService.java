package kr.co.two.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

//	public ModelAndView informList() {
//		
//		ArrayList<InformDTO> informList = dao.informList();
//		ModelAndView mav = new ModelAndView("informList");
//		mav.addObject("informList", informList);
//		
//		return mav;
//	}
	
	   @Transactional
	   public ModelAndView informDetail(String board_id, String member_id) {
	      InformDTO dto = dao.informDetail(board_id,member_id);
	      ModelAndView mav = new ModelAndView("informDetail");
	      mav.addObject("inform", dto);
	      
	      return mav;
	   }

	   
	public String informUpdateDo(HashMap<String, Object> params) {
		
		logger.info("updateDo : "+params);
		String page = "redirect:/informDetail.do";
		
		/*
		 * if(dao.informUpdateDo(params)>0) { page =
		 * "redirect:/informDetail.do?board_id="+params.get("board_id"); }
		 */
		
		// member_id 값이 있는 경우, URL에 추가합니다.
		if (params.containsKey("member_id")) {
	        page += "?member_id=" + params.get("member_id");
	    }

	    // board_id 값이 있는 경우, URL에 추가합니다.
	    if (params.containsKey("board_id")) {
	        page += "&board_id=" + params.get("board_id");
	    }

	    if (dao.informUpdateDo(params) > 0) {
	        // 리다이렉트 URL에 추가된 파라미터를 유지하면서 리다이렉트합니다.
	        return page;
	    }
	    
	    return "redirect:/informDetail.do"; // 실패 시 이동할 페이지를 지정합니다.
	}


	@Transactional
	public ModelAndView informUpdate(String board_id) {
		InformDTO dto = dao.informUpdate(board_id);
	      ModelAndView mav = new ModelAndView("informUpdate");
	      mav.addObject("inform", dto);
	      
	      return mav;
		
	}

	public ModelAndView delete(String board_id, RedirectAttributes ratt) {
		ModelAndView mav = new ModelAndView("redirect:/informList.go");
		int success = dao.delete(board_id);
		String msg = "삭제에 실패 했습니다.";
		if(success > 0) {
			msg = "삭제에 성공 했습니다.";
			ratt.addFlashAttribute("msg", msg);
		}
		return mav;
	}

	public HashMap<String, Object> informDel(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (String id : delList) {
			dao.delete(id);
		}
		return map;
	}

	public HashMap<String, Object> listCall(int page,int cnt, String opt, String keyword) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int offset = (page-1)*cnt; 
		
		int total = dao.totalCount(opt,keyword); // 12
		 // cnt = 10
		int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
		
		logger.info("total :"+total);
		logger.info("range :"+range);
		logger.info("before page :"+page);
		
		page = page>range ? range : page;
		
		logger.info("after page :"+page);
		
		map.put("currPage", page);
		map.put("pages", range);
		ArrayList<InformDTO> list = dao.listCall(opt, keyword,cnt, offset);
		map.put("informList", list);
		return map;
	}

	public HashMap<String, Object> is_formDel(ArrayList<String> is_formList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (String id : is_formList) {
			dao.is_formDel(id);
		}
		return map;
	}

	public int adminChk(String member_id) {
		
		return dao.adminChk(member_id);
	}


}
