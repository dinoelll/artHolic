package kr.co.two.mail.service;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.mail.dao.MailDAO;
import kr.co.two.mail.dto.MailDTO;

@Service
public class MailService {

	@Autowired MailDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<MailDTO> mailgetOptions() {
		
		return dao.mailgetOptions();
		
	}

}
