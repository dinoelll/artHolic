package kr.co.two.board.service;



import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;


import kr.co.two.board.dao.BriefingDAO;
import kr.co.two.board.dto.BriefingDTO;

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
		map.put("list", list);
		return map;
		
	}
	
	
	
	public ModelAndView write(BriefingDTO dto) {
		ModelAndView mav = new ModelAndView();
		String page = "writeForm";
		if (dao.write(dto)>0) {
			page ="redirect:/list.do";
		}
		mav.setViewName(page);
		return mav;
	}
	
	@Transactional
	public ModelAndView detail(String idx) {
		dao.bHit(idx);
		BriefingDTO dto = dao.detail(idx);
		
		ModelAndView mav = new ModelAndView("briefingDetail");
		mav.addObject("bbs", dto);
		
		return mav;
	}





	public ModelAndView delete(String idx) {
		String page = "/detail.do?idx="+idx;
		String msg = "다시 시도해주세요";
		ModelAndView mav = new ModelAndView();
		if (dao.delete(idx)>0) {
			page="list";
			msg="게시물이 삭제되었습니다";
		}
		mav.addObject("msg", msg);
		mav.setViewName(page);
		
		
		
		return mav;
	}

}
