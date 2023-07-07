package kr.co.two.board.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.two.board.service.AddressService;

@Controller
public class AddressController {

	@Autowired AddressService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

	
	@RequestMapping(value = "/address.go")
	public String ReservationList() {
		return "addressList";
	}
	
	@RequestMapping(value = "/adList.ajax")
	@ResponseBody
	public HashMap<String, Object> adList(@RequestParam String page,@RequestParam String cnt,
			@RequestParam String opt,@RequestParam String keyword) {

		logger.info("page : " + page);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);

		return service.adList(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword);
	}
	
}
