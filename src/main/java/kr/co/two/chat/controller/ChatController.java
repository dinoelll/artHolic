package kr.co.two.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
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
import kr.co.two.chat.dto.MemberDTO;
import kr.co.two.chat.service.ChatService;

@Controller
public class ChatController {
	
	private final SimpMessagingTemplate template;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired ChatService service;
	
	public ChatController(SimpMessagingTemplate template) {
		this.template = template;
	}
	
	@GetMapping(value="/chat.go")
	public String home() {
		return "chat";
	}
	
	@PostMapping(value="/chatList.ajax")
	@ResponseBody
	public ArrayList<ChatDTO> chatList(@RequestParam String name) {
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
	public void sendMessage(@PathVariable String chat_room_id, @Payload ChatDTO dto
			,SimpMessageHeaderAccessor headerAccessor) {
		logger.info("session id : " + headerAccessor.getSessionId());
		logger.info("dto : " + dto.getChat_room_id());
		logger.info("dto : " + dto.getSend_id());
		//logger.info("dto : " + dto.getContent());
		logger.info("dto : " + dto.isIs_notice());
		
		logger.info("template : " + template);
		
		service.chatStored(dto);
		
		template.convertAndSend("/sub/chat/"+ dto.getChat_room_id(), dto);
	}
	
	@PostMapping(value="/chatLoad.ajax")
	@ResponseBody
	public ArrayList<ChatDTO> chatStored(@RequestBody String id) {
		logger.info("id : " + id);
		return service.chatHistory(id);
	}
	
	@PostMapping(value="/memberListAll.ajax")
	@ResponseBody
	public ArrayList<MemberDTO> memberListAll() {
		logger.info("/memberList.ajax");
		return service.memberListAll();
	}
	
	@PostMapping(value="/memberList.ajax")
	@ResponseBody
	public ArrayList<MemberDTO> memberList(@RequestParam String chat_room_id) {
		logger.info("/memberList.ajax");
		return service.memberList(chat_room_id);
	}
	
	@PostMapping(value="/createChatroom.ajax")
	@ResponseBody
	public String createChatRoom(@RequestParam(value="member_id_array[]") ArrayList<String> member_id_array
			,@RequestParam String chat_room_name) {
		logger.info("member_id_array" + member_id_array);
		logger.info("chat_room_name : " + chat_room_name);
		for (String member_id : member_id_array) {
			logger.info("member_id : " + member_id);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_id_array", member_id_array);
		map.put("chat_room_name", chat_room_name);
		
		return service.createChatRoom(map);
	}
	
	@PostMapping(value="/inviteChatroom.ajax")
	@ResponseBody
	public String chatRoomExit(@RequestParam(value="member_id_array[]") ArrayList<String> member_id_array,
			@RequestParam String chat_room_id) {
		for (String member_id : member_id_array) {
			logger.info("member_id : " + member_id);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("member_id_array", member_id_array);
		map.put("chat_room_id", chat_room_id);
		
		template.convertAndSend("/sub/chat/"+ chat_room_id, "success");
		return service.inviteChatRoom(map);
	}
	
	@PostMapping(value="/myProfilePhoto.ajax")
	@ResponseBody
	public MemberDTO myProfilePhoto(@RequestParam String member_id) {
		logger.info(member_id);
		return service.myProfilePhoto(member_id);
	}
	
	@PostMapping(value="/getMemberName.ajax")
	@ResponseBody
	public MemberDTO getMemberName(@RequestParam String member_id) {
		logger.info(member_id);
		return service.getMemberName(member_id);
	}
}
