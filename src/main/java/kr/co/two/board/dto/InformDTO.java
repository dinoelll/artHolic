package kr.co.two.board.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("inform")
public class InformDTO {
	
	private int board_id;
	private String subject;
	private String content;
	private String member_id;
	private boolean is_form;
	private Date writeTime;
	private String board_code;
	private String name;
	
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public Date getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public boolean isIs_form() {// isIs form은 머임
		return is_form;
	}
	public void setIs_form(boolean is_form) {
		this.is_form = is_form;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	

}
