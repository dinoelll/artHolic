package kr.co.two.main.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MainDAO {

	String login(String id);

}
