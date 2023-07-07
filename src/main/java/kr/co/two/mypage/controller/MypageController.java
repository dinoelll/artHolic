package kr.co.two.mypage.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.UriUtils;

import kr.co.two.mypage.dto.EventDataDTO;
import kr.co.two.mypage.service.MypageService;

@Controller
public class MypageController {

   private final MypageService service;

   public MypageController(MypageService service) {
      this.service = service;
   }

   Logger logger = LoggerFactory.getLogger(getClass());

		int folderId = Integer.parseInt(folder_id);
		
		service.upload(formData,folderId);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Refresh", "0;url=/myfolder");
	    
		return "redirect:/myfolder";
	}
	
	@GetMapping(value="/list.ajax")
	@ResponseBody
	public HashMap<String, Object> folderList(){
		
		logger.info("folderList Controller");
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    ArrayList<String> list = service.folderList();
	    map.put("folder-list", list);
	    
	    return map;
	}
	
	@PostMapping(value="/filelist.ajax")
	@ResponseBody
	public HashMap<String, Object> fileList(@RequestParam String folder_id, HttpServletResponse response){
		
		logger.info("fileList Controller");
		
		int folderId = Integer.parseInt(folder_id);
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
	    ArrayList<String> fileList = service.fileList(folderId);
	    map.put("file-list", fileList);
	    
	    response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Refresh", "0;url=/myfolder");
	    
	    return map;
	}
	
	@RequestMapping(value="/updateFolder.ajax")
	@ResponseBody
	public String myFolderUpdate(@RequestParam String folderName, @RequestParam String folder_id, HttpServletResponse response) {
		
		logger.info("updateFolder Controller");
		
		int folderId = Integer.parseInt(folder_id);
		 	 
		logger.info("folderName"+"/"+folderName+"folder_id"+"/"+folderId);
		 
		service.myFolderUpdate(folderName,folderId);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Refresh", "0;url=/myfolder");
		
		return "redirect:/myfolder";
	}
	
	@RequestMapping(value="/deleteFolder.ajax")
	@ResponseBody
	public String myFolderDelete(@RequestParam String folder_id, HttpServletResponse response) {
		
		logger.info("deleteFolder Controller");
		logger.info("folder_id : " + folder_id);
		
		int folderId = Integer.parseInt(folder_id);
	 	 
		logger.info("folder_id"+"/"+folderId);
		
		  service.myFolderDelete(folderId);
		 
		  response.setHeader("Cache-Control", "no-cache");
		  response.setHeader("Refresh", "0;url=/myfolder");
		 
		return "redirect:/myfolder";
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/calendarUpdate.ajax")
	@ResponseBody
	public String calendarUpdate(@RequestBody ArrayList<EventDataDTO> eventDataList) {
		
		service.calendarUpdate(eventDataList);
		
	
		
		return "success";
	}
	
	@RequestMapping(value="/calendarUpdate2.ajax")
	@ResponseBody
	public String calendarUpdate2(@RequestBody EventDataDTO requestData) {
		
		logger.info("requestdata : "+requestData.getMember_id() );
		
		service.calendarUpdate2(requestData);

        
        return events;
    }
    
    @PostMapping("/eventDelete.ajax")
    @ResponseBody
    public HashMap<String, String> eventDelete(@RequestParam String id ) {
        logger.info("id:"+id);
        
        int row = service.eventDelete(id);
        HashMap<String, String>map = new HashMap<String, String>();
        
        
        if (row ==1) {
        	
            map.put("data", "삭제성공");
		}
        
        
        map.put("data", "삭제실패");
        
        
        
        return map;
    }
	
	

	@GetMapping(value="/download.do")
	public ResponseEntity<Resource> download(@RequestParam("ori_fileName") String oriFileName, @RequestParam("new_fileName") String newFileName) {

   

   @PostMapping("/eventDelete.ajax")
   @ResponseBody
   public HashMap<String, String> eventDelete(@RequestParam String indi_calendar_id) {
      logger.info("id:" + indi_calendar_id);

      int row = service.eventDelete(indi_calendar_id);
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("data", "삭제실패");
      logger.info("row:"+row);

      if (row == 1) {
         map.put("data", "삭제성공");
      }

      return map;
   }package kr.co.two.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.two.member.dto.MemberDTO;
import kr.co.two.member.service.MemberService;

@Controller
public class MemberController {

   @Autowired MemberService service;
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired PasswordEncoder encoder;

   @RequestMapping(value="/employeeWrite")
   public String employeeWrite() {
      
      logger.info("employeeWrite Controller");
      
      return "employeeWrite";
   }
   
   @RequestMapping(value="/employeeList.go")
   public String employeeList() {
      
      logger.info("employeeList Controller");
      
      return "employeeList";
   }
   
   @RequestMapping(value="/employeeList.ajax")
   @ResponseBody
   public HashMap<String, Object> employeeListCall(@RequestParam HashMap<String,Object> params) {
      
      logger.info("employeeList Call Controller");
      return service.employeeList(params);
   }
   
   @RequestMapping(value="/join.go")
   public String employeeJoinGo() {
      
      logger.info("employeeJoin Go Controller");
      
      return "employeeWrite";
   }
   
   @PostMapping(value="/join.do")
   public ModelAndView employeeJoinDo(@RequestParam HashMap<String, String> params, @RequestParam MultipartFile profile) {
       
      logger.info("employeeJoin Do Controller");
       logger.info("params: " + params);
       logger.info("profile :"+ profile);
       
       String emailPrefix = params.get("emailPrefix");
       String email3 = params.get("email3");
       
       String email = emailPrefix + "@" + email3;
       logger.info("email :"+email);
       
       String year = params.get("year");
       String month = params.get("month");
       String day = params.get("day");

       String birthdayString = year + "-" + month + "-" + day;

       // Convert birthday value to a Date object
       try {
           SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           Date utilDate = dateFormat.parse(birthdayString);
           java.sql.Date birthdayDate = new java.sql.Date(utilDate.getTime());
           params.put("birthday", birthdayDate.toString());
       } catch (ParseException e) {
           // Handle birthday conversion error
           logger.error("Failed to parse birthday: " + birthdayString, e);
       }

       return service.join(params,profile,email);
   }
   
   @RequestMapping(value="/admin.ajax")
   @ResponseBody
   public void admin(@RequestParam String memberId, @RequestParam Boolean adminValue) {
      
      logger.info("employeeJoin Controller");
      logger.info("memberId :"+memberId+"/"+"adminValue :"+adminValue);
      
      service.admin(memberId,adminValue);
   }

   @RequestMapping(value="/changePw.ajax")
   @ResponseBody
   public String changePw(@RequestParam String pw) {
      
      logger.info("changePw Controller");
      logger.info("pw :"+pw);
      
      int success = service.changePw(pw);
      logger.info("success :"+success);
      
      // JSON 응답 생성
       ObjectMapper mapper = new ObjectMapper();
       Map<String, Integer> response = new HashMap<>();
       response.put("success", success);
       String jsonResponse = "";
       try {
           jsonResponse = mapper.writeValueAsString(response);
       } catch (JsonProcessingException e) {
           e.printStackTrace();
       }

       return jsonResponse;
   }
   
   @PostMapping(value="/login.do")
   public String Login(@RequestParam String id, @RequestParam String pw, HttpSession session, Model model) {
      
      logger.info("Login Controller");
      logger.info("id :"+id+"/"+"pw :"+pw);
      
      String page = "login";
      
      if(service.login(id, pw)) {
         page = "main";
         /* session.setAttribute("loginId", id); */
      }else {
         model.addAttribute("msg","Id 또는 Password를 확인 해 주세요");
      }
      return page;
   }
   
   @RequestMapping(value="/updateMember.go")
   public String updateMember(@RequestParam String member_id, Model model) {
       logger.info("updateMember Controller");
       logger.info("member_id :"+member_id);
       
       MemberDTO memberDto = service.memberDetail(member_id);
       
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
       String birthday = dateFormat.format(memberDto.getBirthday());
       String[] birthdayArr = birthday.split("-");
       String year = birthdayArr[0];
       String month = birthdayArr[1];
       String day = birthdayArr[2];
       
       Map<String, Object> memberMap = new HashMap<>();
       memberMap.put("year", year);
       memberMap.put("month", month);
       memberMap.put("day", day);
       
       String email = memberDto.getEmail(); // 저장된 이메일 가져오기
       String[] emailArr = email.split("@"); // @를 기준으로 나누기
       String emailPrefix = emailArr[0]; // 이메일 앞부분
       String email3 = emailArr[1]; // 이메일 뒷부분

       model.addAttribute("emailPrefix", emailPrefix);
       model.addAttribute("email3", email3);
       
       model.addAttribute("memberMap", memberMap);
       model.addAttribute("member",memberDto);
       
       return "employeeUpdate";
   }
   
   @PostMapping(value="/update.do")
   public ModelAndView employeeUpdate(@RequestParam HashMap<String, String> params, @RequestParam MultipartFile profile) {
      
      logger.info("employeeUpdate Controller");
      logger.info("params: " + params);
       logger.info("profile :"+ profile);
       
       String emailPrefix = params.get("emailPrefix");
       String email3 = params.get("email3");
       
       String email = emailPrefix + "@" + email3;
       logger.info("email :"+email);
       
       String year = params.get("year");
       String month = params.get("month");
       String day = params.get("day");

       String birthdayString = year + "-" + month + "-" + day;

       // Convert birthday value to a Date object
       try {
           SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
           Date utilDate = dateFormat.parse(birthdayString);
           java.sql.Date birthdayDate = new java.sql.Date(utilDate.getTime());
           params.put("birthday", birthdayDate.toString());
       } catch (ParseException e) {
           // Handle birthday conversion error
           logger.error("Failed to parse birthday: " + birthdayString, e);
       }

       return service.update(params,profile,email);
   }
   
   @RequestMapping(value="/companyAddress.go")
   public String companyAddressList() {
      
      logger.info("companyAddress Controller");
      
      return "companyAddress";
   }
   
   @RequestMapping(value="/companyList.ajax")
   @ResponseBody
   public HashMap<String, Object> companyListCall(@RequestParam HashMap<String,Object> params) {
      
      logger.info("companyList Call Controller");
      return service.companyList(params);
   }
   
   @RequestMapping(value="/companyWrite.ajax")
   @ResponseBody
   public String companyWrite(@RequestParam HashMap<String,Object> params) {
      
      logger.info("companyWrite Call Controller");
      logger.info("params :"+params);
      
      return service.companyWrite(params);
   }
   
   @RequestMapping(value="/companyDetail.ajax")
   @ResponseBody
   public HashMap<String, Object> companyDetail(@RequestParam HashMap<String,Object> params) {
      
      logger.info("companyUpdate Call Controller");
      logger.info("params :"+params);
      String cooper_id = (String) params.get("cooper_id");
      
      HashMap<String, Object> result = new HashMap<String, Object>();
       result.put("company", service.companyDetail(cooper_id));

       return result;
   }
   
   @PostMapping(value="/companyUpdate.ajax")
   public String companyUpdate(@RequestParam HashMap<String, String> params) {
      
      logger.info("companyUpdate Do Controller");
      logger.info("params :"+params);
      
      return service.companyupdate(params);
      
   }

}

<<<<<<< HEAD
   @GetMapping(value = "/download.do")
   public ResponseEntity<Resource> download(@RequestParam("ori_fileName") String oriFileName,
         @RequestParam("new_fileName") String newFileName) {
=======
	    // Return the ResponseEntity with the file resource, headers, and OK status
	    return new ResponseEntity<>(body, headers, HttpStatus.OK);
	}
	
	@PostMapping(value="/deleteFile.ajax")
	@ResponseBody
	public String deleteFile(@RequestParam String fileName, HttpServletResponse response) {
		
		logger.info("fileName :"+fileName);
		
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Refresh", "0;url=/myfolder");
		
		service.deleteFile(fileName);
		
		return "redirect:/myfolder";
	}
	
	
	@PostMapping(value="/pwChange.do")
	public String pwChange(@RequestParam String pw) {
		
		logger.info("pw :"+pw);
		
		
		
		return null;
	}

>>>>>>> 1fbdfc8b621daa5c2a65811aab742d13e9cb275c

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

   @PostMapping(value = "/deleteFile.ajax")
   @ResponseBody
   public String deleteFile(@RequestParam String fileName, HttpServletResponse response) {

      logger.info("fileName :" + fileName);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      service.deleteFile(fileName);

      return "redirect:/myfolder";
   }

   @PostMapping(value = "/pwChange.do")
   public String pwChange(@RequestParam String pw) {

      logger.info("pw :" + pw);

      return null;
   }

}