package kr.co.two.payment.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.alarm.config.WebSocketHandler;
import kr.co.two.payment.dao.PaymentDAO;
import kr.co.two.payment.dto.MemberDTO;
import kr.co.two.payment.dto.PayListDTO;
import kr.co.two.payment.dto.PaymentAlarmDTO;
import kr.co.two.payment.dto.PaymentDTO;
import kr.co.two.project.dto.ProjectDTO;

@Service
public class PaymentService {

   @Autowired PaymentDAO dao;
   
   @Autowired WebSocketHandler handler;
   
   Logger logger = LoggerFactory.getLogger(getClass());
   
   @Value("${spring.servlet.multipart.location}") private String root;

   
   public int writeVacation(HashMap<String, String> params, MultipartFile[] files, HttpSession session) {
       PaymentDTO dto = new PaymentDTO();
       
       // 기본 정보 부여
       String blind = "0";
       params.put("blind", blind);
       String state = new String();
       
       state = "진행중";
       params.put("state", state);
       
       
       //임시로 저장하기 위해서 이름 부여
       String id = (String) session.getAttribute("loginId");
       params.put("id", id);
       

       String form_sort =  params.get("form_sort");
       
       
       String document_id = generateVacationDocumentNumber(form_sort);
       params.put("document_id", document_id);
       
       
       int vacationFormSaveRow = 0;
       int buyItemFormSaveRow = 0;
       int projectFormSaveRow = 0;
       int vacationFormSaveTempRow = 0;
       int buyItemFormSaveTempRow = 0;
       int projectFormSaveTempRow = 0;
      
       
       if(params.get("temp")!=null) {
          
          
       
          
          if(form_sort.equals("PAYMENT_VAC") ) {
             // 기간 및 일시
             state = "임시저장";
              params.put("state", state);
             String oriReservationtime = params.get("reservationtime");
             String start_date =  oriReservationtime.substring(0, 10);
             logger.info("start_date : "+start_date);
             params.put("start_date", start_date);
             String end_date =  oriReservationtime.substring(22, 32);
             logger.info("end_date : "+end_date);
             params.put("end_date", end_date);
             
             
             // 오전 오후 여부
             if(params.get("radioPeriod") != null) {
                String vacation_sort =  params.get("radioPeriod");
                if(vacation_sort.equals("오전") ) {
                   params.put("vacation_sort", "0");
                }
                if(vacation_sort.equals("오후") )  {
                   params.put("vacation_sort", "1");
                }
             }   
          vacationFormSaveTempRow =  dao.vacationFormSaveTemp(params);
           logger.info("작성폼 임시저장 업로드 완료 "+vacationFormSaveTempRow);
          }
          
            if(form_sort.equals("PAYMENT_BUY")) {

               state = "임시저장";
                 params.put("state", state);
            
                 if(params.get("radioPeriod") != null) {
                   String vacation_sort =  params.get("radioPeriod");
                   if(vacation_sort.equals("있음") ) {
                      params.put("is_billway", "0");
                   }
                   if(vacation_sort.equals("없음") )  {
                      params.put("is_billway", "1");
                   }
                }     
                 
             vacationFormSaveTempRow =  dao.buyItemFormSaveTemp(params);
              logger.info("작성폼 임시저장 업로드 완료 "+vacationFormSaveTempRow);
          }
          if(form_sort.equals("PAYMENT_PRO")) {
          
          
             state = "임시저장";
              params.put("state", state);
              
             // 기간 및 일시
             String oriReservationtime = params.get("reservationtime");
             String start_date =  oriReservationtime.substring(0, 10);
             logger.info("start_date : "+start_date);
             params.put("start_date", start_date);
             String end_date =  oriReservationtime.substring(22, 32);
             logger.info("end_date : "+end_date);
             params.put("end_date", end_date);
             
             
          
             vacationFormSaveTempRow =  dao.projectFormSaveTemp(params);
              logger.info("작성폼 임시저장 업로드 완료 "+vacationFormSaveTempRow);
          }
          
       }
       if(params.get("temp")==null ) {
      
          String temp = "0";
          params.put("temp", temp);
          
          
           if(form_sort.equals("PAYMENT_VAC")) {
              // 기간 및 일시
             String oriReservationtime = params.get("reservationtime");
             String start_date =  oriReservationtime.substring(0, 10);
             logger.info("start_date : "+start_date);
             params.put("start_date", start_date);
             String end_date =  oriReservationtime.substring(22, 32);
             logger.info("end_date : "+end_date);
             params.put("end_date", end_date);
             
             
             // 오전 오후 여부
             if(params.get("radioPeriod") != null) {
                String vacation_sort =  params.get("radioPeriod");
                if(vacation_sort.equals("오전") ) {
                   params.put("vacation_sort", "0");
                }
                if(vacation_sort.equals("오후") )  {
                   params.put("vacation_sort", "1");
                }
             }
              
              vacationFormSaveRow =  dao.vacationFormSave(params);
              logger.info(" 휴가작성폼 업로드 완료 "+vacationFormSaveRow);
           }
           
          if(form_sort.equals("PAYMENT_BUY") ) {
             
            if(params.get("radioPeriod") != null) {
                String vacation_sort =  params.get("radioPeriod");
                if(vacation_sort.equals("있음") ) {
                   params.put("is_billway", "0");
                }
                if(vacation_sort.equals("없음") )  {
                   params.put("is_billway", "1");
                }
             }     
             
             
            buyItemFormSaveRow =  dao.buyItemFormSave(params);
              logger.info(" 비품 작성폼 업로드 완료 "+vacationFormSaveRow);
           }
         if(form_sort.equals("PAYMENT_PRO")) {
            
          // 기간 및 일시
             String oriReservationtime = params.get("reservationtime");
             String start_date =  oriReservationtime.substring(0, 10);
             logger.info("start_date : "+start_date);
             params.put("start_date", start_date);
             String end_date =  oriReservationtime.substring(22, 32);
             logger.info("end_date : "+end_date);
             params.put("end_date", end_date);
            
           projectFormSaveRow =  dao.projectFormSave(params);
              logger.info(" 작성폼 업로드 완료 "+vacationFormSaveRow);
           }
              
        }

      
       // 파일 업로드 작업
       
       if (files != null ) {
           logger.info("다중 파일 업로드 작업");
           multiUpload(files, document_id);
       }
       

       // 결재 관련 정보 생성
       if(params.get("temp").equals("1")){
       
          logger.info("결재관련 임시저장 파람 넣을꺼임. 파람 확인하셈!! " + params);
          
          String result = "진행 중";
          params.put("result", result);
   
          for (int i = 1; i <= 4; i++) {
              String paymentKey = "payment" + i;
              if (params.get(paymentKey) != null && !params.get(paymentKey).isEmpty()) {
                  String order_column = String.valueOf(i);
                  params.put("order_column", order_column);
                  String member_id =  params.get(paymentKey);
                  params.put("member_id", member_id);
                  int paymentShipRow = dao.paymentShipTemp(params);
                  logger.info("payment변경완료ShipTemp" + paymentShipRow);
              }
          }
       }


// 여기 까지는 완료



        if(params.get("temp")=="0"){
          
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
               if(i == 1) {
                  params.put("memo", "(결재요청)");
                  handler.sendAlarm("알림");
                  dao.paymentShipAlarm(params);
               }
               int paymentShipRow = dao.paymentShip(params);
               //dao.paymentShipAlarm(params);
               logger.info("payment변경완료Ship" + paymentShipRow);
           }
       }
       
