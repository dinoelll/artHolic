package kr.co.two.mail.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.mail.dao.MailDAO;

@Service
public class MailService {

	@Autowired MailDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
