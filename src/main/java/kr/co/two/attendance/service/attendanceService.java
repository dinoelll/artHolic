package kr.co.two.attendance.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.attendance.dao.attendanceDAO;

@Service
public class attendanceService {
	
	@Autowired attendanceDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
