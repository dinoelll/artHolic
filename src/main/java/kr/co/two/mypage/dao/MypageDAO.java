package kr.co.two.mypage.dao;

<<<<<<< HEAD
import java.util.List;
=======
import java.util.ArrayList;
>>>>>>> origin/master

import org.apache.ibatis.annotations.Mapper;

import kr.co.two.mypage.dto.EventDataDTO;

@Mapper
public interface MypageDAO {

<<<<<<< HEAD
	void calendarUpdate(EventDataDTO eventDataDTO);

	List<EventDataDTO> getEvent();
=======
	void myFolderCreate(String folderName);

	ArrayList<String> folderList();

	void myFolderUpdate(String folderName, int folderId);

	void myFolderDelte(int folderId);

	ArrayList<String> fileList(int folder_id);

	void fileUpload(String fileName, String ext, String newFileName, int folderId);

>>>>>>> origin/master

}
