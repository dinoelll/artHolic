package kr.co.two.mail.controller;

import java.lang.StackWalker.Option;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.util.UriUtils;

import kr.co.two.mail.dto.MailDTO;
import kr.co.two.mail.service.MailService;

@Controller
public class MailController {

   private final MailService service;
   public MailController(MailService service) {
	this.service= service;
}
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
   @RequestMapping(value="/mailWrite.go")
   public String mailWrite(Model model,HttpSession session) {
		
		 /*String page = "mailWrite"; 
		 if (session.getAttribute("model") != null) {
			Object mailinfo = session.getAttribute("model");
			model.addAttribute("model", mailinfo);
			logger.info("maidinfo"+mailinfo);
			session.removeAttribute("model");
		}*/
		
		 
      return "mailWrite";
   }
   
   @RequestMapping(value="/tempBox.go")
   public String tempBox() {
	   return "tempBox";
   }
   
   // 답장, 전달, 임시저장 상세보기
   @RequestMapping(value="/mailreply.go")
   public String mailreply(Model model, @RequestParam HashMap<String, Object> params,HttpSession session) {
	   logger.info("params: "+params);
	   logger.info("set:"+params.get("set"));
	   String page ="mailReply";
	   int seletedMailId = Integer.parseInt((String) params.get("seletedMailId"));
	   String type= (String) params.get("type");
	   
	   String member_id = (String) session.getAttribute("loginId");
	   
	   model.addAttribute("model", service.mailDetail(model,seletedMailId,type,member_id));
	   if(type.equals("temp")){
		   logger.info("임시저장왔따.");
		   //HashMap<String, ArrayList<MailDTO>> map = (HashMap<String, ArrayList<MailDTO>>) service.mailDetail(model,seletedMailId,type,member_id);
		   //logger.info("map:"+map.get("memberdto"));
		   //session.setAttribute("model", service.mailDetail(model,seletedMailId,type,member_id));
		   //page = "redirect:/mailWrite.go?selfBox=true";
		   model.addAttribute("model", service.mailDetail(model, seletedMailId, type, member_id));
		   model.addAttribute("type", type);
	   }
	   model.addAttribute("set", params.get("set"));
	   return page;
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
	   logger.info("test2");
      return "writeComplete";
   }
   
   // 내게 쓴 메일 전송 완료 페이지 이동
   @GetMapping(value="/selfComplete.go")
   public String selfComplete() {
	   return "selfComplete";
   }
   
   @RequestMapping(value="/mailreadcheck.go")
   public String readcheck() {
	   return "acknowledgment";
   }
   
