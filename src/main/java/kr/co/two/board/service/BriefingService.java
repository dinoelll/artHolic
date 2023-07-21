package kr.co.two.board.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.two.board.dao.BriefingDAO;
import kr.co.two.board.dto.BriefingDTO;
import kr.co.two.board.dto.InformDTO;

@Service
public class BriefingService {

	Logger logger = LoggerFactory.getLogger(getClass());

	private final BriefingDAO dao;

	public BriefingService(BriefingDAO dao) {
		this.dao = dao;
	}


	


	public HashMap<String, Object> list(int page,int cnt, String opt, String keyword) {

		HashMap<String, Object>map = new HashMap<String,Object>();

		int offset = (page-1)*cnt; 
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		
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
		ArrayList<BriefingDTO> list = dao.list(opt, keyword,cnt, offset);
		map.put("briefingList", list);
		return map;
		
	}
	
	
	
	   public ModelAndView write(BriefingDTO dto) {
		      ModelAndView mav = new ModelAndView();
		      String page = "briefingWrite";
		      if(dao.write(dto)>0) {
		         page = "redirect:/briefingList.go";
		      }
		      mav.setViewName(page);
		      return mav;
		      
		   }
	
	@Transactional
	public ModelAndView detail(String board_id, String member_id) {
		BriefingDTO dto = dao.detail(board_id,member_id);
		
		ModelAndView mav = new ModelAndView("briefingDetail");
		mav.addObject("briefing", dto);
		
		return mav;
	}

	public ModelAndView delete(String board_id, RedirectAttributes ratt) {
		ModelAndView mav = new ModelAndView("redirect:/briefingList.go");
		int success = dao.delete(board_id);
		String msg = "삭제에 실패 했습니다.";
		if(success > 0) {
			msg = "삭제에 성공 했습니다.";
			ratt.addFlashAttribute("msg", msg);
		}
		return mav;
	}

	public HashMap<String, Object> briefingDel(ArrayList<String> delList) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (String id : delList) {
			dao.delete(id);
		}
		return map;
	}
	
	
	public String briefingUpdateDo(HashMap<String, Object> params) {
		
		logger.info("updateDo : "+params);
		
		String page = "redirect:/briefingDetail.do";
		
		/*
		 * if(dao.briefingUpdateDo(params)>0) { page =
		 * "redirect:/briefingDetail.do?board_id="+params.get("board_id"); }
		 */
		
		
		if (params.containsKey("member_id")) {
	        page += "?member_id=" + params.get("member_id");
	    }

	    // board_id 값이 있는 경우, URL에 추가합니다.
	    if (params.containsKey("board_id")) {
	        page += "&board_id=" + params.get("board_id");
	    }

	    if (dao.briefingUpdateDo(params) > 0) {
	        // 리다이렉트 URL에 추가된 파라미터를 유지하면서 리다이렉트합니다.
	        return page;
	    }
	    
	    return "redirect:/briefingDetail.do"; // 실패 시 이동할 페이지를 지정합니다.
	}
		 

	@Transactional
	public ModelAndView briefingUpdate(String board_id) {
		BriefingDTO dto = dao.briefingUpdate(board_id);
	      ModelAndView mav = new ModelAndView("briefingUpdate");
	      mav.addObject("briefing", dto);
	      
	      return mav;
		
	}





	public int adminChk(String member_id) {
		
		return dao.adminChk(member_id);
	}



}
