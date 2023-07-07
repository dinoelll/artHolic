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

	ArrayList<ReservationDTO> reservationList(HashMap<String, String> param);

	int creatingMR(HashMap<String, String> params);

	int totalCount(String opt, String keyword);

	

	ArrayList<MeetingRoomDTO> mrList2(String opt, String keyword, int cnt, int offset);

	int mrDelete(String mrDel);

	int rvTotalCount(String opt, String keyword);

	ArrayList<ReservationDTO> rvList(String opt, String keyword, int cnt, int offset);

	int rvDelete(String rvDel);

}
