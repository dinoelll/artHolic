package kr.co.two.project.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.two.mail.dto.MailDTO;
import kr.co.two.mypage.dto.EventDataDTO;
import kr.co.two.project.dto.ProjectDTO;
import kr.co.two.project.dto.ProjectEventDataDTO;
import kr.co.two.project.service.ProjectService;

@Controller
public class ProjectController {

   @Autowired
   ProjectService service;

   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Value("${spring.servlet.multipart.location}") private String root;

   @GetMapping(value = "/projectList.go")
   public String projectList() {

      return "projectList";
   }

   @PostMapping(value = "/projectList.ajax")
   @ResponseBody
   public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
         @RequestParam String opt, @RequestParam String keyword,@RequestParam String myproject) {
	   	logger.info(myproject);
      return service.listCall(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,myproject);
   }

   @PostMapping(value = "/projectWrite.do")
   public String projectWrite(@RequestParam HashMap<String, Object> params, Model model) {

      logger.info("params" + params);
      String startYMD[] = String.valueOf(params.get("start_date")).split("/");
      String endYMD[] = String.valueOf(params.get("end_date")).split("/");
      for (String string : startYMD) {
    	  logger.info(string);
      }
      for (String string : endYMD) {
    	  logger.info(string);
      }
      params.put("start_date", startYMD[2]+"-"+startYMD[0]+"-"+startYMD[1]);
      params.put("end_date", endYMD[2]+"-"+endYMD[0]+"-"+endYMD[1]);

      String msg = "다시 시도해주세요.";

      int row = service.projectWrite(params);
      if (row == 1) {
         msg = "프로젝트가 등록되었습니다.";
      }
      model.addAttribute("msg", msg);

      return "redirect:/projectList.go";
   }

   @RequestMapping(value = "/projectCalendar.go")
   public String projectCalendar(@RequestParam String project_id,@RequestParam String project_name, Model model) {

      logger.info(project_id);
      logger.info(project_name);
      model.addAttribute("project_id", project_id);
      model.addAttribute("project_name", project_name);

      return "projectCalendar";
   }

   @RequestMapping(value = "/projectPeed.go")
   public String projectPeed() {

      return "projectPeed2";
   }

   @GetMapping(value = "/feedWrite.go")
   public String feedWriteGo(Model model, @RequestParam String project_id, @RequestParam String project_name) {

      logger.info("프로젝트 아이디 : " + project_id);
      model.addAttribute("project_id", project_id);
      model.addAttribute("project_name", project_name);
      return "feedWrite";
   }

   @PostMapping(value = "/feedWrite.do")
   public String feedWrite(MultipartFile[] attachment, @RequestParam HashMap<String, String> params, Model model, RedirectAttributes rttr, HttpSession sess) {
      logger.info("params : " + params);
      logger.info("attachment 접근 : " + attachment);

      return service.feedWrite(attachment, params, model, rttr ,sess);
   }

   
   
   @RequestMapping(value = "/projectDetail.go", params="type=jsp", method=RequestMethod.GET)
   public String projectDetailJsp(@RequestParam String project_id, Model model, @RequestParam String project_name) {
	   	logger.info("map : " + model.getAttribute("map"));
	      // if(session.getAttribute("id") != null) {
	      // page = "project-detail";
	      model.addAttribute("project_id", project_id);
	      model.addAttribute("project_name", project_name);
	      // }
      
      return "projectDetail";
   }
   
   @RequestMapping(value = "/projectDetail.go", params="type=controller")
   public String projectDetailController(@ModelAttribute("map") HashMap<String, Object> map, Model model, HttpServletRequest req) {
	   	logger.info("map : " + map);
	      // if(session.getAttribute("id") != null) {
	      // page = "project-detail";
	      // }
	   	model.addAttribute("project_id", String.valueOf(map.get("project_id")));
	   	model.addAttribute("project_name", String.valueOf(map.get("project_name")));
      return "projectDetail";
   }

   @RequestMapping(value = "/modals.go")
   public String modals() {

      return "modals";
   }

   

   @RequestMapping(value = "/profile.go")
   public String profile() {

      return "profile";
   }

   @RequestMapping(value = "/uploadPeed.ajax")
   @ResponseBody
   public HashMap<String, String> upload(@RequestParam HashMap<String, String> params) {

      logger.info("params:" + params);

      return params;
   }

   @GetMapping(value = "/projectDetail.ajax")
   @ResponseBody
   public HashMap<String, Object> feedList(@RequestParam String project_id) {
      logger.info("detail : " + project_id);
      String page = "redirect:/projectList.go";

      // String loginId = (String) session.getAttribute("id");
      HashMap<String, Object> map = new HashMap<String, Object>();

      ArrayList<HashMap<String, String>> feedList = new ArrayList<HashMap<String, String>>();
      feedList = service.getAllFeed(project_id);

      for (HashMap<String, String> hashMap : feedList) {
         logger.info("코멘트 정보 : " + hashMap);
      }
      map.put("feedList", feedList);
      // map.put("loginId", loginId);
      map.put("project_id", project_id);

      return map;
   }
   
   
	// 파일 다운로드
	@GetMapping(value="/feed_fileDownload.do")
	public ResponseEntity<Resource> download(String photo_name) {
		
		Resource body = new FileSystemResource(root+"/"+photo_name);//BODY		
		HttpHeaders header = new HttpHeaders();//Header
		try {						
			String fileName = "이미지"+photo_name.substring(photo_name.lastIndexOf("."));
			fileName = URLEncoder.encode(fileName, "UTF-8");
			// text/... 은 문자열, image/... 이미지, application/octet-stream 은 바이너리 데이터
			header.add("Content-type", "application/octet-stream");
			// content-Disposition 은 내려보낼 내용이 문자열(inline)인지 파일(attatchment)인지 알려준다. 
			header.add("content-Disposition", "attatchment;fileName=\""+fileName+"\"");
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		//body, header, status
		return new ResponseEntity<Resource>(body, header, HttpStatus.OK);
	}
	
	
	
	
	   // 프로젝트 인원추가 셀렉트
	   @GetMapping(value="/projectAddOption.ajax")
	   @ResponseBody
	   public HashMap<String, Object> projectAddOption(){
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      ArrayList<ProjectDTO> option = service.projectAddOption();
	      map.put("option", option);
	      return map;
	   }
	   
		
		 // 프로젝트 인원추가 값 보내기
		 
		 
	     @PostMapping(value = "/addProjectMember.ajax")
		 @ResponseBody 
		 public String addProjectMember(@RequestBody HashMap<String,Object> projectInfo){
	    	
	    	logger.info("프로젝트 인원, id : "+ projectInfo);	 
		   
		 	return service.addProjectMember(projectInfo); 
		 
		  }
	     
	     @RequestMapping(value = "/feedDel.do")
	     public String feedDel(@RequestParam String feed_id, @RequestParam String feed_file_id,
	    		 @RequestParam String project_id, @RequestParam String project_name, RedirectAttributes rttr) {
	    	 
	    	 logger.info("피드 삭제 : "+ feed_id, feed_file_id,project_id,project_name);
	    	 service.feedDel(feed_id, feed_file_id);
	    	 
	    	 HashMap<String, Object> map = new HashMap<String, Object>();
	    	 map.put("project_id", project_id);
	    	 map.put("project_name", project_name);
	    	 
	    	 rttr.addFlashAttribute("map",map);

	    	 return "redirect:/projectDetail.go?type=controller";
	     }
	     
		   @GetMapping(value = "/feedUpdate.go")
		   public ModelAndView feedUpdate(@RequestParam String feed_id, @RequestParam String feed_file_id,
		    		 @RequestParam String project_id, @RequestParam String project_name) {

			   return service.feedUpdate(feed_id, feed_file_id,project_id,project_name);
		   }
		   
		   @PostMapping(value = "/feedUpdate.do")
		   public String feedUpdateDo(@RequestParam String feed_id, @RequestParam String feed_file_id,
				   @RequestParam String content, @RequestParam String project_id, @RequestParam String project_name, 
				   RedirectAttributes rttr) {
			   
			   logger.info("피드 수정 : "+ feed_id, feed_file_id,project_id,project_name);
			   service.feedUpdateDo(feed_id, feed_file_id,content);
			   
			   HashMap<String, Object> map = new HashMap<String, Object>();
		    	 map.put("project_id", project_id);
		    	 map.put("project_name", project_name);
		    	 
		    	 rttr.addFlashAttribute("map",map);
			   
			   
			   return "redirect:/projectDetail.go?type=controller";
		   }
		   
		   
		   @RequestMapping(value = "/projectDel.do")
		   public String projectDel(@RequestParam String project_id) {
			   logger.info("프로젝트 삭제 : "+ project_id);
			   service.projectDel(project_id);
			   return "redirect:/projectList.go";
		   }
		   
		   
		   
		   
			@RequestMapping(value="/projectUpdateModal.ajax")
			@ResponseBody
			public HashMap<String, Object> projectUpdateModal(@RequestParam HashMap<String,Object> params) {
				
				logger.info("projectUpdate Call Controller");
				logger.info("params :"+params);
				String project_id = (String) params.get("project_id");
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("project", service.projectUpdateModal(project_id));

			    return map;
			}
			
			
			@PostMapping(value="/projectUpdate.ajax")
			public String projectUpdate(@RequestParam HashMap<String, String> params) {
				
				logger.info("projectUpdate Do Controller");
				logger.info("params :"+params);
				
			      String startYMD[] = String.valueOf(params.get("start_date2")).split("/");
			      String endYMD[] = String.valueOf(params.get("end_date2")).split("/");
			      for (String string : startYMD) {
			    	  logger.info(string);
			      }
			      for (String string : endYMD) {
			    	  logger.info(string);
			      }
			      params.put("start_date2", startYMD[2]+"-"+startYMD[0]+"-"+startYMD[1]);
			      params.put("end_date2", endYMD[2]+"-"+endYMD[0]+"-"+endYMD[1]);
				
				
				
				return service.projectUpdate(params);
				
			}
	
	
	
	
   

   /*---------------------------------------------------------캘린더 영역--------------------------------------------------------------*/

   @RequestMapping(value = "/ProjectcalendarUpdate.ajax")
   @ResponseBody
   public String calendarUpdate(@RequestBody ArrayList<ProjectEventDataDTO> eventDataList) {
      logger.info("eventDataList : " + eventDataList);

      service.calendarUpdate(eventDataList);

      return null;

   }

   @RequestMapping(value = "/ProjectcalendarUpdate2.ajax")

   @ResponseBody
   public String calendarUpdate2(@RequestBody ProjectEventDataDTO requestData) {

      logger.info("requestdata : " + requestData.getProject_id());

      service.calendarUpdate2(requestData);

      return "success";

   }

   @GetMapping("/getProjectEvent.ajax")
   @ResponseBody
   public List<ProjectEventDataDTO> getEvents(@RequestParam String project_id) {
      // 이벤트 데이터를 가져와서 리스트 형태로 반환

      logger.info(project_id);
      List<ProjectEventDataDTO> events = service.getEvents(project_id);

      for (ProjectEventDataDTO eventDataDTO : events) {
         logger.info("start:" + eventDataDTO.getStart_date());
      }

      return events;
   }

   @PostMapping("/ProjecteventDelete.ajax")
   @ResponseBody
   public HashMap<String, String> eventDelete(@RequestParam String project_calendar_id) {
      logger.info("id:" + project_calendar_id);

      int row = service.eventDelete(project_calendar_id);
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("data", "삭제실패");
      logger.info("row:" + row);

      if (row == 1) {
         map.put("data", "삭제성공");
      }

      return map;
   }
   


}