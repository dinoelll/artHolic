package kr.co.two.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.member.dto.MemberDTO;

@Mapper
public interface MemberDAO {

	ArrayList<MemberDTO> employeeTotalList(HashMap<String, Object> params, int cnt, int offset);

	ArrayList<MemberDTO> employeeTotalListByProcess(HashMap<String, Object> params, Object storedValue, int cnt,
			int offset);

	ArrayList<MemberDTO> employeeDeptTotalList(HashMap<String, Object> params, String searchType, String searchText,
			int cnt, int offset);

	ArrayList<MemberDTO> employeeDeptTotalListByProcess(HashMap<String, Object> params, String searchType,
			String searchText, Object storedValue, int cnt, int offset);

	ArrayList<MemberDTO> employeeNameTotalList(HashMap<String, Object> params, String searchType, String searchText,
			int cnt, int offset);

	ArrayList<MemberDTO> employeeNameTotalListByProcess(HashMap<String, Object> params, String searchType,
			String searchText, Object storedValue, int cnt, int offset);

	int employeeTotalCount(HashMap<String, Object> params);

	int employeeTotalCountByProcess(HashMap<String, Object> params, Object storedValue);

	int employeeDeptTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int employeeDeptTotalCountByProcess(HashMap<String, Object> params, String searchType, String searchText,
			Object storedValue);

	int employeeNameTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int employeeNameTotalCountByProcess(HashMap<String, Object> params, String searchType, String searchText,
			Object storedValue);

	int employeePositionTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int employeePositionTotalCountByProcess(HashMap<String, Object> params, String searchType, String searchText,
			Object storedValue);

	ArrayList<MemberDTO> employeePositionTotalList(HashMap<String, Object> params, String searchType, String searchText,
			int cnt, int offset);

	ArrayList<MemberDTO> employeePositionTotalListByProcess(HashMap<String, Object> params, String searchType,
			String searchText, Object storedValue, int cnt, int offset);

	void admin(String memberId, Boolean adminValue);

	int changePw(String pw, String member_id);

	int join(HashMap<String, String> params, String newFileName, String email);

	MemberDTO login(String id);

	MemberDTO memberDetail(String member_id);

	int update(HashMap<String, String> params, String newFileName, String email, int blind);

	String getProfileFileName(String member_id);

	int companyTotalCount(HashMap<String, Object> params);

	int companyNameTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int companyBusinessTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	ArrayList<MemberDTO> companyTotalList(HashMap<String, Object> params, int cnt, int offset);

	ArrayList<MemberDTO> companyNameTotalList(HashMap<String, Object> params, String searchType, String searchText,
			int cnt, int offset);

	ArrayList<MemberDTO> companyBusinessTotalList(HashMap<String, Object> params, String searchType, String searchText,
			int cnt, int offset);

	int companyWrite(HashMap<String, Object> params);

	MemberDTO companyDetail(String cooper_id);

	int companyUpdate(HashMap<String, String> params);

	boolean isUserBlind(String id);

	ArrayList<MemberDTO> employeeBlindTotalList(HashMap<String, Object> params, int cnt, int offset);

	int employeeBlindDeptTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int employeeBlindTotalCount(HashMap<String, Object> params);

	int employeeBlindPositionTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	int employeeBlindNameTotalCount(HashMap<String, Object> params, String searchType, String searchText);

	ArrayList<MemberDTO> employeeBlindDeptTotalList(HashMap<String, Object> params, String searchType,
			String searchText, int cnt, int offset);

	ArrayList<MemberDTO> employeeBlindNameTotalList(HashMap<String, Object> params, String searchType,
			String searchText, int cnt, int offset);

	ArrayList<MemberDTO> employeeBlindPositionTotalList(HashMap<String, Object> params, String searchType,
			String searchText, int cnt, int offset);

	int companyDelete(String cooper_id3);

	String checkDuplicate(String memberId);
	
	
	

}
