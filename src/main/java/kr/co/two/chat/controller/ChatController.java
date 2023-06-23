package kr.co.two.chat.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.chat.dto.ChatDTO;
import kr.co.two.chat.service.ChatService;

@Controller
public class ChatController {
	
	private final SimpMessagingTemplate template;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatService service;
	
	public ChatController(SimpMessagingTemplate template) {
		this.template = template;
	}
	
	@GetMapping(value="/chat")
	public String home() {
		return "chat";
	}
	
	@PostMapping(value="/chatList.ajax")
	@ResponseBody
	public ArrayList<ChatDTO> chatList(String name) {
		logger.info("name : " + name);
		return service.chatList(name);
	}
	
	@PostMapping(value="/chatHistory.ajax")
	@ResponseBody
	public ArrayList<ChatDTO> chatHistory(@RequestParam String chat_room_id) {
		logger.info(chat_room_id);
		return service.chatHistory(chat_room_id);
	}
	
	@GetMapping(value="/chat/{chat_room_id}")
	public ModelAndView chat(@PathVariable String chat_room_id) {
		
		logger.info("chat_room_id : " + chat_room_id);
		ModelAndView mav = new ModelAndView("chat");
		return mav;
	}
	
	@MessageMapping(value="/chat/sendMessage")
	public void sendMessage(@PathVariable String chat_room_id, @Payload ChatDTO dto) {
		logger.info("dto : " + dto.getChat_room_id());
		logger.info("dto : " + dto.getSend_id());
		logger.info("dto : " + dto.getContent());
		logger.info("template : " + template);
		service.chatStored(dto);
		template.convertAndSend("/sub/chat/"+ dto.getChat_room_id(), dto);
	}
	
	@PostMapping(value="/chatStored.ajax")
	@ResponseBody
	public ArrayList<ChatDTO> chatStored(@RequestBody String id) {
		logger.info("id : " + id);
		return service.chatLoad(id);
	}
}
