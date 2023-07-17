package kr.co.two.mypage.dao;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.mypage.dto.EventDataDTO;

@Mapper
public interface MypageDAO {


   void calendarUpdate(EventDataDTO eventDataDTO);

   void calendarUpdate2(EventDataDTO dto);
   
   
   
   
   
   
   
   
   List<EventDataDTO> getEvent(String member_id);

   void myFolderCreate(String folderName, String member_id);

   ArrayList<String> folderList(String member_id);

   void myFolderUpdate(String folderName, int folderId);

   void myFolderDelte(int folderId);

   ArrayList<String> fileList(int folder_id);
   
   void fileUpload(String fileName, String ext, String newFileName, int folderId);

   int eventDelete(String indi_calendar_id);

   int deleteFile(String fileName);

   



}