package kr.co.two.mypage.service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.mypage.dao.MypageDAO;
import kr.co.two.mypage.dto.EventDataDTO;

@Service
public class MypageService {

	@Autowired
	MypageDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());

	public void calendarUpdate(ArrayList<EventDataDTO> eventDataList) {
		String member_id = "1812001";
		for (EventDataDTO eventDataDTO : eventDataList) {
			eventDataDTO.setMember_id(member_id);
			String title = eventDataDTO.getContent();
			LocalDateTime start = eventDataDTO.getStart_date();
			LocalDateTime end = eventDataDTO.getEnd_date();
			boolean allday = eventDataDTO.getAllDay();
			String backgroundColor = eventDataDTO.getBackgroundColor();
			String borderColor = eventDataDTO.getBorderColor();

			logger.info("title" + title);
			logger.info("start" + start);
			logger.info("end" + end);
			logger.info("allday" + allday);
			logger.info("backgroundColor" + backgroundColor);
			logger.info("borderColor" + borderColor);
			
			dao.calendarUpdate(eventDataDTO);
		}

	}

	public List<EventDataDTO> getEvents() {
		
		return dao.getEvent();
	}
}
