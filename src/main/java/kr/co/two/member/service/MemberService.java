package kr.co.two.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.two.member.dao.MemberDAO;
import kr.co.two.member.dto.MemberDTO;
import kr.co.two.reservation.dto.ReservationDTO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	

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


}
