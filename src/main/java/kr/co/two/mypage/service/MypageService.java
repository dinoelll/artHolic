package kr.co.two.mypage.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.mypage.dao.MypageDAO;

@Service
public class MypageService {

	@Autowired MypageDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