   // 메일 보내기
   @RequestMapping(value="/mailWrite.do")
   public String mailWrite(@RequestParam String type,@RequestParam HashMap<String, String> params, MultipartFile[] attachment,
         @RequestParam(required = false) String approvers,@RequestParam(required = false) String referrer,RedirectAttributes redirect,HttpSession session) {

      logger.info("type: "+type);
      logger.info("attachment: "+attachment);
      logger.info("params:"+params);
      logger.info("approvers: "+approvers);
      logger.info("referrer: "+referrer);
      String member_id = (String) session.getAttribute("loginId");

      return service.mailWrite(type,params,attachment,approvers,referrer,redirect,member_id);
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
   public String mailDetaildo(Model model,@PathVariable String mail_id,@RequestParam String type,@RequestParam int seletedMailId,HttpSession session) {
      
	  String member_id = (String) session.getAttribute("loginId");
      String page = "mailDetail";
      logger.info("mail_id: "+mail_id);
      logger.info("seletedMailId:"+seletedMailId);
      logger.info("type: "+type);
      
      model.addAttribute("dto", service.mailDetail(model,seletedMailId,type,member_id));
      model.addAttribute("type", type);

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
   public ResponseEntity<Resource> mailPhotoDownload(String path,String file) {
      
      Resource body = new FileSystemResource(root+"/"+path);
      HttpHeaders header = new HttpHeaders();
		/* String fileName = "이미지" + path.substring(path.lastIndexOf(".")); */
      String fileName = UriUtils.encode(file, "UTF-8");
      header.add("Content-type", "application/octet-stream");
      header.add("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

      return new ResponseEntity<>(body, header, HttpStatus.OK);
  }
   
   
   // 임시저장
   @PostMapping(value="mail/temp.ajax")
   @ResponseBody
   public HashMap<String, Object> mailtempWrite(@RequestParam HashMap<String, String> params,String mail_id,
		   @RequestParam(required = false) List<MultipartFile> attachment,HttpServletRequest request,HttpSession session){
      logger.info("params: "+params);
      logger.info("mail_id: "+mail_id);
      String member_id = (String) session.getAttribute("loginId");
       HashMap<String, Object> mailResult = new HashMap<String, Object>();
      
      if (mail_id.equals("undefined") || mail_id == null) {
    	  HashMap<String, Object> mailtempList = null;
    	  logger.info("조건에 들어감");
    	  if(attachment != null && !attachment.isEmpty()) { // 사진이 있을 때 
    		  logger.info("사진 있음");
    		  mailtempList = service.tempList(params,attachment,member_id);
    	  }else { // 사진이 없을 때
    		  logger.info("사진없음");
    		  mailtempList = service.tempList(params,member_id);
    	  }
           
           logger.info("mail_id: " + mailtempList.get("mail_id"));
           mailResult.put("mail_id", mailtempList.get("mail_id"));
       } else { // 두번째 임시저장부터
           service.tempListUpdate(Integer.parseInt(mail_id),params);
           if(attachment != null && !attachment.isEmpty()){
        	   service.tempListUpdate(Integer.parseInt(mail_id),params,attachment);
           }
       }
      
      return mailResult;
   }
   
   // 메일 리스트 아작스
   @RequestMapping(value="mail/selfBox.ajax")
   @ResponseBody
   public HashMap<String, Object> mailSelfBox(@RequestParam String page,@RequestParam String cnt, @RequestParam String searchInformation,
		   @RequestParam String searchText,@RequestParam String type,HttpSession session, @RequestParam String mailFilter){
      logger.info("page: "+page+"/cnt: "+cnt+"/searchInformation: "+searchInformation+"/searchText: "+searchText+"/ mailFilter: "+mailFilter+"/type:"+type);
      String member_id = (String) session.getAttribute("loginId");
	   return service.mailSelfBox(Integer.parseInt(page),Integer.parseInt(cnt),searchInformation,searchText,type,member_id,mailFilter);
   }
   
   // mail 즐겨찾기
   @PostMapping(value="mail/Like.ajax")
   @ResponseBody
   public HashMap<String, Object> mailFavorite(@RequestParam("mailId") Integer mail_id, boolean isLike, @RequestParam String type,HttpSession session,
		   @RequestParam(required = false) String set) {
      logger.info("mail_id: "+mail_id+"/"+"isLike: "+isLike+"/type: "+type+"/set: "+set);
      String member_id = (String) session.getAttribute("loginId");
      return service.mailFavorite(mail_id,isLike,type,member_id,set);
   }
   
   // 휴지통
   @PostMapping(value="mail/trash.ajax")
   @ResponseBody
   public HashMap<String, Object> mailtrash(@RequestParam String mailId, @RequestParam String type,HttpSession session, @RequestParam(required = false) String set){
	   logger.info("mailId: "+mailId+"/ type: "+type+"/ set: "+set);
	   String member_id = (String) session.getAttribute("loginId");
	   return service.mailtrash(mailId,type,member_id,set);
   }
   
   // 휴지통 복원
   @PostMapping(value="mail/restore.ajax")
   @ResponseBody
   public HashMap<String, Object> mailrestore(@RequestParam String mail_id, @RequestParam String type, @RequestParam String set, HttpSession session){
	   logger.info("mail_id: "+mail_id+"/type: "+type+"/set: "+set);
	   String member_id = (String) session.getAttribute("loginId");
	   return service.mailrestore(Integer.parseInt(mail_id),member_id,set);
   }
   
   // 수신확인
   @PostMapping(value="mail/readcheck.ajax")
   @ResponseBody
   public HashMap<String, Object> mailreadcheck(@RequestParam String type, @RequestParam String cnt, @RequestParam String page,HttpSession session){
	   logger.info("type: "+type+"/cnt: "+cnt+"/page: "+page);
	   String member_id = (String) session.getAttribute("loginId");
	   return service.mailreadcheck(type,Integer.parseInt(cnt),Integer.parseInt(page),member_id);
   }
   
   // 발송취소
   @PostMapping(value="mail/delread.ajax")
   @ResponseBody
   public HashMap<String, Object> maildelread(@RequestParam String receivermember, @RequestParam String mail_id){
	   logger.info("receivermember: "+receivermember+"/mail_id: "+mail_id);
	   return service.maildelread(receivermember,mail_id);
   }


}