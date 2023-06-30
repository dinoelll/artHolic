package kr.co.two.reservation.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.reservation.dto.MeetingRoomDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Mapper
public interface ReservationDAO {

	void reservationMR(HashMap<String, String> reservationData);

	ArrayList<MeetingRoomDTO> mrList();

}
