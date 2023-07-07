package kr.co.two.payment.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.payment.dao.PaymentDAO;
import kr.co.two.payment.dto.MemberDTO;
import kr.co.two.payment.dto.PaymentDTO;

@Service
public class PaymentService {

	@Autowired PaymentDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${spring.servlet.multipart.location}") private String root;

	
	public ModelAndView writeVacation(HashMap<String, String> params, MultipartFile[] files) {
	    PaymentDTO dto = new PaymentDTO();
	    
	    // 기본 정보 부여
	    String blind = "0";
	    params.put("blind", blind);
	    String state = "진행중";
	    params.put("state", state);
	    
	    
	    //임시로 저장하기 위해서 이름 부여
	    String id = "나경영";
	    params.put("id", id);
	    
	    
	    String form_sort =  params.get("form_sort");
	    
	    String document_id = generateVacationDocumentNumber();
	    params.put("document_id", document_id);
	    
	    if(params.get("temp")!=null) {
	    	
	    	
	    	int vacationFormSaveTempRow =  dao.vacationFormSaveTemp(params);
	    	 logger.info("작성폼 임시저장 업로드 완료 "+vacationFormSaveTempRow);
	    }
	    if(params.get("temp")==null) {
	    	String temp = "0";
		    params.put("temp", temp);
	    	
	    	 int vacationFormSaveRow =  dao.vacationFormSave(params);
	 	    logger.info("작성폼 업로드 완료 "+vacationFormSaveRow);
	 	    
	    	
	    }
	    
	    
	   
    	// 파일 업로드 작업
	    
	    if (files != null ) {
	        logger.info("다중 파일 업로드 작업");
	        multiUpload(files, document_id);
	    }
	    

	    // 결재 관련 정보 생성

	    
	    logger.info("결재관련 파람 확인!! " + params);
	    
	    String result = "진행 중";
	    params.put("result", result);

	    for (int i = 1; i <= 4; i++) {
	        String paymentKey = "payment" + i;
	        if (params.get(paymentKey) != null && !params.get(paymentKey).isEmpty()) {
	            String order_column = String.valueOf(i);
	            params.put("order_column", order_column);
	            String member_id =  params.get(paymentKey);
	            params.put("member_id", member_id);
	            int paymentShipRow = dao.paymentShip(params);
	            logger.info("payment변경완료Ship" + paymentShipRow);
	        }
	    }
	    

	    ModelAndView mav = new ModelAndView("paymentVacation");
		/* mav.addObject("success", vacationFormSaveRow); */
	    return mav;
	    
	    
	}
	
	// 파일 업로드 메소드
		  public void upload(MultipartFile file, String document_id) { 
		  
			  
			// 1. 파일명 추출
				String ori_file_name = file.getOriginalFilename();
				
				//2. 새파일 생성(현재시간 + 확장자)
				String ext = ori_file_name.substring(ori_file_name.lastIndexOf("."));
				String new_file_name = System.currentTimeMillis() + ext;
				logger.info(ori_file_name+"=>"+new_file_name);
				logger.info(new_file_name+"save OK");
				
				String file_path = root;
				
				dao.fileWrite(ori_file_name, new_file_name, file_path, document_id );

				
				//3. 파일 저장
				try {
					byte[] bytes = file.getBytes();
					Path path = Paths.get(root+"/"+new_file_name);
					Files.write(path, bytes);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//4. 
				
			}
		  
		  
		  
		  
		  public void multiUpload(MultipartFile[] files, String document_id) {
				
				
				for (MultipartFile file : files) {
					upload(file, document_id);
					try {
						Thread.sleep(1);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
				}
				
			}
		  
	
	

	// 문서번호 생성 메소드
	private String generateVacationDocumentNumber() {
	    
		// 데이터베이스에서 가장 최근의 문서 번호를 조회하는 로직
	    
		String latestDocumentNumber = dao.getLatestDocumentNumber(); // 예시: "vac-a-0001"
	    
	    
	    // 최근 문서 번호에서 알파벳, 숫자 부분을 분리
	    String prefix = latestDocumentNumber.substring(0, 6); // "vac-a-"
	    int numericPart = Integer.parseInt(latestDocumentNumber.substring(6)); // 0001
	    logger.info("prefix: " +prefix);
	    
	    // 숫자 부분을 증가시키고, 범위를 초과하면 알파벳 부분을 증가시킴
	    if (numericPart >= 9999) {
	        // 알파벳 부분을 증가시킴
	        char alphaPart = prefix.charAt(4); // 'a'
	        logger.info("alphaPart: " +alphaPart);
	        alphaPart++;
	        
	        // 알파벳 부분이 'z'를 초과하면 'a'로 변경
	        if (alphaPart > 'z') {
	            alphaPart = 'a';
	        }
	        
	        prefix = prefix.substring(0, 4) + alphaPart + "-"; // "vac-b-"
	        logger.info("prefix2 : " +prefix);
	        numericPart = 1;
	    } else {
	        numericPart++;
	    }
	    
	    // 새로운 문서 번호 생성
	    String newDocumentNumber = prefix + String.format("%04d", numericPart); // 예시: "vac-a-0002"
	    // 형식 지정자 사용
	    logger.info(newDocumentNumber);
	    
	    
	   
	    
	    
	    
	    return newDocumentNumber;
	}

	
	  public ModelAndView member() {
		  ArrayList<MemberDTO> mdto = dao.member(); 
		  ModelAndView mav = new ModelAndView("paymentVacationForm"); 
		  mav.addObject("member", mdto);
		  logger.info("멤버 결재선 요청 내려 보냄.");
	  
	  return mav;
	  
	  
	  }

	public String findMemberId(String paymentValue) {
		  return dao.findMemberId(paymentValue);
		
	}
	 

	
	  
	  
	 

	
}
