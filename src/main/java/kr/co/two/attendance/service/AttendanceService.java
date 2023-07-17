package kr.co.two.attendance.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.attendance.dao.AttendanceDAO;
import kr.co.two.attendance.dto.AttendanceDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class AttendanceService {
	
	@Autowired AttendanceDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public AttendanceDTO attendance(String member_id) {
		
		
		AttendanceDTO attendance = dao.attendance(member_id);
		ArrayList<String> annualList = new ArrayList<String>();
		annualList = dao.annual(member_id);
		double annual = attendance.getAnnual(); 
		
	
		logger.info("annualList:"+annualList);
		double useAnnual = 0.0;
		for (String string : annualList) {
		    if (string.equals("휴가")) {
		        useAnnual += 1.0;
		    } else {
		        useAnnual += 0.5;
		    }		
		    logger.info("useAnnual:" + useAnnual);
		}
		
		double remainingAnnual = annual-useAnnual;
		attendance.setUseAnnual(useAnnual);
		attendance.setRemainingAnnual(remainingAnnual);
		
		return attendance;
	}

	public HashMap<String, Object> atList(int page,int cnt, String opt, String keyword) {
		HashMap<String, Object>map = new HashMap<String,Object>();
		int offset = (page - 1) * cnt;

		int total = dao.atTotalCount(opt, keyword); // 12
		// cnt = 10
		int range = total % cnt == 0 ? total / cnt : (total / cnt) + 1;

		logger.info("total :" + total);
		logger.info("range :" + range);
		logger.info("before page :" + page);

		page = page > range ? range : page;

		logger.info("after page :" + page);

		map.put("currPage", page);
		map.put("pages", range);
		ArrayList<AttendanceDTO> atList = dao.atList(opt, keyword, cnt, offset);
		for (AttendanceDTO reservationDTO : atList) {
			logger.info("endTime:"+reservationDTO.getEnd_date());
			
		}	
		map.put("list", atList);
		return map;

	}
}
