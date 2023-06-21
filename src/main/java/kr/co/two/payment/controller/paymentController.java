package kr.co.two.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.two.payment.service.paymentService;

@Controller
public class paymentController {

	@Autowired paymentService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
}
