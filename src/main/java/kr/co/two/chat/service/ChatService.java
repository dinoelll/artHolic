package kr.co.two.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.chat.dto.ChatDTO;
import kr.co.two.chat.dao.ChatDAO;

@Service
@MapperScan(value={"kr.co.two.**.dao"})
public class ChatService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	private final ChatDAO dao;
	
	public ChatService(ChatDAO dao) {
		this.dao = dao;
	}

	public ArrayList<ChatDTO> chatList(String name) {
		ArrayList<ChatDTO> room_list = new ArrayList<ChatDTO>();
		ArrayList<ChatDTO> room_info_list = dao.chatList(name);
		
		for (ChatDTO chatDTO : room_info_list) {
			room_list.add(dao.room_list(chatDTO.getChat_room_id()));
		}
		return room_list;
	}

	public ArrayList<ChatDTO> chatHistory(String chat_room_id) {
		return dao.chatHistory(chat_room_id);
	}

	public void chatStored(ChatDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chat_room_id", dto.getChat_room_id());
		map.put("send_id", dto.getSend_id());
		map.put("content", dto.getContent());
		dao.chatStored(map);
	}

	public ArrayList<ChatDTO> chatLoad(String id) {
		return dao.chatLoad(id);
	}
}
