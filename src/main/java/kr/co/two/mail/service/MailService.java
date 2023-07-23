package kr.co.two.mail.service;

import java.io.File;
import java.io.IOException;
import java.lang.StackWalker.Option;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;

import kr.co.two.alarm.config.WebSocketHandler;
import kr.co.two.mail.dao.MailDAO;
import kr.co.two.mail.dto.MailDTO;

@Service
public class MailService {

   @Autowired MailDAO dao;
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Autowired WebSocketHandler handler;

   public ArrayList<MailDTO> mailgetOptions() {
      
      return dao.mailgetOptions();
      
   }

   // 메일 쓰기
/*   public String mailWrite(String type,HashMap<String, String> params, MultipartFile[] attachment, String approvers,String referrer,RedirectAttributes redirect) {
      
      // 1. 게시글만 작성할 경우
      MailDTO dto = new MailDTO();
      
      dto.setMember_id(params.get("member_id")); // 메일 보낸 사람
      dto.setMailSubject(params.get("mailSubject")); // 메일 제목
      dto.setMailContent(params.get("mailContent")); // 메일 내용
      dto.setType(params.get("type"));
      
      // 메일 쓰기 (type= send,save)
      int row = dao.mailWrite(dto);
      logger.info("mailWrite row: "+row);
      int mail_id = dto.getMail_id();
      logger.info("방금 insert 한 mail_id: "+mail_id);
      
      // 받는사람 저장
      if(!params.get("sendMember").equals("") || !params.get("sendMember").isEmpty()) {
         logger.info("sendMember");
         dto.setMember_id(approvers);
         logger.info("dto approvers: "+dto.getMember_id());
         String[] approverList = approvers.split(",");
         for (int i = 0; i < approverList.length; i++) {
             String approver = approverList[i];
             dto.setMember_id(approver);
             int sendMember = dao.receiverWrite(dto);
             logger.info("sendMember: " + sendMember);
         }
      }
      // 참조자 저장
      if(!params.get("referenceMember").equals("") || !params.get("referenceMember").isEmpty()) {
         logger.info("referenceMember");
         dto.setMember_id(referrer);
         String[] referrerList = referrer.split(",");
         for (int i = 0; i < referrerList.length; i++) {
             String referrers = referrerList[i];
             dto.setMember_id(referrers);
             int referenceMember = dao.referenceMemberWrite(dto);
             logger.info("referenceMember: " + referenceMember);
         }
      }

      
      logger.info("attachment length : " + attachment.length);
      
      // 2. 사진이 있을 경우
      if( attachment.length > 0 && !StringUtils.isEmpty(attachment[0].getOriginalFilename())) {
         logger.info("if문 진입");
         for (MultipartFile file : attachment) {
            logger.info("file:"+file);
            mailPhotoUpload(mail_id,file);
            
            try {
               Thread.sleep(1);
            } catch (InterruptedException e) {
               e.printStackTrace();
            }
         }
      }
      
      //POST 방식으로 보내기
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("mail_id", mail_id);
      map.put("type", type);
      redirect.addFlashAttribute("map", map);
      logger.info("map:"+map.get("mail_id"));
      logger.info("type: "+map.get("type"));
      
      String page = "redirect:/mailDetail.do";
      if(type.equals("temp")) {
         page = "forward:";
      }

      return page;
   }*/

