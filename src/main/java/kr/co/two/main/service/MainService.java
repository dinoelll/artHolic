package kr.co.two.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.two.main.dao.MainDAO;

@Service
public class MainService {

	@Autowired MainDAO dao;
	
	@Autowired PasswordEncoder encoder;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public boolean login(String id, String pw) {
			
		boolean success = false;
		
		// 1. id 를 통해서 해당 암호화된 pw 를 가져온다.
		String enc_pw = dao.login(id);
		// 2. 가져온 평문 pw 와 matches 를 통해 일치 여부를 확인한다.
		if(enc_pw != null && !enc_pw.equals("")) {
			success = encoder.matches(pw, enc_pw);
		}
		return success;
		
	}
}
