package kr.co.two.payment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.payment.dto.MemberDTO;



@Mapper
public interface PaymentDAO {

	String getLatestDocumentNumber();

	int vacationFormSave(HashMap<String, String> params);

	void fileWrite(String ori_file_name, String new_file_name, String file_path, String document_id);

	 ArrayList<MemberDTO> member();

	int paymentShip(HashMap<String, String> params);

	String findMemberId(String paymentValue);

	int vacationFormSaveTemp(HashMap<String, String> params);

	int payment_reference(HashMap<String, String> params);

	

	
	

}
