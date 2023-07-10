package kr.co.two.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

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
		map.put("projectList", list);
		return map;
	}


	
	public int projectWrite(HashMap<String, Object> params) {
	 
		return dao.projectWrite(params); }
	 /*
	 * public String feedWrite(MultipartFile[] attachment, HashMap<String, String>
	 * params, Model model) { String page = "redirect:/projectDetail.go";
	 * 
	 * ProjectDTO dto = new ProjectDTO(); dto.setMember_id(params.get("member_id"));
	 * dto.setContent(params.get("content"));
	 * dto.setProject_id(Integer.parseInt(params.get("project_id"))); int row =
	 * dao.feedWrite(dto);
	 * 
	 * String feed_id = dto.getFeed_id();
	 * 
	 * if(row==1) { // 업로드된 자료실 게시물이 1이라면
	 * 
	 * for (MultipartFile file : attachment) {
	 * 
	 * logger.info("업로드할 file 있나요? :"+!file.isEmpty());
	 * 
	 * if(!file.isEmpty()) { attachmentSave(feed_id, file, "프로젝트 첨부파일"); }
	 * 
	 * try { // 쓰레드 0.001초 지연으로 중복파일명 막자 Thread.sleep(1); } catch
	 * (InterruptedException e) { e.printStackTrace(); }
	 * 
	 * } } page = "redirect:/projectDetail.go?id="+params.get("project_id");
	 * 
	 * return page;
	 * 
	 * }
	 * 
	 * private void attachmentSave(String feed_id, MultipartFile file, String
	 * string) { // TODO Auto-generated method stub
	 * 
	 * }
	 */
	
}
