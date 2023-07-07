package kr.co.two.mypage.dto;

import java.time.LocalDateTime;
import java.time.OffsetDateTime;

import org.apache.ibatis.type.Alias;

@Alias("eventdata")
public class EventDataDTO {
	
	  private String content;
	  
	  
	  private OffsetDateTime  start_date;
	  
	  private OffsetDateTime  end_date;
	  private String member_id;
	  private boolean allDay;
	  private String backgroundColor;
	  private String borderColor;
	  private int indi_calendar_id;
	  
	
	public int getIndi_calendar_id() {
		return indi_calendar_id;
	}
	public void setIndi_calendar_id(int indi_calendar_id) {
		this.indi_calendar_id = indi_calendar_id;
	}
	public boolean getAllDay() {
		return allDay;
	}
	public void setAllDay(boolean allDay) {
		this.allDay = allDay;
	}
	public String getBackgroundColor() {
		return backgroundColor;
	}
	public void setBackgroundColor(String backgroundColor) {
		this.backgroundColor = backgroundColor;
	}
	public String getBorderColor() {
		return borderColor;
	}
	public void setBorderColor(String borderColor) {
		this.borderColor = borderColor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public OffsetDateTime   getEnd_date() {
		return end_date;
	}
	public void setEnd_date(OffsetDateTime end_date) {
		this.end_date = end_date;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public OffsetDateTime getStart_date() {
		return start_date;
	}
	public void setStart_date(OffsetDateTime start_date) {
		this.start_date = start_date;
	}
	  
	  
	
	
	

}
