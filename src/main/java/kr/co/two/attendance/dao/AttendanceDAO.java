package kr.co.two.attendance.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.attendance.dto.AttendanceDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Mapper
public interface AttendanceDAO {

	AttendanceDTO attendance(String member_id);
	ArrayList<String> annual(String member_id);
	

	int atTotalCount(String opt, String keyword);

	ArrayList<AttendanceDTO> atList(String opt, String keyword, int cnt, int offset);



	

}
