package kr.co.two.alarm.service;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.alarm.dao.AlarmDAO;
import kr.co.two.alarm.dto.AlarmDTO;

@Service
@MapperScan(value= {"kr.co.two.alarm.dao"})
public class AlarmService {
	
	@Autowired AlarmDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public int alarmCount(String receive_id) {
		return dao.alarmCount(receive_id);
	}

	public ArrayList<AlarmDTO> alarmList(String receive_id) {
		return dao.alarmList(receive_id);
	}

	public String readAlarm(String alarm_id) {
		dao.readAlarm(alarm_id);
		return "success";
	}

//	public HashMap<String, Object> alarmList(HttpSession session, HashMap<String, Object> params) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}