package kr.co.two.mypage.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MypageDAO {

	void myFolderCreate(String folderName);

	ArrayList<String> folderList();

	void myFolderUpdate(String folderName, int folderId);

	void myFolderDelte(int folderId);

	ArrayList<String> fileList(int folder_id);

	void fileUpload(String fileName, String ext, String newFileName, int folderId);


}
