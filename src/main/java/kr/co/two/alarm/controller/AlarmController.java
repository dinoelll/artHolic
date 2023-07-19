package kr.co.two.alarm.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.alarm.dto.AlarmDTO;
import kr.co.two.alarm.service.AlarmService;

@Controller
public class AlarmController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired AlarmService service;
	
	@PostMapping(value="/alarmCount.ajax")
	@ResponseBody
	public int alarmCount(@RequestParam String receive_id) {
		logger.info("receive_id : " + receive_id);
		return service.alarmCount(receive_id);
	}
	
	@PostMapping(value="/alarmList.ajax")
	@ResponseBody
	public ArrayList<AlarmDTO> alarmList(@RequestParam String receive_id) {
		logger.info("receive_id : " + receive_id);
		
		return service.alarmList(receive_id);
	}
	
	@PostMapping(value="/readAlarm.ajax")
	@ResponseBody
	public String readAlarm(@RequestParam String alarm_id) {
		logger.info("alarm_id : " + alarm_id);
		
		return service.readAlarm(alarm_id);
	}
}
