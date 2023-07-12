package kr.co.two.payment.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public ModelAndView dualList(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return new ModelAndView("paymentVacationForm");

	}
	
	@RequestMapping(value = "/writeVacation.ajax")
	@ResponseBody
	public int writeVacation(@RequestParam HashMap<String, String> params 
			,@RequestParam("file") MultipartFile[] files) {
		logger.info("params : "+params);
		logger.info("file : "+files);
		
		
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
	        
	        //참조자 분리
    		
    		String referrer =  params.get("referrer");
    		
    	        String[] referrers = referrer.split(",");
    	        int referrerCount = referrers.length;

    	        

    	        for (int i = 0; i < referrerCount; i++) {
    	            String referrerKey = "referrer" + (i + 1);
    	            String referrerValue = referrers[i].trim();
    	            
    	         // 뒤에 있는 단어 추출
    	            int lastSpaceIndex1 = referrerValue.lastIndexOf(' ');
    	            if (lastSpaceIndex1 != -1 && lastSpaceIndex1 < referrerValue.length() - 1) {
    	            	referrerValue = referrerValue.substring(lastSpaceIndex1 + 1);
    	            	
    	            	
    	            }  
    	          //이름으로 document_id 찾기
    	            String member_id = service.findMemberId(referrerValue);
    	            logger.info("member_id 찾은거..,, "+member_id);
    	            
    	            params.put(referrerKey, member_id);
	        
    	        }


		
		logger.info("params : "+params);
		
		
		
		return service.writeVacation(params ,files);

	}
	
	
	@PostMapping(value = "/paymentList.ajax")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String optt, @RequestParam String keyword ) {
		
		
		logger.info("optt : " + optt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		return service.listCall(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,optt);
	}

	
	
	
	 
	
	



	
	
	
	
	
}