   // 사진 하나씩 저장하기
   private void mailPhotoUpload(int mail_id,MultipartFile file) {
      String ori_file_name = file.getOriginalFilename();
      int index = ori_file_name.lastIndexOf(".");
      String ext = ori_file_name.substring(index);
      String root = "C:/upload/";
      logger.info("file: "+file);
      
      long time = System.currentTimeMillis();
      String new_file_name = time+ext;
      
      logger.info("fileName: "+ori_file_name+" -> "+new_file_name);
      
      try {
         logger.info("file try 진입");
         byte[] bytes = file.getBytes();
         Path path = Paths.get(root+new_file_name);
         logger.info("root: "+root);
         Files.write(path, bytes);
         int row = dao.mailPhotoUpload(mail_id,ori_file_name,root,new_file_name);
         logger.info("photo row: "+row);
      } catch (IOException e) {
         e.printStackTrace();
      }
      
      
   }
   // dto 생성
   private MailDTO createMailDTO(HashMap<String, String> params) {
       MailDTO dto = new MailDTO();

       dto.setMember_id(params.get("member_id")); // 메일 보낸 사람
       dto.setMailSubject(params.get("mailSubject")); // 메일 제목
       dto.setMailContent(params.get("mailContent")); // 메일 내용
       dto.setType(params.get("type"));

       return dto;
   }
   
   // 받는사람 저장
   private void saveReceivers(MailDTO dto, String recipients) {
       if (!recipients.equals("") && !recipients.isEmpty()) {
           logger.info("Saving receivers");
           String[] recipientList = recipients.split(",");
           handler.sendAlarm("알림");
           for (String recipient : recipientList) {
               dto.setMember_id(recipient);
               int result = dao.receiverWrite(dto);
               dao.receiverMailAlarm(dto);
               logger.info("Receiver saved: " + result);
           }
       }
   }

   // 참조자 저장
   private void saveReferrers(MailDTO dto, String referrers) {
       if (!referrers.equals("") && !referrers.isEmpty()) {
           logger.info("Saving referrers");
           String[] referrerList = referrers.split(",");
           for (String referrer : referrerList) {
               dto.setMember_id(referrer);
               int result = dao.referenceMemberWrite(dto);
               dao.referrerMailAlarm(dto);
               logger.info("Referrer saved: " + result);
           }
       }
   }

