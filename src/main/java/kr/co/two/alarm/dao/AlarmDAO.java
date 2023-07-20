package kr.co.two.alarm.dao;

import java.util.ArrayList;

import kr.co.two.alarm.dto.AlarmDTO;

public interface AlarmDAO {

	int alarmCount(String receive_id);

	ArrayList<AlarmDTO> alarmList(String receive_id);

	int readAlarm(String alarm_id);

}