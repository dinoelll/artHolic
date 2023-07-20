package kr.co.two.main.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.main.dto.MainDTO;

@Mapper
public interface MainDAO {

	String login(String id);

	MainDTO mainMember(String member_id);

	MainDTO informDto();

	ArrayList<MainDTO> informList();

	ArrayList<MainDTO> myMaillist(String member_id);

	ArrayList<MainDTO> myPaymentlist(String member_id);

	MainDTO attendance(String member_id);

	ArrayList<MainDTO> annual(String member_id);

	ArrayList<MainDTO> myProjectlist(String member_id);

	String getPassword(String member_id);

}
