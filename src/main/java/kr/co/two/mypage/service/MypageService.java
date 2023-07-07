package kr.co.two.mypage.service;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.mypage.dao.MypageDAO;
import kr.co.two.mypage.dto.EventDataDTO;

@Service
public class MypageService {

	@Autowired
	MypageDAO dao;

	Logger logger = LoggerFactory.getLogger(getClass());


	public void calendarUpdate(ArrayList<EventDataDTO> eventDataList) {
		String member_id = "1812001";
		for (EventDataDTO eventDataDTO : eventDataList) {
			eventDataDTO.setMember_id(member_id);
			String title = eventDataDTO.getContent();
			LocalDateTime start = eventDataDTO.getStart_date();
			LocalDateTime end = eventDataDTO.getEnd_date();
			boolean allday = eventDataDTO.getAllDay();
			String backgroundColor = eventDataDTO.getBackgroundColor();
			String borderColor = eventDataDTO.getBorderColor();
			int id = eventDataDTO.getId();

			logger.info("title" + title);
			logger.info("start" + start);
			logger.info("end" + end);
			logger.info("allday" + allday);
			logger.info("backgroundColor" + backgroundColor);
			logger.info("id" + id);
			
			dao.calendarUpdate(eventDataDTO);
		}

	}

	public List<EventDataDTO> getEvents() {
		
		return dao.getEvent();
	}

	
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

	public void upload(List<MultipartFile> formData, int folderId) {
		
		for (MultipartFile file : formData) {
	        String fileName = file.getOriginalFilename();
	        logger.info("fileName: " + fileName);
	 
	        String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = System.currentTimeMillis()+ext; // 시간으로 하는건 옛날 방법 요새는 해쉬 코드 사용
			logger.info(fileName+"=>"+newFileName);
			
			 // MIME 유형 설정
	        String contentType = file.getContentType();
	        if (contentType == null) {
	            // MIME 유형이 지정되지 않은 경우 기본값으로 설정
	            contentType = MimeTypeUtils.APPLICATION_OCTET_STREAM_VALUE;
	        }
			
			dao.fileUpload(fileName,ext,newFileName,folderId);
	  
			try {
				byte[] bytes = file.getBytes();
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

<<<<<<< HEAD

=======
>>>>>>> origin/master
	public void calendarUpdate2(EventDataDTO dto) {
		String member_id = "1812001";
		dto.setMember_id(member_id);
		dao.calendarUpdate2(dto);
		
		
	}

	public int eventDelete(String id) {
		
		return dao.eventDelete(id);
	}
<<<<<<< HEAD
=======

>>>>>>> origin/master
	public int deleteFile(String fileName) {
		
		return dao.deleteFile(fileName);
	}

}
