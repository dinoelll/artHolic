package kr.co.two.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.two.main.dao.MainDAO;
import kr.co.two.main.dto.MainDTO;
import kr.co.two.member.dto.MemberDTO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	@Autowired PasswordEncoder encoder;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public MainDTO mainMember(String member_id) {
		
		return dao.mainMember(member_id);
		
	}

	public HashMap<String, Object> informList(HashMap<String, Object> params) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MainDTO> informList = dao.informList();

		map.put("informList", informList);
		

		return map;
	}

	public HashMap<String, Object> myMailList(String member_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MainDTO> myMaillist = dao.myMaillist(member_id);

		map.put("myMaillist", myMaillist);
		
		return map;
	}

	public HashMap<String, Object> myPaymentlist(String member_id) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MainDTO> myPaymentlist = dao.myPaymentlist(member_id);

		map.put("myPaymentlist", myPaymentlist);
		
		return map;
	}

	public MainDTO myAnnaul(String member_id) {
	    MainDTO attendance = dao.attendance(member_id);
	    ArrayList<MainDTO> annualList = dao.annual(member_id);
	    double annual = attendance.getAnnual();

	    logger.info("annualList:" + annualList);
	    double useAnnual = 0.0;
	    for (MainDTO dto : annualList) {
	        if (dto.getVacation_kind().equals("휴가")) {
	            useAnnual += 1.0;
	        } else {
	            useAnnual += 0.5;
	        }
	        logger.info("useAnnual:" + useAnnual);
	    }

	    double remainingAnnual = annual - useAnnual;
	    attendance.setUseAnnual(useAnnual);
	    attendance.setRemainingAnnual(remainingAnnual);

	    return attendance;
	}

	public HashMap<String, Object> myProjectlist(String member_id) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MainDTO> myProjectlist = dao.myProjectlist(member_id);

		map.put("myProjectlist", myProjectlist);
		
		return map;
	}

	public String getPassword(String member_id) {
	
		return dao.getPassword(member_id);
	}
	
}
