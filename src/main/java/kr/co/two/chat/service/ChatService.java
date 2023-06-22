package kr.co.two.chat.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.chat.dao.ChatDAO;

@Service
public class ChatService {
	
	@Autowired ChatDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
