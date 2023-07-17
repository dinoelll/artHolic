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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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

   // @Value 를 사용하여 C:/upload 위치를 root 에 담는다.
   @Value("${spring.servlet.multipart.location}")
   private String root;

   @RequestMapping(value = "/pwchange")
   public String pwChange() {

      return "pwChange";
   }

   @RequestMapping(value = "/myfolder")
   public String myFolder() {

      return "myFolder";
   }

   @RequestMapping(value = "/mycalendar")
   public String myCalendar() {

      return "myCalendar";
   }

   @RequestMapping(value = "/createFolder.ajax")
   @ResponseBody
   public String myFolderCreate(@RequestParam String folderName, HttpServletResponse response, HttpSession session) {

      logger.info("createFolder Controller");
      logger.info("folderName" + "/" + folderName);
      String member_id = (String) session.getAttribute("loginId");
      service.myFolderCreate(folderName,member_id);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      return "redirect:/myfolder";
   }

   @RequestMapping(value = "/uploadFile.ajax")
   @ResponseBody
   public String fileUpload(@RequestPart("file") List<MultipartFile> formData,
         @RequestParam("folderId") String folder_id, HttpServletResponse response) {

      logger.info("uploadFile Controller");
      logger.info("formData :" + formData);
      logger.info("folder_id :" + folder_id);

      int folderId = Integer.parseInt(folder_id);

      service.upload(formData, folderId);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      return "redirect:/myfolder";
   }

   @GetMapping(value = "/list.ajax")
   @ResponseBody
   public HashMap<String, Object> folderList(HttpSession session) {

      logger.info("folderList Controller");
      String member_id = (String) session.getAttribute("loginId");
      HashMap<String, Object> map = new HashMap<String, Object>();
      ArrayList<String> list = service.folderList(member_id);
      map.put("folder-list", list);

      return map;
   }

   @PostMapping(value = "/filelist.ajax")
   @ResponseBody
   public HashMap<String, Object> fileList(@RequestParam String folder_id, HttpServletResponse response) {

      logger.info("fileList Controller");

      int folderId = Integer.parseInt(folder_id);

      HashMap<String, Object> map = new HashMap<String, Object>();
      ArrayList<String> fileList = service.fileList(folderId);
      map.put("file-list", fileList);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      return map;
   }

   @RequestMapping(value = "/updateFolder.ajax")
   @ResponseBody
   public String myFolderUpdate(@RequestParam String folderName, @RequestParam String folder_id,
         HttpServletResponse response) {

      logger.info("updateFolder Controller");

      int folderId = Integer.parseInt(folder_id);

      logger.info("folderName" + "/" + folderName + "folder_id" + "/" + folderId);

      service.myFolderUpdate(folderName, folderId);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      return "redirect:/myfolder";
   }

   @RequestMapping(value = "/deleteFolder.ajax")
   @ResponseBody
   public String myFolderDelete(@RequestParam String folder_id, HttpServletResponse response) {

      logger.info("deleteFolder Controller");
      logger.info("folder_id : " + folder_id);

      int folderId = Integer.parseInt(folder_id);

      logger.info("folder_id" + "/" + folderId);

      service.myFolderDelete(folderId);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      return "redirect:/myfolder";

   }

   
   @RequestMapping(value="/calendarUpdate.ajax")
   @ResponseBody
   public String calendarUpdate(@RequestBody ArrayList<EventDataDTO> eventDataList,HttpSession session) {
      logger.info("eventDataList : " + eventDataList);
      String member_id = (String) session.getAttribute("loginId");

      
      service.calendarUpdate(eventDataList,member_id);

      return "success";
   }

   

   @RequestMapping(value = "/calendarUpdate2.ajax")
   @ResponseBody
   public String calendarUpdate2(@RequestBody EventDataDTO requestData,HttpSession session) {
	   String member_id = (String) session.getAttribute("loginId");
      logger.info("requestdata : " + requestData.getMember_id());

      service.calendarUpdate2(requestData,member_id);

      return "success";
   }

   @GetMapping("/getEvent.ajax")
   @ResponseBody
   public List<EventDataDTO> getEvents(HttpSession session) {
	   String member_id = (String) session.getAttribute("loginId");
      // 이벤트 데이터를 가져와서 리스트 형태로 반환
      List<EventDataDTO> events = service.getEvents(member_id);

      for (EventDataDTO eventDataDTO : events) {
         logger.info("start:" + eventDataDTO.getStart_date());
      }

        
        return events;
    }
    

   

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
   }

   @GetMapping(value = "/download.do")
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

   @PostMapping(value = "/deleteFile.ajax")
   @ResponseBody
   public String deleteFile(@RequestParam String fileName, HttpServletResponse response) {

      logger.info("fileName :" + fileName);

      response.setHeader("Cache-Control", "no-cache");
      response.setHeader("Refresh", "0;url=/myfolder");

      service.deleteFile(fileName);

      return "redirect:/myfolder";
   }


}