package kr.co.two.reservation.dto;

import org.apache.ibatis.type.Alias;

@Alias("meetingRoom")
public class MeetingRoomDTO {
	
	private String Capacity;
	private int room_id;
	private String room_name;
	private String location;
	public String getCapacity() {
		return Capacity;
	}
	public void setCapacity(String capacity) {
		Capacity = capacity;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
	
}
