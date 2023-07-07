package kr.co.two.mail.service;

import java.io.IOException;
import java.lang.StackWalker.Option;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.util.StringUtils;

import kr.co.two.mail.dao.MailDAO;
import kr.co.two.mail.dto.MailDTO;

@Service
public class MailService {

	@Autowired MailDAO dao;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	public ArrayList<MailDTO> mailgetOptions() {
		
		return dao.mailgetOptions();
		
	}

	// 메일 쓰기
	public String mailWrite(String type,HashMap<String, String> params, MultipartFile[] attachment, String approvers,String referrer,RedirectAttributes redirect) {
		
		// 1. 게시글만 작성할 경우
		MailDTO dto = new MailDTO();
		
		dto.setMember_id(params.get("member_id")); // 메일 보낸 사람
		dto.setMailSubject(params.get("mailSubject")); // 메일 제목
		dto.setMailContent(params.get("mailContent")); // 메일 내용
		
		int row = dao.mailWrite(dto);
		logger.info("mailWrite row: "+row);
		int mail_id = dto.getMail_id();
		logger.info("방금 insert 한 mail_id: "+mail_id);
		
		// type,mail_id get 방식
		// String page = "redirect:/mailDetail.do?type="+type+"&mail_id="+mail_id;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mail_id", mail_id);
		map.put("type", type);
		redirect.addFlashAttribute("map", map);
		logger.info("map:"+map.get("mail_id"));
		logger.info("type: "+map.get("type"));
		
		if(type.equals("send")) {
			logger.info("send");
			if(!params.get("sendMember").equals("") || !params.get("sendMember").isEmpty()) {
				logger.info("sendMember");
				dto.setMember_id(approvers);
				logger.info("dto approvers: "+dto.getMember_id());
				String[] approverList = approvers.split(",");
				for (int i = 0; i < approverList.length; i++) {
				    String approver = approverList[i];
				    dto.setMember_id(approver);
				    int sendMember = dao.receiverWrite(dto);
				    logger.info("sendMember: " + sendMember);
				}
			}
			if(!params.get("referenceMember").equals("") || !params.get("referenceMember").isEmpty()) {
				logger.info("referenceMember");
				dto.setMember_id(referrer);
				String[] referrerList = referrer.split(",");
				for (int i = 0; i < referrerList.length; i++) {
				    String referrers = referrerList[i];
				    dto.setMember_id(referrers);
				    int referenceMember = dao.referenceMemberWrite(dto);
				    logger.info("referenceMember: " + referenceMember);
				}
			}
		}
		
		logger.info("attachment length : " + attachment.length);
		
		// 2. 사진이 있을 경우
		if( attachment.length > 0 && !StringUtils.isEmpty(attachment[0].getOriginalFilename())) {
			logger.info("if문 진입");
			for (MultipartFile file : attachment) {
				logger.info("file:"+file);
				mailPhotoUpload(mail_id,file);
				
				try {
					Thread.sleep(1);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
		
		return "redirect:/mailDetail.do";
	}

	// 사진 하나씩 저장하기
	private void mailPhotoUpload(int mail_id,MultipartFile file) {
		String ori_file_name = file.getOriginalFilename();
		int index = ori_file_name.lastIndexOf(".");
		String ext = ori_file_name.substring(index);
		String root = "C:/upload/";
		logger.info("file: "+file);
		
		long time = System.currentTimeMillis();
		String new_file_name = time+ext;
		
		logger.info("fileName: "+ori_file_name+" -> "+new_file_name);
		
		try {
			logger.info("file try 진입");
			byte[] bytes = file.getBytes();
			Path path = Paths.get(root+new_file_name);
			logger.info("root: "+root);
			Files.write(path, bytes);
			int row = dao.mailPhotoUpload(mail_id,ori_file_name,root,new_file_name);
			logger.info("photo row: "+row);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

	public HashMap<String, ArrayList<MailDTO>> mailDetail(Map<String, Object> params, HttpServletRequest request) {	
		ArrayList<MailDTO> sendMemberList = new ArrayList<MailDTO>();
		ArrayList<MailDTO> mailMemberList = new ArrayList<MailDTO>();
		ArrayList<MailDTO> mailpthotoList = new ArrayList<MailDTO>();
		HashMap<String, ArrayList<MailDTO>> map = new HashMap<String, ArrayList<MailDTO>>();
		logger.info("params: "+params);
		int mail_id = (int) params.get("mail_id");
		
		if(params.get("type").equals("send")) {
			// 참조자가 있는지 확인
			int row = dao.findMailReference(mail_id);
			logger.info("row: "+row);
			// 받는사람, 참조자 리스트 가져오기
			sendMemberList = dao.mailSendDetail(mail_id,row);
			
			logger.info("size : " + sendMemberList.size());
			map.put("dto", sendMemberList);
			// 보낸사람 리스트 가져오기
			mailMemberList = dao.mailMemberDetail(mail_id);
			map.put("memberdto", mailMemberList);
			logger.info("받는사람: "+sendMemberList.toArray());
			logger.info("보낸사람: "+mailMemberList.toArray());
		}else if(params.get("type").equals("save")){
			mailMemberList = dao.mailMemberDetail(mail_id);
			map.put("memberdto", mailMemberList);
			logger.info("보낸사람: "+mailMemberList.toArray());
		}else if(params.get("type").equals("temp")) {
			
		}
		
		int photo = dao.mailCheckPhoto(mail_id);
		if(photo > 0) {
			mailpthotoList = dao.mailHasPhoto(mail_id);
			map.put("mailpthotoList", mailpthotoList);
			logger.info("파일사이즈: "+mailpthotoList.size());
		}
		
		return map;
	}

}
