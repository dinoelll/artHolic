package kr.co.two.mail.controller;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.two.mail.dto.MailDTO;
import kr.co.two.mail.service.MailService;

@Controller
public class MailController {

   @Autowired MailService service;
   @Value("${spring.servlet.multipart.location}") private String root;
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   // 받은 메일함 이동
   @GetMapping(value="/inBox.go")
   public String inBox() {
      
      return "inBox";
   }
   
   // 내게 쓴 메일함 이동
   @GetMapping(value="/selfBox.go")
   public String selfBox() {
      
      return "selfBox";
   }
   
   // 보낸 메일함 이동
   @GetMapping(value="/sendBox.go")
   public String sendBox() {
      
      return "sendBox";
   }
   
   // 중요 메일함 이동
   @GetMapping(value="/importantBox.go")
   public String importantBox() {
      
      return "importantBox";
   }
   
   // 메일쓰기 이동
   @GetMapping(value="/mailWrite.go")
   public String mailWrite() {
   
      return "mailWrite";
   }
   
   
   /*
    * @GetMapping(value="/mailWrite2.go") public String mailWrite2(@RequestParam
    * String id,@RequestParam String name,@RequestParam String dept,@RequestParam
    * String position, Model model) { if (id != null && name !=null && dept !=null
    * && position !=null) { model.addAttribute("id", id);
    * model.addAttribute("name", name); model.addAttribute("dept", dept);
    * model.addAttribute("position", position); }
    * logger.info(id+name+dept+position); return "mailWrite"; }
    */
   
   
   
   // 휴지통 이동
   @GetMapping(value="/trashBox.go")
   public String trashBox() {
      
      return "trashBox";
   }
   
   // 검색결과 이동
   @GetMapping(value="/searchBox.go")
   public String searchBox() {
      
      return "searchBox";
   }
   
   // 메일 상세보기 이동
   @GetMapping(value="/mailDetail.go")
   public String mailDetail() {
      
      return "mailDetail";
   }
   
   //내게 쓴 메일 이동
   @GetMapping(value="/selfMailDetail.go")
   public String selfMailDetail() {
      
      return "selfMailDetail";
   }
   
   // 메일 전송 완료 페이지 이동
   @GetMapping(value="/writeComplete.go")
   public String writeComplete() {
      
      return "writeComplete";
   }
   
   // 메일 보내기
   @RequestMapping(value="/mailWrite.do")
   public String mailWrite(@RequestParam String type,@RequestParam HashMap<String, String> params, MultipartFile[] attachment,
         @RequestParam(required = false) String approvers,@RequestParam(required = false) String referrer,RedirectAttributes redirect) {

      logger.info("type: "+type);
      logger.info("attachment: "+attachment);
      logger.info("params:"+params);
      logger.info("approvers: "+approvers);
      logger.info("referrer: "+referrer);

      return service.mailWrite(type,params,attachment,approvers,referrer,redirect);
   }
   
   // 받는사람, 참조자
   @GetMapping(value="/mail/getOption.ajax")
   @ResponseBody
   public HashMap<String, Object> mailgetOptions(){
      HashMap<String, Object> map = new HashMap<String, Object>();
      ArrayList<MailDTO> option = service.mailgetOptions();
      map.put("option", option);
      return map;
   }
   
   //메일 상세보기
   @RequestMapping(value="/mailDetail.do/{mail_id}")
   public String mailDetaildo(Model model,@PathVariable String mail_id,@RequestParam String type,@RequestParam int seletedMailId) {
      
      String page = "mailDetail";
      logger.info("mail_id: "+mail_id);
      logger.info("seletedMailId:"+seletedMailId);
      logger.info("type: "+type);
      
      model.addAttribute("dto", service.mailDetail(seletedMailId,type));

      /*Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
      if(flashMap != null) {
         params=(Map<String, Object>) flashMap.get("map");
         logger.info("params ? " + params);
         model.addAttribute("dto", service.mailDetail(params,request));
      }*/
      
      return page;
   }
   
   //메일 상세보기 파일 다운로드
   @GetMapping(value="mailPhotoDownload.do")
   public ResponseEntity<Resource> mailPhotoDownload(String path) {
      
      Resource body = new FileSystemResource(root+"/"+path);
      HttpHeaders header = new HttpHeaders();
      String fileName = "이미지"+path.substring(path.lastIndexOf("."));
      header.add("Content-type", "application/octet-stream");
      header.add("content-Disposition", "attatchment;fileName\""+fileName+"\"");
      
      return new ResponseEntity<Resource>(body,header,HttpStatus.OK);
   }
   
   
   @PostMapping(value="mail/temp.ajax")
   @ResponseBody
   public HashMap<String, Object> mailtempWrite(@RequestParam HashMap<String, String> params,String mail_id,
         @RequestParam(required = false) String approvers,@RequestParam(required = false) String referrer){
      logger.info("params: "+params);
      logger.info("mail_id: "+mail_id);
      logger.info("approvers"+approvers);
      logger.info("referrer"+referrer);
      HashMap<String, Object> mailResult = new HashMap<String, Object>();
      
      if (mail_id == null) {
           HashMap<String, Object> mailtempList = service.tempList(params);
           logger.info("mail_id: " + mailtempList.get("mail_id"));
           mailResult.put("mail_id", mailtempList.get("mail_id"));
       } else {
           service.tempListUpdate(params);
       }
      // 수정필요
      if(approvers!=null) {
         params.put("approvers", approvers);
         logger.info("approvers"+approvers);
      }
      if(referrer!=null) {
         params.put("referrer", referrer);
         logger.info("referrer", referrer);
      }
      
      return mailResult;
   }
   
   @PostMapping(value="mail/favorite.ajax")
   @ResponseBody
   public HashMap<String, Object> mailFavorite(@RequestParam("mailId") Integer mail_id, boolean isFavorite) {
      logger.info("mail_id: "+mail_id+"/"+"isFavorite: "+isFavorite);
      // 받는사람, 참조자 즐쳐작기 필요함 (수정필요)
      return service.mailFavorite(mail_id,isFavorite);
   }
   
   @RequestMapping(value="mail/selfBox.ajax")
   @ResponseBody
   public HashMap<String, Object> mailSelfBox(){
      return service.mailSelfBox();
   }
   
   @RequestMapping(value="mail/bookmark.ajax")
   @ResponseBody
   public HashMap<String, Object> mailbookmark(@RequestParam int mailId, @RequestParam Boolean isFavorite, @RequestParam String type){
      logger.info("mailId: "+mailId+"isFavorite: "+isFavorite+"type: "+type);
      return service.mailbookmark(mailId,isFavorite,type);
   }
}