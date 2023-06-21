package kr.co.two.mail.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.mail.dao.mailDAO;

@Service
public class mailService {

	@Autowired mailDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
