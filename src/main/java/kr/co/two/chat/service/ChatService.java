package kr.co.two.chat.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.chat.dto.ChatDTO;
import kr.co.two.chat.dto.MemberDTO;
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
			logger.info("chatDTO : " + chatDTO.getChat_room_id());
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
		map.put("is_notice", dto.isIs_notice());
		
		dao.chatStored(map);
		
		if(dto.isIs_notice()) {
			dao.chatRoomExit(dto);
		}
	}

	public ArrayList<ChatDTO> chatLoad(String id) {
		return dao.chatLoad(id);
	}

	public ArrayList<MemberDTO> memberListAll() {
		return dao.memberListAll();
	}

	public String createChatRoom(HashMap<String, Object> map) {
		ChatDTO dto = new ChatDTO();
		dto.setName(String.valueOf(map.get("chat_room_name")));
		
		dao.createRoom(dto);
		
		logger.info("chat_member_id : " + dto.getChat_room_id());
		
		for (String member_id : (ArrayList<String>) map.get("member_id_array")) {
			logger.info("member_id : "+ member_id);
			dao.insert_chat_room_info(dto.getChat_room_id(), member_id);
		}
		
		return "success";
	}

	public int chatRoomExit(ChatDTO dto) {
		dao.exitMessage(dto);
		return dao.chatRoomExit(dto);
	}

	public ArrayList<MemberDTO> memberList(String chat_room_id) {
		ArrayList<ChatDTO> list = dao.chatRoomInfo(chat_room_id);
		ArrayList<MemberDTO> listAll = dao.memberListAll();
		
		for(int i=0; i<list.size(); i++) {
			for(int k=0; k<listAll.size(); k++) {
				if(list.get(i).getMember_id().equals(listAll.get(k).getMember_id())) {
					listAll.remove(k);
				}
			}
		}
		
		return listAll;
	}
}
