package kr.co.two.mypage.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.mypage.dao.MypageDAO;

@Service
public class MypageService {

	@Autowired MypageDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Value("${spring.servlet.multipart.location}") private String root;

	public void myFolderCreate(String folderName) {

		dao.myFolderCreate(folderName);
	}

	public ArrayList<String> folderList() {
		
		return dao.folderList();
	}

	public void myFolderUpdate(String folderName, int folderId) {

		dao.myFolderUpdate(folderName,folderId);
		
	}

	public void myFolderDelete(int folderId) {
	
		dao.myFolderDelte(folderId);
		
	}

	public void upload(MultipartFile[] formData, int folderId) {
		
		for (MultipartFile file : formData) {
	        String fileName = file.getOriginalFilename();
	        logger.info("fileName: " + fileName);
	 
	        String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = System.currentTimeMillis()+ext; // 시간으로 하는건 옛날 방법 요새는 해쉬 코드 사용
			logger.info(fileName+"=>"+newFileName);
			
			dao.fileUpload(fileName,ext,newFileName,folderId);
	  
			try {
				byte[] bytes = fileName.getBytes();
				Path path = Paths.get(root+"/"+newFileName);
				Files.write(path, bytes);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<String> fileList(int folderId) {
		
		return dao.fileList(folderId);
	}

		
	
}