   // 사진이 있을 경우 메일 작성
   private void processAttachments(int mail_id, MultipartFile[] attachments) {
       if (attachments.length > 0 && !StringUtils.isEmpty(attachments[0].getOriginalFilename())) {
           logger.info("Processing attachments");
           for (MultipartFile file : attachments) {
               logger.info("File: " + file);
               mailPhotoUpload(mail_id, file);
               try {
                   Thread.sleep(1);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
           }
       }
   }
   
   // 금일 날짜 가져오기
   private Timestamp mailWriteDate() {
	    // 현재 날짜와 시간 가져오기
	    LocalDateTime now = LocalDateTime.now();

	    // LocalDateTime을 Timestamp로 변환
	    Timestamp writeTime = Timestamp.valueOf(now);
	    

	    // 변환된 Timestamp 반환
	    return writeTime;
	}
   
   // 사진 완전 삭제
   private void mailPhotoDel(int mail_id) {
	   int photo = dao.mailCheckPhoto(mail_id);
	      if(photo > 0) { // 사진 있으면 삭제
	    	  int delPhoto = dao.mailPhotodel(mail_id);
	    	  List<MailDTO> list = dao.mailCheckPhotoName(mail_id);
	    	  for (MailDTO new_file_name : list) {
	    		  File file = new File("C:/upload/"+new_file_name);
	    		  if(file.exists()) {
	    			  file.delete();
	    		  }
	    		  
			}
	      }
   }


   // 메일 쓰기
   public String mailWrite(String type, HashMap<String, String> params, MultipartFile[] attachments, String approvers, String referrers, RedirectAttributes redirect, String member_id) {
       MailDTO dto = createMailDTO(params);
       Timestamp writeTime = mailWriteDate(); // 날짜 정보 가져오기
       logger.info("writeTime: "+writeTime);
       dto.setWriteTime(writeTime);
       dto.setMember_id(member_id);

       if(type.equals("tempsave")) {
    	   dto.setMail_id(Integer.parseInt(params.get("mail_id")));
    	   dao.tempsaveupdate(params.get("mail_id"),writeTime,params.get("mailSubject"),params.get("mailContent"));	   
       }else {
    	   int row = dao.mailWrite(dto);
    	   logger.info("mailWrite row: " + row);
       }
       int mail_id = dto.getMail_id();
       logger.info("Inserted mail_id: " + mail_id);

       if(approvers != null && !approvers.isEmpty()) {
          saveReceivers(dto, approvers);
       }
          
          if (approvers != null && !approvers.isEmpty() && referrers != null && !referrers.isEmpty()) {
        	    String[] approverArray = approvers.split(",");
        	    String[] referrerArray = referrers.split(",");
        	    //중복제거
        	    Set<String> uniqueReferrers = new HashSet<>(Arrays.asList(referrerArray));

        	    for (String referrer : uniqueReferrers) {
        	        if (!Arrays.asList(approverArray).contains(referrer)) {
        	            saveReferrers(dto, referrer);
        	        }
        	    }
        	}
        if(type.equals("tempsave")) {
        	// 기존 파일 삭제
        	mailPhotoDel(mail_id);
        }
       if(attachments.length > 0 && !StringUtils.isEmpty(attachments[0].getOriginalFilename())) {
           processAttachments(mail_id, attachments);
        }
       
       if(type.equals("save") || type.equals("tempsave")) {
          logger.info("저장");
          approvers = member_id;
          dto.setMember_id(approvers);
          int saverow = dao.savereceiverWrite(dto);
       }

       String page ="";
       //page = "redirect:/mailDetail.do";
       if(type.equals("save")||type.equals("tempsave")){
          page = "redirect:/selfComplete.go";
       }else if(type.equals("send")) {
    	   page = "redirect:/writeComplete.go";
       }

       return page;
   }

   // 메일 상세보기
   /*public HashMap<String, ArrayList<MailDTO>> mailDetail(Map<String, Object> params, HttpServletRequest request) {   
      ArrayList<MailDTO> sendMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailpthotoList = new ArrayList<MailDTO>();
      HashMap<String, ArrayList<MailDTO>> map = new HashMap<String, ArrayList<MailDTO>>();
      logger.info("params: "+params);
      int mail_id = (int) params.get("mail_id");
      
      if(params.get("type").equals("send")) {
         // 참조자가 있는지 확인
         int row = dao.findMailReference(mail_id);
         logger.info("row: "+row);
         // 받는사람, 참조자 리스트 가져오기
         sendMemberList = dao.mailSendDetail(mail_id,row);
         
         logger.info("size : " + sendMemberList.size());
         map.put("dto", sendMemberList);
         // 보낸사람 리스트 가져오기
         mailMemberList = dao.mailMemberDetail(mail_id);
         map.put("memberdto", mailMemberList);
         logger.info("받는사람: "+sendMemberList.toArray());
         logger.info("보낸사람: "+mailMemberList.toArray());
      }else if(params.get("type").equals("save")){
         mailMemberList = dao.mailMemberDetail(mail_id);
         map.put("memberdto", mailMemberList);
         logger.info("보낸사람: "+mailMemberList.toArray());
      }else if(params.get("type").equals("temp")) {
         
      }
      
      int photo = dao.mailCheckPhoto(mail_id);
      if(photo > 0) {
         mailpthotoList = dao.mailHasPhoto(mail_id);
         map.put("mailpthotoList", mailpthotoList);
         logger.info("파일사이즈: "+mailpthotoList.size());
      }
      
      return map;
   }
   */

   // 처음 임시저장 게시글만 작성
   public HashMap<String, Object> tempList(HashMap<String, String> params, String member_id) {
	   MailDTO dto = createMailDTO(params);
      Timestamp writeTime = mailWriteDate(); // 날짜 정보 가져오기
      dto.setWriteTime(writeTime);
      dto.setMember_id(member_id);

       int row = dao.mailWrite(dto);
       logger.info("mailWrite row: " + row);
       int mail_id = dto.getMail_id();
       logger.info("Inserted mail_id: " + mail_id);
       
       HashMap<String, Object> mailResult = new HashMap<String, Object>();
       mailResult.put("mail_id", mail_id);
       logger.info("mailResult: " + mailResult.get("mail_id"));
	       
		return mailResult;
	}
   
   // 처음 임시저장 (사진포함)
   public HashMap<String, Object> tempList(HashMap<String, String> params, List<MultipartFile> attachments, String member_id) {
      
      MailDTO dto = createMailDTO(params);
      Timestamp writeTime = mailWriteDate(); // 날짜 정보 가져오기
      dto.setWriteTime(writeTime);
      dto.setMember_id(member_id);

       int row = dao.mailWrite(dto);
       logger.info("mailWrite row: " + row);
       int mail_id = dto.getMail_id();
       logger.info("Inserted mail_id: " + mail_id);
       
       if (attachments.size() > 0 && !attachments.isEmpty()) {
           logger.info("Processing attachments");
           for (MultipartFile file : attachments) {
               logger.info("File: " + file);
               mailPhotoUpload(mail_id, file);
               try {
                   Thread.sleep(1);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
           }
       }

       HashMap<String, Object> mailResult = new HashMap<String, Object>();
       mailResult.put("mail_id", mail_id);
       logger.info("mailResult: " + mailResult.get("mail_id"));

       return mailResult;

   }
   
   // 두번째 임시저장 // 게시글만
   public void tempListUpdate(int mail_id, HashMap<String, String> params) {
      logger.info("mail_id: "+params.get("mail_id"));
      
      mailPhotoDel(mail_id);
      Timestamp writeTime = mailWriteDate(); // 날짜 정보 가져오기
      logger.info("writeTime: "+writeTime);
      params.put("writeTime", writeTime.toString());
      int row = dao.tempListUpdate(params);
  
      logger.info("row: "+row);
     
   }
   
   // 두번째 임시저장 // 사진 있을 때
   public void tempListUpdate(int mail_id,HashMap<String, String> params, List<MultipartFile> attachment) {
	   
	   tempListUpdate(mail_id, params);
	      
      if (attachment.size() > 0 && !attachment.isEmpty()) {
           logger.info("Processing attachments");
           for (MultipartFile file : attachment) {
               logger.info("File: " + file);
               mailPhotoUpload(mail_id, file);
               try {
                   Thread.sleep(1);
               } catch (InterruptedException e) {
                   e.printStackTrace();
               }
           }
       }
		
   }
   
   // 즐겨찾기
   public HashMap<String, Object> mailFavorite(Integer mail_id, boolean isLike, String type, String member_id, String set) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      dao.mailFavorite(mail_id,isLike,type,member_id,set);
      MailDTO dto = dao.isFavoriteStatus(mail_id,type,member_id,set);
      logger.info("isLikeStatues : "+dto );
      logger.info("bookmark: "+dto.isBookmark());
      logger.info("favorites: "+dto.isFavorites());
      map.put("isLike", dto);
      return map;
   }

   

   // 메일 리스트 아작스
   public HashMap<String, Object> mailSelfBox(int page, int cnt, String searchInformation, String searchText, String type, String member_id,String mailFilter) {
		logger.info("아작스도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MailDTO> list = new ArrayList<MailDTO>();
		  
		int offset = (page-1)*cnt;
		int total = dao.totalCount(type,searchInformation,searchText,member_id);
		int range = total%cnt == 0?total/cnt:(total/cnt)+1;
		  
		logger.info("전체 게시물 수: "+total);
		logger.info("총 페이지:" +range);
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);
		/*
		 * if(!searchInformation.equals("") && searchInformation!=null) { total =
		 * dao.totalCount(type,searchInformation); }
		 */
		logger.info("total: "+total);
		list = dao.mailSelfBox(cnt,offset,type,searchInformation,searchText,member_id,mailFilter);
		map.put("list", list);
		/*
		 * for (MailDTO maillist : list) { // 리스트 하나하나씩 꺼내기
		 * logger.info("receiver list: "+maillist.getIs_receiver()); }
		 */
		return map;
   }

   // 메일 상세보기
   @Transactional(rollbackFor = Exception.class, isolation = Isolation.DEFAULT)
   public Object mailDetail(Model model,int seletedMailId, String type, String member_id) {
      ArrayList<MailDTO> sendMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailpthotoList = new ArrayList<MailDTO>();
      HashMap<String, ArrayList<MailDTO>> map = new HashMap<String, ArrayList<MailDTO>>();
      int mail_id = seletedMailId;
      
      // 받는사람 참조자 가져오기
     sendMemberList = dao.mailSendDetail(mail_id,member_id);
 	 logger.info("size : " + sendMemberList.size());
     
      map.put("dto", sendMemberList);
      // `mailMemberList`에서 `mail_id`가 `NULL`인 행 제외
      /*for (Iterator<MailDTO> iterator = mailMemberList.iterator(); iterator.hasNext();) {
          MailDTO mail = iterator.next();
          if (Integer.valueOf(mail.getMail_id()) == null) {
              iterator.remove();
          }
      }
      */
      // 디테일 가져오기
      mailMemberList = dao.mailMemberDetail(mail_id,type,member_id);
      
      
      for (Iterator<MailDTO> iterator = mailMemberList.iterator(); iterator.hasNext();) {
          MailDTO mail = iterator.next();
          Integer mailId = mail.getMail_id();
          if (mailId == null) {
              iterator.remove();
          } else {
              // mailId가 null이 아닌 경우에 대한 추가 로직 처리
              logger.info("receiver list: " + mail.getDept_name());
              logger.info("receiver list: " + mail.getPosition_name());
          }
      }
      
      
      map.put("memberdto", mailMemberList);

      /*for (MailDTO maillist : mailMemberList) { // 리스트 하나하나씩 꺼내기
			logger.info("receiver list: "+maillist.getDept_name());
			logger.info("receiver list: "+maillist.getPosition_name());
			int mailId = maillist.getMail_id();
      }*/
      
      //사진 가져오기
      int photo = dao.mailCheckPhoto(mail_id);
      if(photo > 0) {
         mailpthotoList = dao.mailHasPhoto(mail_id);
         map.put("mailpthotoList", mailpthotoList);
         logger.info("파일사이즈: "+mailpthotoList.size());
      }
      
      // 수신확인
      if(type.equals("self")|| type.equals("receive")) {
    	  Timestamp writeTime = mailWriteDate();
    	  dao.updateread(mail_id,member_id,writeTime,member_id);  
      }
      
      return map;
   }

   // 휴지통 (삭제) blind = 0
	public HashMap<String, Object> mailtrash(String mail_Id, String type,String member_id, String set) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(type.equals("trash")) {
			int delrow = dao.maildel(Integer.parseInt(mail_Id), member_id,set);
			logger.info("delrow: "+delrow);
			map.put("result", delrow);
		}else {
			int row = dao.mailtrash(mail_Id,type,member_id);
			logger.info("trash row: "+row);
			map.put("result", row);
		}	
		return map;
	}

	// 복원
	public HashMap<String, Object> mailrestore(int mail_id, String member_id, String set) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int restorerow = dao.mailrestore(mail_id,member_id,set);
		map.put("result", restorerow);
		return map;
	}

	//수신확인
	public HashMap<String, Object> mailreadcheck(String type, int cnt, int page, String member_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MailDTO> list = new ArrayList<MailDTO>();
		  
		int offset = (page-1)*cnt;
		int total = dao.readchktotal(member_id);
		int range = total%cnt == 0?total/cnt:(total/cnt)+1;
		  
		logger.info("전체 게시물 수: "+total);
		logger.info("총 페이지:" +range);
		
		page = page > range ? range : page;
		
		map.put("currPage", page);
		map.put("pages", range);

		logger.info("total: "+total);
		list = dao.readchkBox(member_id,cnt,offset);
		map.put("list", list);
		return map;
	}

	// 발송취소
	public HashMap<String, Object> maildelread(String receivermember, String mail_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = dao.delread(receivermember,mail_id);
		logger.info("row: "+row);
		map.put("result", row);
		
		return map;
	}


}