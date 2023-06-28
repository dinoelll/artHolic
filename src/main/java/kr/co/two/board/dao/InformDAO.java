package kr.co.two.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.board.dto.InformDTO;

@Mapper
public interface InformDAO {

	int informWriteDo(InformDTO dto);

	ArrayList<InformDTO> informList();

}
