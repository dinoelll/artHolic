package kr.co.two.payment.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.payment.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired PaymentService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/paymentWrite.do")
	public ModelAndView write(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return new ModelAndView("paymentVacationForm");

	}
	
	
	@RequestMapping(value = "/payment.ajax")
	public ModelAndView dualList(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return new ModelAndView("paymentVacationForm");

	}
	@RequestMapping(value = "/writeVacation.ajax")
	public ModelAndView writeVacation(@RequestParam HashMap<String, String> params 
			,@RequestParam("file") MultipartFile[] files) {
		logger.info("params : "+params);
		logger.info("file : "+files);
		
		// 기간 및 일시
		String oriReservationtime = params.get("reservationtime");
		String start_date =  oriReservationtime.substring(0, 10);
		logger.info("start_date : "+start_date);
		params.put("start_date", start_date);
		String end_date =  oriReservationtime.substring(22, 32);
		logger.info("end_date : "+end_date);
		params.put("end_date", end_date);
		
		
		// 오전 오후 여부
		String vacation_sort =  params.get("radioPeriod");
		if(vacation_sort.equals("오전") ) {
			params.put("vacation_sort", "0");
		}
		if(vacation_sort.equals("오후") )  {
			params.put("vacation_sort", "1");
		}
		
		//결재선 분리
		
		String payment =  params.get("payment");
		
	        String[] payments = payment.split(",");
	        int paymentCount = payments.length;

	        

	        for (int i = 0; i < paymentCount; i++) {
	            String paymentKey = "payment" + (i + 1);
	            String paymentValue = payments[i].trim();
	            
	         // 뒤에 있는 단어 추출
	            int lastSpaceIndex = paymentValue.lastIndexOf(' ');
	            if (lastSpaceIndex != -1 && lastSpaceIndex < paymentValue.length() - 1) {
	                paymentValue = paymentValue.substring(lastSpaceIndex + 1);
	            }
	            
	            
	            
	            //이름으로 document_id 찾기
	            String member_id = service.findMemberId(paymentValue);
	            logger.info("member_id 찾은거..,, "+member_id);
	            
	            params.put(paymentKey, member_id);
	        }
	        
	        
	        


		
		logger.info("params : "+params);
		
		
		
		return service.writeVacation(params ,files);

	}
	@RequestMapping(value = "/paymentVacationForm.go")
	public ModelAndView member() {

		return service.member(); 

	}
	
	
	
	 
	
	



	
	
	
	
	
}
