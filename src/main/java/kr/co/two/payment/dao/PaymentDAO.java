package kr.co.two.payment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.payment.dto.MemberDTO;
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

	 ArrayList<MemberDTO> member();

	int paymentShip(HashMap<String, String> params);

	String findMemberId(String paymentValue);

	int payment_reference(HashMap<String, String> params);
	
	
	
	int totalCount(String opt, String optt , String keyword);

	ArrayList<PaymentDTO> listCall(String opt, String optt, String keyword, int cnt, int offset);

	
	

	
	

}
