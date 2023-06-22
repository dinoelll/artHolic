package kr.co.two.payment.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.payment.dao.PaymentDAO;

@Service
public class PaymentService {

	@Autowired PaymentDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
