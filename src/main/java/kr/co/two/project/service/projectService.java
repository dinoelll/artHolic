package kr.co.two.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.project.dao.projectDAO;

@Service
public class projectService {

	@Autowired projectDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
