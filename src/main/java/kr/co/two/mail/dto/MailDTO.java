package kr.co.two.mail.dto;




import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("mail")
public class MailDTO {
   
   // mail
   private int mail_id;
   private String member_id;
   private Timestamp writeTime;
   private String mailSubject;
   private String mailContent;
   private boolean Favorites;
   private boolean temp;
   private String blind;
   private String type;
   
   //mail_receiver
   private boolean read_chk;
   private Date read_date;
   private boolean bookmark;
   private int is_receiver;
   private String reference;
   
   private String dept_name;
   private String position_name;
   private String send;
   
   private String sender_member_id;
   private String receiver_member_id;
   private String receiver_name;
   private Date sentTime;
   
   //member
   private String pw;
   private String name;
   private String email;
   private String dept_code;
   private String position_code;
   
   
   // mail_file
   private int mail_file_id;
   private String ori_file_name;
   private String file_path;
   private String new_file_name;
   
   // date, id
   private Date reg_date;
   private String reg_id;
   private Date modi_date;
   private String modi_id;
   
   //code
   private String code_id;
   private String code_group_id;
   private int sort_no;
   private String code_name;
   
   
   
   // mail
   public int getMail_id() {
      return mail_id;
   }
   public void setMail_id(int mail_id) {
      this.mail_id = mail_id;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
   }
   public String getMailSubject() {
      return mailSubject;
   }
   public void setMailSubject(String mailSubject) {
      this.mailSubject = mailSubject;
   }
   public String getMailContent() {
      return mailContent;
   }
   public void setMailContent(String mailContent) {
      this.mailContent = mailContent;
   }
   public boolean isRead_chk() {
      return read_chk;
   }
   public void setRead_chk(boolean read_chk) {
      this.read_chk = read_chk;
   }
   public String getBlind() {
      return blind;
   }
   public void setBlind(String blind) {
      this.blind = blind;
   }
   public String getReference() {
      return reference;
   }
   public void setReference(String reference) {
      this.reference = reference;
   }


   public boolean isTemp() {
      return temp;
   }
   public void setTemp(boolean temp) {
      this.temp = temp;
   }
   
   //member
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getDept_code() {
      return dept_code;
   }
   public void setDept_code(String dept_code) {
      this.dept_code = dept_code;
   }
   public String getPosition_code() {
      return position_code;
   }
   public void setPosition_code(String position_code) {
      this.position_code = position_code;
   }
   
   
   // mail_file
   public int getMail_file_id() {
      return mail_file_id;
   }
   public void setMail_file_id(int mail_file_id) {
      this.mail_file_id = mail_file_id;
   }
   public String getOri_file_name() {
      return ori_file_name;
   }
   public void setOri_file_name(String ori_file_name) {
      this.ori_file_name = ori_file_name;
   }
   public String getFile_path() {
      return file_path;
   }
   public void setFile_path(String file_path) {
      this.file_path = file_path;
   }
   public String getNew_file_name() {
      return new_file_name;
   }
   public void setNew_file_name(String new_file_name) {
      this.new_file_name = new_file_name;
   }
   
   // date, id
   public Date getReg_date() {
      return reg_date;
   }
   public void setReg_date(Date reg_date) {
      this.reg_date = reg_date;
   }
   public String getReg_id() {
      return reg_id;
   }
   public void setReg_id(String reg_id) {
      this.reg_id = reg_id;
   }
   public Date getModi_date() {
      return modi_date;
   }
   public void setModi_date(Date modi_date) {
      this.modi_date = modi_date;
   }
   public String getModi_id() {
      return modi_id;
   }
   public void setModi_id(String modi_id) {
      this.modi_id = modi_id;
   }
   public Timestamp getWriteTime() {
      return writeTime;
   }
   public void setWriteTime(Timestamp writeTime) {
      this.writeTime = writeTime;
   }

   public boolean isBookmark() {
      return bookmark;
   }
   public void setBookmark(boolean bookmark) {
      this.bookmark = bookmark;
   }
   public int getIs_receiver() {
      return is_receiver;
   }
   public void setIs_receiver(int is_receiver) {
      this.is_receiver = is_receiver;
   }
   
   //code
   public String getCode_id() {
      return code_id;
   }
   public void setCode_id(String code_id) {
      this.code_id = code_id;
   }
   public String getCode_group_id() {
      return code_group_id;
   }
   public void setCode_group_id(String code_group_id) {
      this.code_group_id = code_group_id;
   }
   public int getSort_no() {
      return sort_no;
   }
   public void setSort_no(int sort_no) {
      this.sort_no = sort_no;
   }
   public String getCode_name() {
      return code_name;
   }
   public void setCode_name(String code_name) {
      this.code_name = code_name;
   }
   public String getDept_name() {
      return dept_name;
   }
   public void setDept_name(String dept_name) {
      this.dept_name = dept_name;
   }
   public String getPosition_name() {
      return position_name;
   }
   public void setPosition_name(String position_name) {
      this.position_name = position_name;
   }
   public String getType() {
      return type;
   }
   public void setType(String type) {
      this.type = type;
   }
	public boolean isFavorites() {
		return Favorites;
	}
	public void setFavorites(boolean favorites) {
		Favorites = favorites;
	}
	public String getSend() {
		return send;
	}
	public void setSend(String send) {
		this.send = send;
	}
	public Date getRead_date() {
		return read_date;
	}
	public void setRead_date(Date read_date) {
		this.read_date = read_date;
	}
	public String getSender_member_id() {
		return sender_member_id;
	}
	public void setSender_member(String sender_member_id) {
		this.sender_member_id = sender_member_id;
	}
	public String getReceiver_member_id() {
		return receiver_member_id;
	}
	public void setReceiver_member_id(String receiver_member_id) {
		this.receiver_member_id = receiver_member_id;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public Date getSentTime() {
		return sentTime;
	}
	public void setSentTime(Date sentTime) {
		this.sentTime = sentTime;
	}

}