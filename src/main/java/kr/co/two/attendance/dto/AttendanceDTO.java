package kr.co.two.attendance.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("attendance")
public class AttendanceDTO {
	
	private String name;
	private String member_id;
	private double Annual;
	private String dept_name;
	private String position_name;
	private double useAnnual;
	private double remainingAnnual;
	private String profile_photo;
	private String start_date;
	private String end_date;
	private String vacation_kind;
	private int count;
	
	

	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public double getAnnual() {
		return Annual;
	}
	public void setAnnual(double annual) {
		Annual = annual;
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
	public double getUseAnnual() {
		return useAnnual;
	}
	public void setUseAnnual(double useAnnual) {
		this.useAnnual = useAnnual;
	}
	public double getRemainingAnnual() {
		return remainingAnnual;
	}
	public void setRemainingAnnual(double remainingAnnual) {
		this.remainingAnnual = remainingAnnual;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getVacation_kind() {
		return vacation_kind;
	}
	public void setVacation_kind(String vacation_kind) {
		this.vacation_kind = vacation_kind;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

}
