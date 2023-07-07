package kr.co.two.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.project.dto.ProjectDTO;

@Mapper
public interface ProjectDAO {

	int totalCount(String opt, String keyword);

	ArrayList<ProjectDTO> listCall(String opt, String keyword, int cnt, int offset);

	int projectWrite(HashMap<String, Object> params);

}
