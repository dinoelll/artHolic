package kr.co.two.payment.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriUtils;

import kr.co.two.payment.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired PaymentService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${spring.servlet.multipart.location}") private String root;
	
	
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
			,@RequestParam("file") MultipartFile[] files, HttpSession session ) {
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
		
		
		
		return service.writeVacation(params ,files, session);

	}
	@RequestMapping(value = "/writeVacationTemp.ajax")
	@ResponseBody
	public int writeVacationTemp(@RequestParam HashMap<String, String> params 
			, HttpSession session ) {
		logger.info("params : "+params);
	
		
		
		
		
		
		return service.writeVacationTemp(params , session);

	}
	
	
	@PostMapping(value = "/paymentList.ajax")
	@ResponseBody
	public HashMap<String, Object> listCall(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String optt, @RequestParam String keyword, @RequestParam boolean temp, HttpSession session ) {
		
		
		logger.info("optt : " + optt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		logger.info("temp : " + temp);
		
		String member_id = (String) session.getAttribute("loginId");
		
		return service.listCall(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,optt , temp,member_id);
	}
	
	@PostMapping(value = "/paymentListPay.ajax")
	@ResponseBody
	public HashMap<String, Object> listCallPay(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String optt, @RequestParam String keyword, HttpSession session) {
		
		
		logger.info("optt : " + optt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		String member_id = (String) session.getAttribute("loginId");
		
		
		
		return service.listCallPay(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,optt, member_id );
	}
	
	@PostMapping(value = "/paymentListDone.ajax")
	@ResponseBody
	public HashMap<String, Object> listCallDone(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String optt, @RequestParam String keyword, HttpSession session ) {
		
		
		logger.info("optt : " + optt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		String member_id = (String) session.getAttribute("loginId");
		
		return service.listCallDone(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,optt , member_id  );
	}
	
	
	@PostMapping(value = "/paymentListTake.ajax")
	@ResponseBody
	public HashMap<String, Object> paymentListTake(@RequestParam String page, @RequestParam String cnt,
			@RequestParam String opt, @RequestParam String optt, @RequestParam String keyword, HttpSession session ) {
		
		
		logger.info("optt : " + optt);
		logger.info("opt : " + opt);
		logger.info("keyword : " + keyword);
		logger.info("page : " + page);
		logger.info("cnt : " + cnt);
		String member_id = (String) session.getAttribute("loginId");
		
		return service.paymentListTake(Integer.parseInt(page), Integer.parseInt(cnt), opt, keyword,optt , member_id  );
	}
	
	@PostMapping(value = "/payList.ajax")
	@ResponseBody
	public HashMap<String, Object> payList(@RequestParam String document_id) {
		logger.info(document_id);
		
		
		return service.payListCall(document_id );
	}
	
	@PostMapping(value = "/payRequest.ajax")
	@ResponseBody
	public int payRequest(@RequestParam String document_id, @RequestParam String note, HttpSession session) {
		logger.info(document_id);
		
		String member_id =  (String) session.getAttribute("loginId");
		
		return service.payRequest(document_id, note, member_id, session);
	}
	
	@PostMapping(value = "/payRefuse.ajax")
	@ResponseBody
	public int payRefuse(@RequestParam String document_id, @RequestParam String note, HttpSession session) {
		logger.info(document_id);
		
		String member_id =  (String) session.getAttribute("loginId");
		
		return service.payRefuse(document_id, note, member_id );
	}
	
	@RequestMapping(value = "/note.ajax")
	@ResponseBody
	public HashMap<String, Object> dualList(HttpSession session, @RequestParam String document_id) {
	
		logger.info("note.ajax!요청 들어옴!");
		return service.note(session, document_id);

	}

	@GetMapping(value = "/download2.do")
	   public ResponseEntity<Resource> download(@RequestParam("ori_fileName") String oriFileName,
	         @RequestParam("new_fileName") String newFileName) {

	      logger.info("download Controller");
	      logger.info("ori_fileName: " + oriFileName);
	      logger.info("new_fileName: " + newFileName);

	      String filePath = root + "/" + newFileName;

	      Resource body = new FileSystemResource(filePath);

	      HttpHeaders headers = new HttpHeaders();
	      try {
	         // String fileName = "이미지" +
	         // oriFileName.substring(oriFileName.lastIndexOf("."));
	         String fileName = UriUtils.encode(oriFileName, "UTF-8");
	         // Encode the file name to handle special characters
	         // fileName = URLEncoder.encode(fileName, "UTF-8");

	         headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	         headers.setContentDispositionFormData("attachment", fileName);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	      // Return the ResponseEntity with the file resource, headers, and OK status
	      return new ResponseEntity<>(body, headers, HttpStatus.OK);
	   }
	
	
	 
	
	



	
	
	
	
	
}
