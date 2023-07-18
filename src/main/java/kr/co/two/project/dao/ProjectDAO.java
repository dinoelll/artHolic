package kr.co.two.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.project.dto.ProjectDTO;
import kr.co.two.project.dto.ProjectEventDataDTO;

@Mapper
public interface ProjectDAO {

   int totalCount(String opt, String keyword,String myproject);

   ArrayList<ProjectDTO> listCall(String opt, String keyword, int cnt, int offset,String myproject);

   int projectWrite(HashMap<String, Object> params);
   
   int feedWrite(ProjectDTO dto);
   
   void archivefileWrite(String oriFileName, String newFileName, String feed_id);

   ArrayList<HashMap<String, String>> getAllFeed(String project_id);
   
   ArrayList<ProjectDTO> projectAddOption();

   ArrayList<String> addPorjectMember(ArrayList<String> approvers);
   
   void fileDel(String feed_file_id);

   void feedDel(String feed_id);
   
   ProjectDTO feedUpdate(String feed_id, String feed_file_id, String project_id, String project_name);
   
   void feedUpdateDo(String feed_id, String feed_file_id, String content);
   
   void projectDel(String project_id);
   
   ProjectDTO projectUpdateModal(String project_id);
   
   int projectUpdate(HashMap<String, String> params);
   
   
   

   
   

   List<ProjectEventDataDTO> getEvent(String project_id);

   void calendarUpdate(ProjectEventDataDTO eventDataDTO);

   void calendarUpdate2(ProjectEventDataDTO requestData);

   int eventDelete(String project_calendar_id);

   void addProjectMember(String member_id, String project_id);

   ArrayList<ProjectDTO> projectInfo(String project_id);

   void feedAlarm(String member_id, String project_id);

	
}