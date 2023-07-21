package kr.co.two.payment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.payment.dto.MemberDTO;
import kr.co.two.payment.dto.PayListDTO;
import kr.co.two.payment.dto.PaymentAlarmDTO;
import kr.co.two.payment.dto.PaymentDTO;
import kr.co.two.project.dto.ProjectDTO;



@Mapper
public interface PaymentDAO {

   String getLatestDocumentNumber(String form_sort);

   int vacationFormSave(HashMap<String, String> params);
   
   int buyItemFormSave(HashMap<String, String> params);

   int projectFormSave(HashMap<String, String> params);
   
   

   int vacationFormSaveTemp(HashMap<String, String> params);

   int buyItemFormSaveTemp(HashMap<String, String> params);

   int projectFormSaveTemp(HashMap<String, String> params);

   

   void fileWrite(String ori_file_name, String new_file_name, String file_path, String document_id);

    ArrayList<MemberDTO> member(String member_id);

   int paymentShip(HashMap<String, String> params);

   String findMemberId(String paymentValue);

   int payment_reference(HashMap<String, String> params);
   
   
   //리스트 호출 부분
   
   int totalCount(String opt, String optt , String keyword, String member_id);

   ArrayList<PaymentDTO> listCall(String opt, String optt, String keyword, int cnt, int offset, String member_id);

   
   int totalCountTemp(String opt, String optt, String keyword, boolean temp, String member_id);

   ArrayList<PaymentDTO> listCallTemp(String opt, String optt, String keyword, int cnt, int offset, boolean temp, String member_id);

   
   ArrayList<PaymentDTO> listCallPay(String opt, String optt, String keyword, int cnt, int offset, String member_id);

   int totalCountPay(String opt, String optt, String keyword, String member_id);
   
   
   int totalCountDone(String opt, String optt, String keyword, String member_id);

   ArrayList<PaymentDTO> listCallDone(String opt, String optt, String keyword, int cnt, int offset, String member_id);
   
   ArrayList<PaymentDTO> listCallTake(String opt, String optt, String keyword, int cnt, int offset, String member_id);

   int totalCountTake(String opt, String optt, String keyword, String member_id);

   
   //(끝)리스트 호출 부분

   PaymentDTO vacationForm(String id, String document_id);
   
   PaymentDTO buyItemForm(String id, String document_id);
   
   PaymentDTO projectForm(String id, String document_id);

   ArrayList<PayListDTO> payListCall(String document_id);

   ArrayList<PayListDTO> payReferrerCall(String document_id);
   
   // 변경
   int payRequest(String document_id, String note, String member_id);

   int payEnd(String document_id, String note, String member_id);

   int payRefuse(String document_id, String note, String member_id);

   int paymentRefuse(String document_id, String note, String member_id);

   ArrayList<PaymentDTO> mainRefuse(String id);

   //PaymentDTO mainTimeline(String id);

   ArrayList<PaymentDTO> mainEnd(String id);

   ArrayList<PaymentDTO> note(String id, String document_id);

   ArrayList<PaymentDTO> mainTimeline(String id);


   void paymentShipAlarm(HashMap<String, String> params);
   
   
   

   void paymentReferrerAlarm(HashMap<String, String> params);

   int payRequest2(PaymentAlarmDTO alarmDto);

   int paymentShipTemp(HashMap<String, String> params);

   int vacationFormSaveRequestTemp(HashMap<String, String> params);

   
     int buyItemFormSaveRequestTemp(HashMap<String, String> params);
     
     int projectFormSaveRequestTemp(HashMap<String, String> params);

	int waitCount(String document_id);

	String paymentCompleteMember(String document_id);
    




   

   


   
   

   
   

}