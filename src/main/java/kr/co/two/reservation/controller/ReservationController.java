package kr.co.two.reservation.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.reservation.dto.MeetingRoomDTO;
import kr.co.two.reservation.dto.ReservationDTO;
import kr.co.two.reservation.service.ReservationService;

@Controller
public class ReservationController {

	private final ReservationService service;

	public ReservationController(ReservationService service) {
		this.service = service;
	}

	Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping(value = "/metingRoom.go")
	public String reservation() {
		return "meetingRoom22222";
	}

	@RequestMapping(value = "/createMeetingRoom.go")
	public String createReservation() {
		return "createMeetingRoom";
	}
	
	@RequestMapping(value = "/mrList.ajax")
	@ResponseBody
	public ArrayList<MeetingRoomDTO> mrList() {
		
		ArrayList<MeetingRoomDTO> mrList = service.mrList();
		for (MeetingRoomDTO MeetingRoomDTO : mrList) {
			logger.info("회의실 이름:"+MeetingRoomDTO.getRoom_name());
		}
	
		
		return mrList;
	}
	
	

	@PostMapping(value = "/reservationMeetingRoom.ajax")
	@ResponseBody
	public HashMap<String, Object> reservationMeetingRoom(@RequestParam HashMap<String, String> reservationData)
			throws ParseException {
		logger.info("dz:" + reservationData);
		
		String inputDate = reservationData.get("date");
		SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy. M. d.");
		SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

		try {
			Date date = (Date) inputFormat.parse(inputDate);
			String formattedDate = outputFormat.format(date);
			logger.info("Formatted date: " + formattedDate);
			reservationData.put("newDate", formattedDate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		
		reservationData.put("member_id", "1812001");

		service.reservationMR(reservationData);

		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("reservaion:" + reservationData.get("meeting_id"));
		map.put("success", "success");

		return map;
	}

}
