package kr.co.two.board.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("inform")
public class InformDTO {
	
	private int board_id;
	private String subject;
	private String content;
	private String member_id;
	private boolean is_inform;
	private Date saveTime;
	
	
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
	public boolean isIs_inform() {
		return is_inform;
	}
	public void setIs_inform(boolean is_inform) {
		this.is_inform = is_inform;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	
	

}
