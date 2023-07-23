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

	ArrayList<MemberDTO> memberListAll();

	int createRoom(ChatDTO dto);

	int insert_chat_room_info(String chat_room_id, String member_id);

	int chatRoomExit(ChatDTO dto);

	int exitMessage(ChatDTO dto);

	ArrayList<ChatDTO> chatRoomInfo(String chat_room_id);

	String getName(String member_id);

	MemberDTO myProfilePhoto(String member_id);

	MemberDTO getMemberName(String member_id);

}