       // 참조자 넣기
       for (int i = 1; i <= 4; i++) {
          String referrerKey = "referrer" + i;
          if (params.get(referrerKey) != null && !params.get(referrerKey).isEmpty()) {
               
               
               String member_id =  params.get(referrerKey);
               params.put("member_id", member_id);
               int referrerRow = dao.payment_reference(params);
               dao.paymentReferrerAlarm(params);
               logger.info("참조자 변경완료 !! " + referrerRow);
           }
          

      
         }
       
      } 
       return 1;
       
       
   }
   public int writeVacationTemp(HashMap<String, String> params, HttpSession session) {
       
       String form_sort =  params.get("form_sort");
       int vacationFormSaveRow = 0;
       int buyItemFormSaveRow = 0;
       int projectFormSaveRow = 0;
       int vacationFormSaveTempRow = 0;
       int buyItemFormSaveTempRow = 0;
       int projectFormSaveTempRow = 0;
      
      if(form_sort.equals("PAYMENT_VAC")) {
           

           vacationFormSaveRow =  dao.vacationFormSaveRequestTemp(params);
           logger.info(" 휴가작성폼 업로드 완료 "+vacationFormSaveRow);
        }
        
      
       if(form_sort.equals("PAYMENT_BUY") ) {
       
       
        buyItemFormSaveRow = dao.buyItemFormSaveRequestTemp(params);
        logger.info(" 비품 작성폼 업로드 완료 "+vacationFormSaveRow); }
        if(form_sort.equals("PAYMENT_PRO")) {
        
        
        
        projectFormSaveRow = dao.projectFormSaveRequestTemp(params);
        logger.info(" 작성폼 업로드 완료 "+vacationFormSaveRow); }
      
           

      return 1;
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
   private String generateVacationDocumentNumber(String form_sort) {
       
      
      // 데이터베이스에서 가장 최근의 문서 번호를 조회하는 로직
       
      String latestDocumentNumber = dao.getLatestDocumentNumber(form_sort); // 예시: "vac-a-0001"
       
       
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

   
     public ModelAndView member(HttpSession session) {
        String member_id = (String) session.getAttribute("loginId");
        ArrayList<MemberDTO> mdto = dao.member(member_id); 
        ModelAndView mav = new ModelAndView("paymentVacationForm"); 
        mav.addObject("member", mdto);
        logger.info("멤버 결재선 요청 내려 보냄.");
     
     return mav;
     
     
     }
     public ModelAndView member2(HttpSession session) {
        String member_id = (String) session.getAttribute("loginId");
        ArrayList<MemberDTO> mdto = dao.member(member_id); 
        ModelAndView mav = new ModelAndView("paymentBuyItemForm"); 
        mav.addObject("member", mdto);
        logger.info("멤버 결재선 요청 내려 보냄.");
     
     return mav;
     
     
     }
     public ModelAndView member3(HttpSession session) {
        String member_id = (String) session.getAttribute("loginId");
        ArrayList<MemberDTO> mdto = dao.member(member_id); 
        ModelAndView mav = new ModelAndView("paymentProjectForm"); 
        mav.addObject("member", mdto);
        logger.info("멤버 결재선 요청 내려 보냄.");
     
     return mav;
     
     
     }

   public String findMemberId(String paymentValue) {
        return dao.findMemberId(paymentValue);
      
   }
   
   
public HashMap<String, Object> listCall(int page,int cnt, String opt, String keyword, String optt, boolean temp, String member_id) {
      
      HashMap<String, Object> map = new HashMap<String, Object>();
      
      ArrayList<PaymentDTO> list = new ArrayList<PaymentDTO>();
      
      int offset = (page-1)*cnt; 
      int total = 0;
      
      if(temp == true) {
         total = dao.totalCountTemp(opt, optt, keyword,temp,member_id); // 12
         
      }else {
         
         total = dao.totalCount(opt, optt, keyword,member_id); // 12
      }
       // cnt = 10
      int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
      
      logger.info("total :"+total);
      logger.info("range :"+range);
      logger.info("before page :"+page);
      
      page = page>range ? range : page;
      
      logger.info("after page :"+page);
      
      map.put("currPage", page);
      map.put("pages", range);
      if(temp == true) {
          list = dao.listCallTemp(opt, optt, keyword,cnt, offset,temp,member_id);
         
      }else {
         
         
         list = dao.listCall(opt, optt, keyword,cnt, offset,member_id);
      }
      
      
      map.put("projectList", list);
      return map;
   }

public HashMap<String, Object> listCallDone(int page, int cnt, String opt, String keyword, String optt, String member_id) {
HashMap<String, Object> map = new HashMap<String, Object>();
   
   ArrayList<PaymentDTO> list = new ArrayList<PaymentDTO>();
   
   int offset = (page-1)*cnt; 
   int total = 0;
   
   
      total = dao.totalCountDone(opt, optt, keyword, member_id); // 12
   
    // cnt = 10
   int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
   
   logger.info("total :"+total);
   logger.info("range :"+range);
   logger.info("before page :"+page);
   
   page = page>range ? range : page;
   
   logger.info("after page :"+page);
   
   map.put("currPage", page);
   map.put("pages", range);
   
      list = dao.listCallDone(opt, optt, keyword,cnt, offset, member_id);
   
   
   
   map.put("projectList", list);
   return map;
}
      public HashMap<String, Object> paymentListTake(int page, int cnt, String opt, String keyword, String optt,
            String member_id) {
         
         
         HashMap<String, Object> map = new HashMap<String, Object>();
         
         ArrayList<PaymentDTO> list = new ArrayList<PaymentDTO>();
         
         int offset = (page-1)*cnt; 
         int total = 0;
         
         
            total = dao.totalCountTake(opt, optt, keyword, member_id); // 12
         
          // cnt = 10
         int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
         
         logger.info("total :"+total);
         logger.info("range :"+range);
         logger.info("before page :"+page);
         
         page = page>range ? range : page;
         
         logger.info("after page :"+page);
         
         map.put("currPage", page);
         map.put("pages", range);
         
            list = dao.listCallTake(opt, optt, keyword,cnt, offset, member_id);
         
         
         
         map.put("projectList", list);
         return map;
      }


public HashMap<String, Object> listCallPay(int page, int cnt, String opt, String keyword, String optt, String member_id) {
   HashMap<String, Object> map = new HashMap<String, Object>();
   
   ArrayList<PaymentDTO> list = new ArrayList<PaymentDTO>();
   
   int offset = (page-1)*cnt; 
   int total = 0;
   
   
      total = dao.totalCountPay(opt, optt, keyword, member_id); // 12
   
    // cnt = 10
   int range = total%cnt == 0 ? total/cnt : (total/cnt)+1;
   
   logger.info("total :"+total);
   logger.info("range :"+range);
   logger.info("before page :"+page);
   
   page = page>range ? range : page;
   
   logger.info("after page :"+page);
   
   map.put("currPage", page);
   map.put("pages", range);
   
      list = dao.listCallPay(opt, optt, keyword,cnt, offset, member_id);
   
   
   
   map.put("projectList", list);
   return map;
}

public ModelAndView vacationForm(HttpSession session, String document_id, boolean temp) {
   
   String id = (String) session.getAttribute("loginId");
   String FormKind = document_id.substring(0, 3); // 앞의 3글자 추출
   PaymentDTO dto = new PaymentDTO();
   ModelAndView mav = new ModelAndView();
   
   ArrayList<MemberDTO> mdto = new ArrayList<MemberDTO>();

   
   if(FormKind.equals("vac")) {
      
      dto = dao.vacationForm(id, document_id );
      mav = new ModelAndView("paymentVacationForm_pay");
   }
   if(FormKind.equals("buy")) {
      dto = dao.buyItemForm(id, document_id );
      mav = new ModelAndView("paymentBuyItemForm_pay");
         
      }
   if(FormKind.equals("pro")) {
      dto = dao.projectForm(id, document_id );
      mav = new ModelAndView("paymentProjectForm_pay");
      
   }
   
   if(temp == true) {
      logger.info("임시저장 값으로 들어옴!");
      if(FormKind.equals("vac")) {
         
         String member_id = (String) session.getAttribute("loginId");
            mdto = dao.member(member_id); 
            
           mav.addObject("member", mdto);
           logger.info("멤버 결재선 요청 내려 보냄.");
         
         
         dto = dao.vacationForm(id, document_id );
         mav = new ModelAndView("paymentVacationTempPay");
      }
      if(FormKind.equals("buy")) {
         
         String member_id = (String) session.getAttribute("loginId");
            mdto = dao.member(member_id); 
            
           mav.addObject("member", mdto);
           logger.info("멤버 결재선 요청 내려 보냄.");
         
         dto = dao.buyItemForm(id, document_id );
         mav = new ModelAndView("paymentBuyItemTempPay");
            
         }
      if(FormKind.equals("pro")) {
         
         String member_id = (String) session.getAttribute("loginId");
            mdto = dao.member(member_id); 
            
           mav.addObject("member", mdto);
           logger.info("멤버 결재선 요청 내려 보냄.");
         
         dto = dao.projectForm(id, document_id );
         mav = new ModelAndView("paymentProjectTempPay");
         
      }
      
      
   }
   
   
   
   mav.addObject("form", dto);
   
   return mav;
}

public ModelAndView vacationFormDetail(HttpSession session, String document_id, boolean temp) {
   String id = (String) session.getAttribute("loginId");
   String FormKind = document_id.substring(0, 3); // 앞의 3글자 추출
   PaymentDTO dto = new PaymentDTO();
   ModelAndView mav = new ModelAndView();
   
   ArrayList<MemberDTO> mdto = new ArrayList<MemberDTO>();

   
   if(FormKind.equals("vac")) {
      
      dto = dao.vacationForm(id, document_id );
      mav = new ModelAndView("paymentVacationFormDetail");
   }
   if(FormKind.equals("buy")) {
      dto = dao.buyItemForm(id, document_id );
      mav = new ModelAndView("paymentBuyItemFormDetail");
         
      }
   if(FormKind.equals("pro")) {
      dto = dao.projectForm(id, document_id );
      mav = new ModelAndView("paymentProjectFormDetail");
      
   }
   mav.addObject("form", dto);
   
   return mav;
}

public HashMap<String, Object> payListCall(String document_id) {
   HashMap<String, Object> map = new HashMap<String, Object>();
   
   ArrayList<PayListDTO> payList = dao.payListCall(document_id);
   
   ArrayList<PayListDTO> referrer = dao.payReferrerCall(document_id);
   
   map.put("payList", payList);
   map.put("referrer", referrer);
   
   return map;
}

public int payRequest(String document_id, String note, String member_id, HttpSession session) {
   
   //결재하기
   // 변경
   PaymentAlarmDTO alarmDto = new PaymentAlarmDTO();
   
   alarmDto.setDocument_id(document_id);
   alarmDto.setNote(note);
   alarmDto.setMember_id(member_id);
   
   HashMap<String, String> map = new HashMap<String, String>();
   
   if(dao.waitCount(document_id) == 0) {
	   logger.info("waitCount == 0" + dao.waitCount(document_id));
	   dao.payRequest(document_id, note, member_id);
   }else {
	   logger.info("waitCount != 0" + dao.waitCount(document_id));
	   dao.payRequest2(alarmDto);
	   map.put("member_id", alarmDto.getAlarm_id());
	   map.put("document_id", alarmDto.getDocument_id());
	   //map.put("note", alarmDto.getNote());
	   map.put("memo", "(결재요청)");
	   dao.paymentShipAlarm(map);
   }
   //int payRequestInt = dao.payRequest2(alarmDto);
   //logger.info("payRequestInt: "+payRequestInt);
   logger.info("alarm_id : " + alarmDto.getAlarm_id());
   
   
   
   handler.sendAlarm("알림");
   
   
   // 결재 전부다 완료되면 완료로 바꾸기
   int payEndInt = dao.payEnd(document_id, note, member_id);
   
   if(payEndInt == 1) {
	  logger.info("결재완료 : payEndInt==1");
      HashMap<String, String> payEndMap = new HashMap<String, String>();
      payEndMap.put("member_id", dao.paymentCompleteMember(document_id));
      payEndMap.put("document_id", document_id);
      payEndMap.put("memo", "(결재완료)");
      dao.paymentShipAlarm(payEndMap);
      handler.sendAlarm("알림");
   }
   
   
   
   
   return 1;
}

public int payRefuse(String document_id, String note, String member_id) {
   
   int payRefuseInt = dao.payRefuse(document_id, note, member_id);
   logger.info("payRefuseInt: "+payRefuseInt);
   
   int paymentRefuseInt = dao.paymentRefuse(document_id, note, member_id);
   logger.info("paymentRefuseInt: "+paymentRefuseInt);
   
   HashMap<String, String> map = new HashMap<String, String>();
   
   map.put("document_id", document_id);
   map.put("memo", "(결재반려)");
   map.put("member_id", dao.paymentCompleteMember(document_id));
   
   dao.paymentShipAlarm(map);
   handler.sendAlarm("알림");
   
   return 1;
}

public ModelAndView main(HttpSession session) {
   
   ModelAndView mav = new ModelAndView("paymentMain");
   String id = (String) session.getAttribute("loginId");


   ArrayList<PaymentDTO> dtoTimeline = new ArrayList<PaymentDTO>();
   ArrayList<PaymentDTO> dtoRefuse = new ArrayList<PaymentDTO>();
   ArrayList<PaymentDTO> dtoEnd = new ArrayList<PaymentDTO>();
   
   
   
   
   dtoTimeline = dao.mainTimeline(id);
   
   mav.addObject("timeline", dtoTimeline);
   
    dtoRefuse = dao.mainRefuse(id);
   
   mav.addObject("refuse", dtoRefuse);
   
   dtoEnd = dao.mainEnd(id);
   
   mav.addObject("end", dtoEnd);
   
   return mav;
}

public HashMap<String, Object> note(HttpSession session, String document_id) {
   HashMap<String, Object> mav = new HashMap<String, Object>();
   String id = (String) session.getAttribute("loginId");



   ArrayList<PaymentDTO> note = new ArrayList<PaymentDTO>();

   
   
   
   note = dao.note(id, document_id);
   
   mav.put("note", note);
   

   
   return mav;
}







    

   
     
     
    

   
}