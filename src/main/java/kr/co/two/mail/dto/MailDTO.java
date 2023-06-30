package kr.co.two.mail.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

@Alias("mail")
public class MailDTO {
	
	// mail
	private int mail_id;
	private String member_id;
	private LocalDateTime writeTime;
	private String mailSubject;
	private String mailContent;
	private boolean read_chk;
	private boolean blind;
	private String reference;
	private String Field;
	private boolean temp;
	
	//member
	private String pw;
	private String name;
	private String email;
	private String dept_code;
	private String position_code;
	
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
	public LocalDateTime getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(LocalDateTime writeTime) {
		this.writeTime = writeTime;
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
	public boolean isBlind() {
		return blind;
	}
	public void setBlind(boolean blind) {
		this.blind = blind;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
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

}
