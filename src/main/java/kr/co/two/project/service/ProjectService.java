package kr.co.two.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.two.alarm.config.WebSocketHandler;
import kr.co.two.mail.dto.MailDTO;
import kr.co.two.member.dto.MemberDTO;
import kr.co.two.project.dao.ProjectDAO;
import kr.co.two.project.dto.ProjectDTO;
import kr.co.two.project.dto.ProjectEventDataDTO;

@Service
public class ProjectService {

   @Autowired
   ProjectDAO dao;

   Logger logger = LoggerFactory.getLogger(getClass());
   
   WebSocketHandler handler = null;

   @Value("${spring.servlet.multipart.location}")
   private String attachmentRoot;
   
   public ProjectService(WebSocketHandler handler) {
	   this.handler = handler;
   }

   public HashMap<String, Object> listCall(int page, int cnt, String opt, String keyword,String myproject) {

      HashMap<String, Object> map = new HashMap<String, Object>();
      int offset = (page - 1) * cnt;

      int total = dao.totalCount(opt, keyword,myproject); // 12
      // cnt = 10
      int range = total % cnt == 0 ? total / cnt : (total / cnt) + 1;

      logger.info("total :" + total);
      logger.info("range :" + range);
      logger.info("before page :" + page);

      page = page > range ? range : page;

      logger.info("after page :" + page);

      map.put("currPage", page);
      map.put("pages", range);
      ArrayList<ProjectDTO> list = dao.listCall(opt, keyword, cnt, offset,myproject);
      map.put("projectList", list);
      return map;
   }

   // 프로젝트 등록
   public int projectWrite(HashMap<String, Object> params) {

      return dao.projectWrite(params);
   }

   // 피드 작성
   public String feedWrite(MultipartFile[] attachment, HashMap<String, String> params, Model model, RedirectAttributes rttr, HttpSession sess) {
      // String id = (String) session.getAttribute("id");
      //String page = "redirect:/projectDetail.go";
	   HashMap<String , Object> map = new HashMap<String, Object>();
      logger.info("attachment : " + attachment);

      ProjectDTO dto = new ProjectDTO();
      dto.setMember_id(params.get("member_id"));
      dto.setContent(params.get("content"));
      dto.setProject_id(Integer.parseInt(params.get("project_id")));
      int row = dao.feedWrite(dto);

      String feed_id = dto.getFeed_id();
      logger.info("feed_id : " + feed_id);

      if (row == 1) { // 업로드된 자료실 게시물이 1이라면

         for (MultipartFile file : attachment) {

            logger.info("업로드할 file 있나요? :" + !file.isEmpty());

            if (!file.isEmpty()) {
               attachmentSave(feed_id, file);
            }

            try { // 쓰레드 0.001초 지연으로 중복파일명 막자
               Thread.sleep(1);
            } catch (InterruptedException e) {
               e.printStackTrace();
            }

         }
      }
      map.put("project_id", params.get("project_id"));
      map.put("project_name", params.get("project_name"));
      rttr.addFlashAttribute("map", map);
      String loginId = String.valueOf(sess.getAttribute("loginId"));
      ArrayList<ProjectDTO> list = dao.projectInfo(String.valueOf(params.get("project_id")));
      
      for (ProjectDTO projectDto : list) {
		if(!loginId.equals(projectDto.getMember_id())) {
			dao.feedAlarm(projectDto.getMember_id(), String.valueOf(params.get("project_id")));
		}
      }
      
      handler.sendAlarm("알림");
      
      return "redirect:/projectDetail.go?type=controller";

   }

   private void attachmentSave(String feed_id, MultipartFile file) {

      logger.info("!!!file : " + file);
      // 1. 파일명 추출
      String oriFileName = file.getOriginalFilename();

      // 2. 새 파일 생성 (현재시간 + 확장자)
      String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
      String newFileName = System.currentTimeMillis() + ext;
      logger.info("파일 업로드 : " + oriFileName + "=>" + newFileName + "으로 변경될 예정");

      // 3. 파일 저장
      try {
         byte[] bytes = file.getBytes();
         Path path = Paths.get(attachmentRoot + "/" + newFileName);
         Files.write(path, bytes);
         logger.info(newFileName + " upload 디렉토리에 저장 완료 !");

         dao.archivefileWrite(oriFileName, newFileName, feed_id);
      } catch (IOException e) {
         e.printStackTrace();
      }

   }

   public ArrayList<HashMap<String, String>> getAllFeed(String project_id) {

      return dao.getAllFeed(project_id);
   }
   
   public ArrayList<ProjectDTO> projectAddOption() {
	      
	      return dao.projectAddOption();
	      
	   }
   
   public String addProjectMember(HashMap<String, Object> projectInfo) {
	   ArrayList<String> list = (ArrayList<String>) projectInfo.get("approvers");
	   String project_id = (String) projectInfo.get("project_id");
	   for (String member_id : list) {
		logger.info(member_id,project_id);
		
		dao.addProjectMember(member_id,project_id);
	}
		
		return null;
	}
   
   
   public void feedDel(String feed_id, String feed_file_id) {
	   dao.fileDel(feed_file_id);
		dao.feedDel(feed_id);
		
	}
   
   @Transactional
   public ModelAndView feedUpdate(String feed_id, String feed_file_id, String project_id, String project_name) {
		ProjectDTO dto = dao.feedUpdate(feed_id,feed_file_id,project_id,project_name);
		ModelAndView mav = new ModelAndView("feedUpdate");
	    mav.addObject("feed", dto);
	    
	    return mav;
	}
   
   public void feedUpdateDo(String feed_id, String feed_file_id, String content) {
		dao.feedUpdateDo(feed_id,feed_file_id,content);
		
	}
   
   public void projectDel(String project_id) {
		dao.projectDel(project_id);
		
	}
   
   
	public ProjectDTO projectUpdateModal(String project_id) {

		return dao.projectUpdateModal(project_id);
	}
	
	public String projectUpdate(HashMap<String, String> params) {

		int success = dao.projectUpdate(params);
		logger.info("success :"+success);
		return "redirect:/projectList.go";
	}
   

   

   
   /*------------------------------------캘린더 영역---------------------------------------------*/
   
   public List<ProjectEventDataDTO> getEvents(String project_id) {
      // TODO Auto-generated method stub
      return dao.getEvent(project_id);
   }

   public void calendarUpdate(ArrayList<ProjectEventDataDTO> eventDataList) {

      for (ProjectEventDataDTO eventDataDTO : eventDataList) {
         int project_id = eventDataDTO.getProject_id();
         String title = eventDataDTO.getContent();
         OffsetDateTime start = eventDataDTO.getStart_date();
         OffsetDateTime end = eventDataDTO.getEnd_date();
         boolean allday = eventDataDTO.getAllDay();
         String backgroundColor = eventDataDTO.getBackgroundColor();
         String borderColor = eventDataDTO.getBorderColor();
         int project_calendar_id = eventDataDTO.getProject_calendar_id();

         logger.info("project_id" + project_id);
         logger.info("title" + title);
         logger.info("start" + start);
         logger.info("end" + end);
         logger.info("allday" + allday);
         logger.info("backgroundColor" + backgroundColor);
         logger.info("project_calendar_id" + project_calendar_id);

         dao.calendarUpdate(eventDataDTO);
      }

   }

   public void calendarUpdate2(ProjectEventDataDTO requestData) {
      dao.calendarUpdate2(requestData);

   }

   public int eventDelete(String project_calendar_id) {
      // TODO Auto-generated method stub
      return dao.eventDelete(project_calendar_id);
   }










}