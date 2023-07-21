package kr.co.two.mail.dao;

import java.lang.StackWalker.Option;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;

import kr.co.two.mail.dto.MailDTO;

@Mapper
public interface MailDAO {

   ArrayList<MailDTO> mailgetOptions();

   int mailWrite(MailDTO dto);

   int mailPhotoUpload(int mail_id, String ori_file_name, String root, String new_file_name);

   int receiverWrite(MailDTO dto);

   int referenceMemberWrite(MailDTO dto);

   ArrayList<MailDTO> mailSendDetail(int mail_id, String member_id);

   int findMailReference(int mail_id);

   ArrayList<MailDTO> mailMemberDetail(int mail_id, String type, String member_id);

   int mailCheckPhoto(int mail_id);

   ArrayList<MailDTO> mailHasPhoto(int mail_id);

   int mailTempCheck();

   HashMap<String, Object> tempList(HashMap<String, Object> params);

   void mailFavorite(Integer mail_id, boolean isLike, String type, String member_id,String set);

   int tempListUpdate(HashMap<String, String> params);

   ArrayList<MailDTO> mailSelfBox(int cnt, int offset, String type, String searchInformation, String searchText, String member_id,String mailFilter);

   int savereceiverWrite(MailDTO dto);

   MailDTO isFavoriteStatus(Integer mail_id, String type, String member_id,String set);

	/*
	 * int mailbookmark(int mailId, Boolean isFavorite, String type);
	 * 
	 * boolean isbookmarkStatus(int mailId, String type);
	 */

   int totalCount(String type, String searchInformation, String searchText, String member_id);

   int mailPhotodel(int mail_id);

   List<MailDTO> mailCheckPhotoName(int mail_id);

   int mailtrash(String mailId, String type,String member_id);

   int maildel(int mail_id,String member_id, String set);

   int mymaildel(String mailId,String member_id);

	void receiverMailAlarm(MailDTO dto);
	
	void referrerMailAlarm(MailDTO dto);

	void updateread(int mail_id, String type, Timestamp writeTime, String member_id);

	void tempsaveupdate(String mail_id, Timestamp writeTime, String mailSubject, String mailContent);

	int mailrestore(int mail_id, String member_id, String set);

	int readchktotal(String member_id);

	ArrayList<MailDTO> readchkBox( String member_id,int cnt, int offset);

	int delread(String receivermember, String mail_id);
	
  //Object mailtempGet(int mail_id, String type);

}