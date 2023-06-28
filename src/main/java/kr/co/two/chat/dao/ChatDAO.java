package kr.co.two.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.chat.dto.ChatDTO;
import kr.co.two.chat.dto.MemberDTO;

@Mapper
public interface ChatDAO {

	ArrayList<ChatDTO> chatList(String name);

	ArrayList<ChatDTO> chatHistory(String chat_room_id);

	ChatDTO room_list(int chat_room_id);

	int chatStored(HashMap<String, Object> map);

	ArrayList<ChatDTO> chatLoad(String id);

	ArrayList<MemberDTO> memberList();

}
