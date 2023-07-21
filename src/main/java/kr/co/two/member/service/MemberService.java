package kr.co.two.member.service;

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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.member.dao.MemberDAO;
import kr.co.two.member.dto.MemberDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired PasswordEncoder encoder;
	
	// @Value 를 사용하여 C:/upload 위치를 root 에 담는다.
	@Value("${spring.servlet.multipart.location}") private String root;

	public HashMap<String, Object> employeeList(HashMap<String, Object> params) {
		
		logger.info("params :"+params);
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int cnt = Integer.parseInt(String.valueOf(params.get("cnt")));
				
		String searchType = String.valueOf(params.get("searchType"));
		String searchText = String.valueOf(params.get("searchText"));
		String adminProcess = String.valueOf(params.get("adminProcess"));
		
		Object storedValue;
		
		if (adminProcess.equals("default")) {
		    storedValue = adminProcess; // "default"를 문자열로 저장합니다.
		} else {
		    storedValue = adminProcess.equals("true") ? 1 : 0; // "true"일 때는 1로, "false"일 때는 0으로 저장합니다.
		}
		
		logger.info("storedValue :"+storedValue);
		
		logger.info("page :"+page+"/"+"ctn :"+cnt+"/"+"searchType :"+searchType+"/"+"searchText :"+searchText);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = cnt * (page-1);
	      
	    logger.info("offset : " + offset);
	    
	    int total = 0; 
	    
	    if (searchType.equals("default")) {
	        if (adminProcess.equals("default")) {
	            // 전체 리스트를 불러옴
	            total = dao.employeeTotalCount(params);
	            logger.info("회원 전체 리스트 / employeeTotalCount");
	        } else {
	        	total = dao.employeeTotalCountByProcess(params, storedValue);
	            logger.info("회원 전체 리스트 Boolean / employeeTotalCountByProcess");
	        }
	    } else if (searchType.equals("dept")) {
	        if (!searchText.isEmpty()) {
	            // 해당 detp_code를 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	total = dao.employeeDeptTotalCount(params, searchType, searchText);
	                logger.info("회원 부서 리스트 / employeeDeptTotalCount");
	            } else {
	            	total = dao.employeeDeptTotalCountByProcess(params, searchType, searchText, storedValue);
	                logger.info("회원 부서 리스트 Boolean / employeeDeptTotalCountByProcess");
	            }
	        }
	    } else if (searchType.equals("position")) {
	        if (!searchText.isEmpty()) {
	            // 해당 position 을 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	total = dao.employeePositionTotalCount(params, searchType, searchText);
	                logger.info("회원 직급 리스트 / employeeNameTotalCount");
	            } else {
	            	total = dao.employeePositionTotalCountByProcess(params, searchType, searchText, storedValue);
	                logger.info("회원 직급 리스트 Boolean / employeeNameTotalCountByProcess");
	            }
	        }
	    } else if (searchType.equals("name")) {
	        if (!searchText.isEmpty()) {
	            // 해당 name을 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	total = dao.employeeNameTotalCount(params, searchType, searchText);
	                logger.info("회원 이름 리스트 / employeeNameTotalCount");
	            } else {
	            	total = dao.employeeNameTotalCountByProcess(params, searchType, searchText, storedValue);
	                logger.info("회원 이름 리스트 Boolean / employeeNameTotalCountByProcess");
	            }
	        }
	    }
	    
	    
	    int range = total%cnt  == 0 ? total/cnt : (total/cnt)+1;
	      
	    logger.info("총게시글 수 : "+ total);
	    logger.info("총 페이지 수 : "+ range);
	    
	    page = page>range ? range:page;
	    
	    map.put("currPage", page);
	    map.put("pages", range);
	    params.put("offset", offset);
	    
	    ArrayList<MemberDTO> employeeList = null;

	    if (searchType.equals("default")) {
	        if (adminProcess.equals("default")) {
	            // 전체 리스트를 불러옴
	        	employeeList = dao.employeeTotalList(params, cnt, offset);
	            logger.info("회원 전체 리스트 / employeeTotalList");
	        } else {
	        	employeeList = dao.employeeTotalListByProcess(params, storedValue, cnt, offset);
	            logger.info("회원 전체 리스트 Boolean / employeeTotalListByProcess");
	        }
	    } else if (searchType.equals("dept")) {
	        if (!searchText.isEmpty()) {
	            // 해당 dpet_code를 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	employeeList = dao.employeeDeptTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 부서 리스트 / employeeDeptTotalList");
	            } else {
	            	employeeList = dao.employeeDeptTotalListByProcess(params, searchType, searchText, storedValue, cnt, offset);
	                logger.info("회원 부서 리스트 Boolean / employeeDeptTotalListByProcess");
	            }
	        }
	    } else if (searchType.equals("name")) {
	        if (!searchText.isEmpty()) {
	            // 해당 name을 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	employeeList = dao.employeeNameTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 이름 리스트 / employeeNameTotalList");
	            } else {
	            	employeeList = dao.employeeNameTotalListByProcess(params, searchType, searchText, storedValue, cnt, offset);
	                logger.info("회원 이름 리스트 Boolean / employeeNameTotalListByProcess");
	            }
	        }
	    } else if (searchType.equals("position")) {
	        if (!searchText.isEmpty()) {
	            // 해당 position을 포함하는 리스트를 불러옴
	            if (adminProcess.equals("default")) {
	            	employeeList = dao.employeePositionTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 직급 리스트 / employeePositionTotalList");
	            } else {
	            	employeeList = dao.employeePositionTotalListByProcess(params, searchType, searchText, storedValue, cnt, offset);
	                logger.info("회원 이름 리스트 Boolean / employeePositionTotalListByProcess");
	            }
	        }
	    }
	    
	    
	    map.put("employeeList", employeeList);
	    logger.info("employeeList :"+employeeList);
	    
		return map; 
	}



	public void admin(String memberId, Boolean adminValue) {
		
		dao.admin(memberId, adminValue);
	}


	public int changePw(String pw, String member_id) {
		
        logger.info("pw :"+pw+"/"+"member_id :"+member_id);
        String enc_pass = encoder.encode(pw);
        return dao.changePw(enc_pass,member_id);
		
	}


	public ModelAndView join(HashMap<String, String> params, MultipartFile profile, String email) {
		
		logger.info("join Service");
		
	    String member_id = params.get("member_id");
	    String pw = params.get("pw");
	    
	    logger.info("member_id :"+member_id+"/"+"pw :"+pw);

		String enc_pass = encoder.encode(pw);
		params.put("pw", enc_pass);
		logger.info("pw :"+pw);
		
		String birthday = params.get("birthday");
		logger.info("birthday :"+birthday);
		
		// 1. 파일명 추출
		String fileName = profile.getOriginalFilename();
		// 2. 새파일 생성(현재시간 + 확장자)
		String ext = fileName.substring(fileName.lastIndexOf("."));
		String newFileName = System.currentTimeMillis()+ext; // 시간으로 하는건 옛날 방법 요새는 해쉬 코드 사용
		logger.info(fileName+"=>"+newFileName);
		
		int success = dao.join(params,newFileName,email);
		logger.info("success :"+success);
		
		// 3. 파일 저장
		try {
			byte[] bytes = profile.getBytes();
			Path path = Paths.get(root+"/"+newFileName);
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String msg = "사원등록에 실패 했습니다.";
		String page = "employeeWrite";
		
		if(success > 0) {
			
			msg ="사원등록에 성공 했습니다.";
			page ="forward:/employeeList.go";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(page);
		mav.addObject("msg", msg);
		
		return mav;

	}


    public MemberDTO login(String id, String pw) {
        logger.info("login Service");

        boolean success = false;

        MemberDTO memberDTO = dao.login(id);
        if (memberDTO != null) {
            String enc_pw = memberDTO.getPw();
            success = encoder.matches(pw, enc_pw);
        	//success = true;
        }
        
        logger.info("success :" + success);

        if (success) {
            return memberDTO;
        } else {
            return null;
        }

    }
    
	public MemberDTO memberDetail(String member_id) {
		
		return dao.memberDetail(member_id);
	}

    public ModelAndView update(HashMap<String, String> params, MultipartFile profile, String email, int blind) {
	    logger.info("join Service");

	    String member_id = params.get("member_id");
	    
	    String birthday = params.get("birthday");
	    logger.info("birthday: " + birthday);
        logger.info("blind :"+blind);

	    String newFileName = null;

	    if (!profile.isEmpty()) {
	        // 프로필 사진이 업로드된 경우
	        String fileName = profile.getOriginalFilename();
	        String ext = fileName.substring(fileName.lastIndexOf("."));
	        newFileName = System.currentTimeMillis() + ext;
	        logger.info(fileName + " => " + newFileName);

	        try {
	            byte[] bytes = profile.getBytes();
	            Path path = Paths.get(root + "/" + newFileName);
	            Files.write(path, bytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    } else {
	        // 프로필 사진이 업로드되지 않은 경우
	        // 기존에 저장된 프로필 사진 가져오기
	        newFileName = dao.getProfileFileName(member_id);
	        logger.info("newFileName :"+newFileName);
	        
	    }

        int success = dao.update(params, newFileName, email,blind);
	    logger.info("success: " + success);

	    String msg = "사원정보 수정에 실패했습니다.";
	    String page = "employeeList";

	    if (success > 0) {
	        msg = "사원정보 수정에 성공했습니다.";
	        page = "forward:/employeeList.go";
	    }

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName(page);
	    mav.addObject("msg", msg);

	    return mav;
	}


	public HashMap<String, Object> companyList(HashMap<String, Object> params) {

		logger.info("params :"+params);
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int cnt = Integer.parseInt(String.valueOf(params.get("cnt")));
				
		String searchType = String.valueOf(params.get("searchType"));
		String searchText = String.valueOf(params.get("searchText"));
		
		logger.info("page :"+page+"/"+"ctn :"+cnt+"/"+"searchType :"+searchType+"/"+"searchText :"+searchText);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = cnt * (page-1);
	      
	    logger.info("offset : " + offset);
	    
	    int total = 0; 
	    
	    if (searchType.equals("default")) {
	            // 전체 리스트를 불러옴
	            total = dao.companyTotalCount(params);
	            logger.info("협력업체 전체 리스트 / companyTotalCount");      
	    } else if (searchType.equals("name")) {
	            total = dao.companyNameTotalCount(params, searchType, searchText);
	            logger.info("협력업체 이름 검색 리스트 / companyNameTotalCount");   	        
	    } else if (searchType.equals("business")) {	           
	            	total = dao.companyBusinessTotalCount(params, searchType, searchText);
	                logger.info("협력업체 사업자명 검색 리스트 / companyBusinessTotalCount");
	    } 
	    
	    int range = total%cnt  == 0 ? total/cnt : (total/cnt)+1;
	      
	    logger.info("총게시글 수 : "+ total);
	    logger.info("총 페이지 수 : "+ range);
	    
	    page = page>range ? range:page;
	    
	    map.put("currPage", page);
	    map.put("pages", range);
	    params.put("offset", offset);
	    
	    ArrayList<MemberDTO> companyList = null;
	  
	    if (searchType.equals("default")) {
            // 전체 리스트를 불러옴
	    	companyList = dao.companyTotalList(params, cnt, offset);
            logger.info("협력업체 전체 리스트 / companyTotalCount");      
	    } else if (searchType.equals("name")) {
	    	companyList = dao.companyNameTotalList(params, searchType, searchText, cnt, offset);
            logger.info("협력업체 이름 검색 리스트 / companyNameTotalCount");   	        
	    } else if (searchType.equals("business")) {	           
	    	companyList = dao.companyBusinessTotalList(params, searchType, searchText, cnt, offset);
        	logger.info("협력업체 사업자명 검색 리스트 / companyBusinessTotalCount");
	    } 
	    
	    map.put("companyList", companyList);
	    logger.info("companyList :"+companyList);
	    
		return map; 
	}


	public String companyWrite(HashMap<String, Object> params) {
		
		int success = dao.companyWrite(params);
		logger.info("success :"+success);
		
		return "redirect:/companyAddress.go";
	}


	public MemberDTO companyDetail(String cooper_id) {

		return dao.companyDetail(cooper_id);
	}


	public String companyupdate(HashMap<String, String> params) {

		int success = dao.companyUpdate(params);
		logger.info("success :"+success);
		return "redirect:/companyAddress.go";
	}



	public boolean isUserBlind(String id) {
		
		return dao.isUserBlind(id);
	}



	public HashMap<String, Object> employeeBlindList(HashMap<String, Object> params) {
		logger.info("params :"+params);
		
		int page = Integer.parseInt(String.valueOf(params.get("page")));
		int cnt = Integer.parseInt(String.valueOf(params.get("cnt")));
				
		String searchType = String.valueOf(params.get("searchType"));
		String searchText = String.valueOf(params.get("searchText"));
		
		logger.info("page :"+page+"/"+"ctn :"+cnt+"/"+"searchType :"+searchType+"/"+"searchText :"+searchText);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int offset = cnt * (page-1);
	      
	    logger.info("offset : " + offset);
	    
	    int total = 0; 
	    
	    if (searchType.equals("default")) {
	            total = dao.employeeBlindTotalCount(params);
	            logger.info("회원 전체 리스트 / employeeTotalCount");
	    } else if (searchType.equals("dept")) {
	        if (!searchText.isEmpty()) {
	            // 해당 detp_code를 포함하는 리스트를 불러옴
            	total = dao.employeeBlindDeptTotalCount(params, searchType, searchText);
                logger.info("회원 부서 리스트 / employeeDeptTotalCount");
	        }
	    } else if (searchType.equals("position")) {
	        if (!searchText.isEmpty()) {
	            // 해당 position 을 포함하는 리스트를 불러옴	            
            	total = dao.employeeBlindPositionTotalCount(params, searchType, searchText);
                logger.info("회원 직급 리스트 / employeeNameTotalCount");	             
	        }
	    } else if (searchType.equals("name")) {
	        if (!searchText.isEmpty()) {
	            // 해당 name을 포함하는 리스트를 불러옴	            
	            	total = dao.employeeBlindNameTotalCount(params, searchType, searchText);
	                logger.info("회원 이름 리스트 / employeeNameTotalCount");	            
	        }
	    }
	    
	    
	    int range = total%cnt  == 0 ? total/cnt : (total/cnt)+1;
	      
	    logger.info("총게시글 수 : "+ total);
	    logger.info("총 페이지 수 : "+ range);
	    
	    page = page>range ? range:page;
	    
	    map.put("currPage", page);
	    map.put("pages", range);
	    params.put("offset", offset);
	    
	    ArrayList<MemberDTO> employeeBlindList = null;

	    if (searchType.equals("default")) {
	            // 전체 리스트를 불러옴
	        	employeeBlindList = dao.employeeBlindTotalList(params, cnt, offset);
	            logger.info("회원 전체 리스트 / employeeTotalList");	        
	    } else if (searchType.equals("dept")) {
	        if (!searchText.isEmpty()) {
	            // 해당 dpet_code를 포함하는 리스트를 불러옴
	            	employeeBlindList = dao.employeeBlindDeptTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 부서 리스트 / employeeDeptTotalList");	           
	        }
	    } else if (searchType.equals("name")) {
	        if (!searchText.isEmpty()) {
	            // 해당 name을 포함하는 리스트를 불러옴	            
	            	employeeBlindList = dao.employeeBlindNameTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 이름 리스트 / employeeNameTotalList");	            
	        }
	    } else if (searchType.equals("position")) {
	        if (!searchText.isEmpty()) {
	            // 해당 position을 포함하는 리스트를 불러옴
	            	employeeBlindList = dao.employeeBlindPositionTotalList(params, searchType, searchText, cnt, offset);
	                logger.info("회원 직급 리스트 / employeePositionTotalList");	            
	        }
	    }
	    	    
	    map.put("employeeBlindList", employeeBlindList);
	    logger.info("employeeBlindList :"+employeeBlindList);
	    
		return map; 
	}



	public String companydelete(String cooper_id3) {
		
		int success = dao.companyDelete(cooper_id3);
		logger.info("success :"+success);
		return "redirect:/companyAddress.go";
	}



    public boolean checkDuplicate(String memberId) {
        String existingMemberId = dao.checkDuplicate(memberId);
        return existingMemberId != null;
    }


}
