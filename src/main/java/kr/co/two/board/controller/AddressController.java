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
			@RequestParam String opt,@RequestParam String keyword,@RequestParam String bookmark) {

		logger.info("page : " + page);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("bookmark : " + bookmark);

		return service.adList(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword,bookmark);
	}
	
	
	
	@RequestMapping(value = "/bookmark.ajax")
	@ResponseBody
	public HashMap<String, String> bookmark(@RequestParam String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("data", "failed");
		String member_id ="8948948";
		int row = service.bookmark(id,member_id);
		if (row ==1) {
			map.put("data", id);
		}
		
		return map;
	}
	
	@RequestMapping(value = "/bookmarkDel.ajax")
	@ResponseBody
	public HashMap<String, String> bookmarkDel(@RequestParam String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("data", "failed");
		String member_id ="8948948";
		int row = service.bookmarkDel(id,member_id);
		if (row ==1) {
			map.put("data", id);
		}
		
		return map;
	}
	
	

	

}
