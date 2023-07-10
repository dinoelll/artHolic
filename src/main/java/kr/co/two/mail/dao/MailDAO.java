package kr.co.two.mail.dao;

import java.lang.StackWalker.Option;
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

	ArrayList<MailDTO> mailSendDetail(int mail_id,int row);

	int findMailReference(int mail_id);

	ArrayList<MailDTO> mailMemberDetail(int mail_id);

	int mailCheckPhoto(int mail_id);

	ArrayList<MailDTO> mailHasPhoto(int mail_id);

	int mailTempCheck();

	HashMap<String, Object> tempList(HashMap<String, Object> params);

	int mailFavorite(Integer mail_id, boolean isFavorite);

	int tempListUpdate(HashMap<String, String> params);

	ArrayList<MailDTO> mailSelfBox();

	int savereceiverWrite(MailDTO dto);

	boolean isFavoriteStatus(Integer mail_id);

	int mailbookmark(int mailId, Boolean isFavorite, String type);

	boolean isbookmarkStatus(int mailId, String type);

}
