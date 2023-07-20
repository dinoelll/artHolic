package kr.co.two.reservation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
		return "meetingRoom";
	}

	@RequestMapping(value = "/MeetingRoomList.go")
	public String MeetingRoomList() {
		return "meetingRoomList";
	}
	
	@RequestMapping(value = "/ReservationList.go")
	public String ReservationList() {
		return "reservationList";
	}
	
	@RequestMapping(value = "/reservationComplete.go")
	public String reservationComplete(Model model, @RequestParam String meetingName,@RequestParam String meetionMember,@RequestParam String selectedRoom,@RequestParam String selectedDate,@RequestParam String startTime,@RequestParam String endTime) {
		logger.info(meetingName,endTime);
		model.addAttribute("meetingName", meetingName);
		model.addAttribute("meetionMember", meetionMember);
		model.addAttribute("selectedRoom", selectedRoom);
		model.addAttribute("selectedDate", selectedDate);
		model.addAttribute("startTime", startTime);
		model.addAttribute("endTime", endTime);
		
		return "reservationComplete";
	}
	
	
	
	
	/* 회의실예약 페이지에서 불러오는 리스트*/
	@RequestMapping(value = "/mrList.ajax")
	@ResponseBody
	public ArrayList<MeetingRoomDTO> mrList() {

		ArrayList<MeetingRoomDTO> mrList = service.mrList();
		for (MeetingRoomDTO MeetingRoomDTO : mrList) {
			logger.info("회의실 이름:" + MeetingRoomDTO.getRoom_name());
			logger.info("수용인원:"+MeetingRoomDTO.getCapacity());
		}

		return mrList;
	}
	
	
	/* 관리자 페이지에서 불러오는 리스트*/
	@RequestMapping(value = "/mrList2.ajax")
	@ResponseBody
	public  HashMap<String, Object> mrList2(@RequestParam String page,@RequestParam String cnt,
			@RequestParam String opt,@RequestParam String keyword) {

		/*
		 * ArrayList<MeetingRoomDTO> mrList =
		 * service.mrList2(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
		 * for (MeetingRoomDTO MeetingRoomDTO : mrList) { logger.info("회의실 이름:" +
		 * MeetingRoomDTO.getRoom_name());
		 * logger.info("수용인원:"+MeetingRoomDTO.getCapacity()); }
		 */

		return service.mrList2(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
	}
	
	@RequestMapping(value = "/creatingMR.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView creatingMR(@RequestParam MultipartFile mrPhoto,@RequestParam HashMap<String, String> params) {

		logger.info("photo"+mrPhoto);
		logger.info("params"+params);
		ModelAndView mav = new ModelAndView("meetingRoomList");
		String msg = "다시 시도해주세요.";		
		int row = service.creatingMR(mrPhoto,params);
		if (row==1) {			
			msg = "회의실이 등록되었습니다.";
		}
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	
	@RequestMapping(value="/mrDelete.ajax")
	@ResponseBody
	public HashMap<String, Object> mrDelete(@RequestParam(value="mrDelList[]") ArrayList<String> mrDelList){
		logger.info("delList : "+mrDelList);
		return service.mrDelete(mrDelList);
	}
	
	@RequestMapping(value="/rvDelete.ajax")
	@ResponseBody
	public HashMap<String, Object> rvDelete(@RequestParam(value="rvDelList[]") ArrayList<String> rvDelList){
		logger.info("delList : "+rvDelList);
		return service.rvDelete(rvDelList);
	}
	
	
	
	/* 관리자 페이지에서 불러오는 리스트*/
	@RequestMapping(value = "/rvList.ajax")
	@ResponseBody
	public HashMap<String, Object> rvList(@RequestParam String page,@RequestParam String cnt,
			@RequestParam String opt,@RequestParam String keyword) {

	

		return service.rvList(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
	}
	
	
	
	
	
	
	
	
	/* 회의실예약 페이지에서 불러오는 리스트*/
	@RequestMapping(value = "/reservationList.ajax")
	@ResponseBody
	public ArrayList<ReservationDTO> reservationList(@RequestParam HashMap<String, String> param) {

		String date = param.get("date"); // 가져온 날짜 값

		try {
			SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd"); // 가져온 날짜 형식
			java.util.Date formattedDate = inputFormat.parse(date); // 날짜 형식을 Date 타입으로 변환
			param.put("newDate", inputFormat.format(formattedDate)); // 형식 변환된 날짜를 다시 param에 추가
		} catch (ParseException e) {
			e.printStackTrace();
		}

		ArrayList<ReservationDTO> reservationList = service.reservationList(param);
		for (ReservationDTO reservationDTO : reservationList) {
			logger.info("회의실 이름:" + reservationDTO.getStartTime());
		}

		return reservationList;
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
