package kr.co.two.reservation.dto;

import java.sql.Date;
import java.time.LocalTime;

import org.apache.ibatis.type.Alias;

@Alias("reservation")
public class ReservationDTO {
	
	private int reservation_id;
	private String member_id;
	private String room_id;
	private String room_name;
	private Date date;
	private String startTime; 
	private String endTime;
	private String team_member;
	
	
	
	public String getTeam_member() {
		return team_member;
	}
	public void setTeam_member(String team_member) {
		this.team_member = team_member;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public int getReservation_id() {
		return reservation_id;
	}
	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	private String meeting_id;
	private String team_id;
	public String getRoom_id() {
		return room_id;
	}
	public void setRoom_id(String room_id) {
		this.room_id = room_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getMeeting_id() {
		return meeting_id;
	}
	public void setMeeting_id(String meeting_id) {
		this.meeting_id = meeting_id;
	}
	public String getTeam_id() {
		return team_id;
	}
	public void setTeam_id(String team_id) {
		this.team_id = team_id;
	}
	
	
	
}
