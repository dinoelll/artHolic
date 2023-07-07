package kr.co.two.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.project.dao.ProjectDAO;
import kr.co.two.project.dto.ProjectDTO;

@Service
public class ProjectService {

	@Autowired ProjectDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
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
		ArrayList<ProjectDTO> list = dao.listCall(opt, keyword,cnt, offset);
		map.put("informList", list);
		return map;
	}
	
	   public int projectWrite(HashMap<String, Object> params) {

		      return dao.projectWrite(params);
		   }
	
}
