package kr.co.two.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.project.dto.ProjectDTO;
import kr.co.two.project.dto.ProjectEventDataDTO;

@Mapper
public interface ProjectDAO {

   int totalCount(String opt, String keyword);

   ArrayList<ProjectDTO> listCall(String opt, String keyword, int cnt, int offset);

   int projectWrite(HashMap<String, Object> params);
   
   int feedWrite(ProjectDTO dto);
   
   void archivefileWrite(String oriFileName, String newFileName, String feed_id);

   ArrayList<HashMap<String, String>> getAllFeed(String project_id);
   
   ArrayList<ProjectDTO> projectAddOption();

   ArrayList<String> addPorjectMember(ArrayList<String> approvers);
   
   

   
   

   List<ProjectEventDataDTO> getEvent(String project_id);

   void calendarUpdate(ProjectEventDataDTO eventDataDTO);

   void calendarUpdate2(ProjectEventDataDTO requestData);

   int eventDelete(String project_calendar_id);

   void addProjectMember(String member_id, String project_id);


}