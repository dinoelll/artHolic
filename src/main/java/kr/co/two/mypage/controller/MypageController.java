package kr.co.two.mypage.controller;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.mypage.dto.EventDataDTO;
import kr.co.two.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired MypageService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/pwchange")
	public String pwChange() {
		
		return "pwChange";
	}
	
	@RequestMapping(value="/myfolder")
	public String myFolder() {
		
		return "myFolder";
	}
	
	@RequestMapping(value="/mycalendar")
	public String myCalendar() {
		
		return "myCalendar";
	}
	
	
	@RequestMapping(value="/calendarUpdate.ajax")
	@ResponseBody
	public String calendarUpdate(@RequestBody ArrayList<EventDataDTO> eventDataList) {
		
		service.calendarUpdate(eventDataList);
		
	
		
		return "success";
	}
	
    @GetMapping("/getEvent.ajax")
    @ResponseBody
    public List<EventDataDTO> getEvents() {
        // 이벤트 데이터를 가져와서 리스트 형태로 반환
        List<EventDataDTO> events = service.getEvents();
        
        for (EventDataDTO eventDataDTO : events) {
			logger.info("start:"+eventDataDTO.getStart_date());
		}
        
        return events;
    }
}
