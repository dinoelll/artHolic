package kr.co.two.mail.service;

import java.io.IOException;
import java.lang.StackWalker.Option;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;

import kr.co.two.mail.dao.MailDAO;
import kr.co.two.mail.dto.MailDTO;

@Service
public class MailService {

   @Autowired MailDAO dao;
   
   Logger logger = LoggerFactory.getLogger(getClass());

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
           for (String recipient : recipientList) {
               dto.setMember_id(recipient);
               int result = dao.receiverWrite(dto);
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

   // 메일 쓰기
   public String mailWrite(String type, HashMap<String, String> params, MultipartFile[] attachments, String approvers, String referrers, RedirectAttributes redirect) {
       MailDTO dto = createMailDTO(params);

       int row = dao.mailWrite(dto);
       logger.info("mailWrite row: " + row);
       int mail_id = dto.getMail_id();
       logger.info("Inserted mail_id: " + mail_id);

       if(approvers != null && !approvers.isEmpty()) {
          saveReceivers(dto, approvers);
       }
       if(referrers != null && !referrers.isEmpty()) {
          saveReferrers(dto, referrers);
       }
       if(attachments.length > 0 && !StringUtils.isEmpty(attachments[0].getOriginalFilename())) {
          processAttachments(mail_id, attachments);
       }
       
       if(type.equals("save")) {
          logger.info("저장");
          approvers = "9988392";// 나중에 로그인 아이디로 바꾸기
          dto.setMember_id(approvers);
          int saverow = dao.savereceiverWrite(dto);
       }

       // POST 방식으로 보내기
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("mail_id", mail_id);
       map.put("type", type);
       redirect.addFlashAttribute("map", map);
       logger.info("map: " + map.get("mail_id"));
       logger.info("type: " + map.get("type"));

       String page ="";
       //page = "redirect:/mailDetail.do";
       if(type.equals("save")){
          page = "redirect:/selfBox.go";
       };

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

   // 처음 임시저장
   public HashMap<String, Object> tempList(HashMap<String, String> params) {
      
      MailDTO dto = createMailDTO(params);

       int row = dao.mailWrite(dto);
       logger.info("mailWrite row: " + row);
       int mail_id = dto.getMail_id();
       logger.info("Inserted mail_id: " + mail_id);

       if(!params.get("sendMember").isEmpty() && params.get("sendMember")!=null) {
          logger.info("도착");
          saveReceivers(dto, params.get("approvers"));
          // 옵션값이 temp=1 receiver 테이블에서 삭제코드 필요
       }
       if(params.get("referrers") != null && !params.get("referenceMember").isEmpty()) {
          logger.info("도착2");
          saveReferrers(dto, params.get("referrer"));
       }
       HashMap<String, Object> mailResult = new HashMap<String, Object>();
       mailResult.put("mail_id", mail_id);
       logger.info("mailResult: " + mailResult.get("mail_id"));
       return mailResult;
   }
   public HashMap<String, Object> mailFavorite(Integer mail_id, boolean isFavorite) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      int row = dao.mailFavorite(mail_id,isFavorite);
      logger.info("row: "+row);
      boolean isFavoriteStatus = dao.isFavoriteStatus(mail_id);
      logger.info("isFavoriteStatus : "+isFavoriteStatus );
      map.put("isFavorite", isFavoriteStatus);
      return map;
   }

   public void tempListUpdate(HashMap<String, String> params) {
      logger.info("mail_id: "+params.get("mail_id"));

      int row = dao.tempListUpdate(params);
      logger.info("row: "+row);
      
      /*
      if(!params.get("sendMember").isEmpty() && params.get("sendMember")!=null) {
         String type="sendMember";

       }
       if(params.get("referrers") != null && !params.get("referrers").isEmpty()) {
          String type= "referrers";

       }
      */
   }

   // 내게쓰기 리스트 아작스
   public HashMap<String, Object> mailSelfBox() {
      logger.info("아작스도착");
      HashMap<String, Object> map = new HashMap<String, Object>();
      ArrayList<MailDTO> list = new ArrayList<MailDTO>();
      list = dao.mailSelfBox();
      map.put("list", list);
      return map;
   }

   public Object mailDetail(int seletedMailId, String type) {
      ArrayList<MailDTO> sendMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailMemberList = new ArrayList<MailDTO>();
      ArrayList<MailDTO> mailpthotoList = new ArrayList<MailDTO>();
      HashMap<String, ArrayList<MailDTO>> map = new HashMap<String, ArrayList<MailDTO>>();
      int mail_id = seletedMailId;
      
      if(type.equals("send")) {
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
      }else if(type.equals("save")){
         mailMemberList = dao.mailMemberDetail(mail_id);
         map.put("memberdto", mailMemberList);
         logger.info("보낸사람: "+mailMemberList.toArray());
      }else if(type.equals("temp")) {
         
      }
      
      int photo = dao.mailCheckPhoto(mail_id);
      if(photo > 0) {
         mailpthotoList = dao.mailHasPhoto(mail_id);
         map.put("mailpthotoList", mailpthotoList);
         logger.info("파일사이즈: "+mailpthotoList.size());
      }
      
      return map;
   }

   // 받는사람, 참조자 즐겨찾기
   public HashMap<String, Object> mailbookmark(int mailId, Boolean isFavorite, String type) {
      HashMap<String, Object> map = new HashMap<String, Object>();
      int row = dao.mailbookmark(mailId,isFavorite,type);
      logger.info("row: "+row);
      boolean isFavoriteStatus = dao.isbookmarkStatus(mailId,type);
      logger.info("isFavoriteStatus : "+isFavoriteStatus );
      map.put("isFavorite", isFavoriteStatus);
      return map;
   }



}