package kr.co.two.reservation.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.reservation.dao.ReservationDAO;
import kr.co.two.reservation.dto.MeetingRoomDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class ReservationService {

	@Autowired ReservationDAO dao;
	
	public void reservationMR(HashMap<String, String> reservationData) {
		dao.reservationMR(reservationData);
		
	}

	public ArrayList<MeetingRoomDTO> mrList() {
		
		return dao.mrList();
	}

}
