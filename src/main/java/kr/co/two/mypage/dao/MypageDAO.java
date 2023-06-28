package kr.co.two.mypage.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.mypage.dto.EventDataDTO;

@Mapper
public interface MypageDAO {

	void calendarUpdate(EventDataDTO eventDataDTO);

	List<EventDataDTO> getEvent();

}
