package kr.co.two.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.chat.service.ChatService;

@Controller
public class ChatController {
	
	@Autowired ChatService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());

}
