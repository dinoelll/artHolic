package kr.co.two.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

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
	
	
	

}
