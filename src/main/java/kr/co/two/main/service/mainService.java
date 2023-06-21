package kr.co.two.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.main.dao.mainDAO;

@Service
public class mainService {

	@Autowired mainDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
