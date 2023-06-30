package kr.co.two.board.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.board.dto.BriefingDTO;
import kr.co.two.board.service.BriefingService;

@Controller
public class BriefingController {

	/*
	 * private final BriefingService service;
	 * 
	 * public BriefingController(BriefingService service) { this.service = service;
	 * }
	 * 
	 * Logger logger = LoggerFactory.getLogger(getClass());
	 * 
	 * @RequestMapping(value= {"/","briefingList.do"}) public String main() {
	 * 
	 * return "briefingList"; }
	 * 
	 * 
	 * 
	 * 
	 * @PostMapping(value="/briefingList.ajax")
	 * @ResponseBody public HashMap<String, Object> list(@RequestParam String
	 * page,@RequestParam String cnt,
	 * @RequestParam String opt,@RequestParam String keyword) {
	 * 
	 * return
	 * service.list(Integer.parseInt(page),Integer.parseInt(cnt),opt,keyword); }
	 * 
	 * 
	 * 
	 * 
	 * @RequestMapping(value="/briefingWrite.go") public String writeForm() {
	 * 
	 * return "briefingWriteForm"; }
	 * 
	 * @PostMapping(value="/briefingWrite.do") public ModelAndView write(BriefingDTO
	 * dto) { logger.info(dto.getSubject()+"/"+dto.getUser_name());
	 * logger.info("content size:"+dto.getContent().length()); return
	 * service.write(dto); }
	 * 
	 * @GetMapping(value="/briefingDetail.do") public ModelAndView
	 * detail(@RequestParam String idx) {
	 * 
	 * 
	 * return service.detail(idx); }
	 * 
	 * @GetMapping(value="/briefingDelete.do") public ModelAndView
	 * delete(@RequestParam String idx) {
	 * 
	 * logger.info("idx : " + idx); return service.delete(idx); }
	 * 
	 */

}
