package kr.co.two.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.mypage.dto.EventDataDTO;
import kr.co.two.project.dto.ProjectEventDataDTO;
import kr.co.two.project.service.ProjectService;

@Controller
public class ProjectController {

	@Autowired
	ProjectService service;

	Logger logger = LoggerFactory.getLogger(getClass());

	@GetMapping(value = "/projectList.go")
	public String projectList() {

		return "projectList";
	}

	@PostMapping(value = "/projectList.ajax")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String keyword) {

		return service.listCall(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword);
	}

	@PostMapping(value = "/projectWrite.do")
	public String projectWrite(@RequestParam HashMap<String, Object> params, Model model) {

		logger.info("params" + params);

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

		model.addAttribute("project_id", project_id);
		model.addAttribute("project_name", project_name);

		return "projectCalendar";
	}

	@RequestMapping(value = "/projectPeed.go")
	public String projectPeed() {

		return "projectPeed2";
	}

	@GetMapping(value = "/feedWrite.go")
	public String feedWriteGo(Model model, @RequestParam String project_id) {

		logger.info("프로젝트 아이디 : " + project_id);
		model.addAttribute("project_id", project_id);
		return "feedWrite";
	}

	@PostMapping(value = "/feedWrite.do")
	public String feedWrite(MultipartFile[] attachment, @RequestParam HashMap<String, String> params, Model model) {
		logger.info("params : " + params);
		logger.info("attachment 접근 : " + attachment);

		return service.feedWrite(attachment, params, model);
	}

	@RequestMapping(value = "/projectDetail.go")
	public String projectDetail(@RequestParam String project_id,@RequestParam String project_name, Model model) {

		// if(session.getAttribute("id") != null) {
		// page = "project-detail";
		model.addAttribute("project_id", project_id);
		model.addAttribute("project_name", project_name);
		// }

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
