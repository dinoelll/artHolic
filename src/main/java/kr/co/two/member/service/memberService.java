package kr.co.two.member.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.member.dao.memberDAO;

@Service
public class memberService {

	@Autowired memberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
