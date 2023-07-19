package kr.co.two.alarm.dto;

public class AlarmDTO {
	private int alarm_id;
	private String alarmcontent;
	private String alarm_code;
	private String alarm_receiver;
	private boolean is_read;
	private int iden_id;
	private String project_name;
	
	
	public int getAlarm_id() {
		return alarm_id;
	}
	public void setAlarm_id(int alarm_id) {
		this.alarm_id = alarm_id;
	}
	public String getAlarmcontent() {
		return alarmcontent;
	}
	public void setAlarmcontent(String alarmcontent) {
		this.alarmcontent = alarmcontent;
	}
	public String getAlarm_code() {
		return alarm_code;
	}
	public void setAlarm_code(String alarm_code) {
		this.alarm_code = alarm_code;
	}
	public String getAlarm_receiver() {
		return alarm_receiver;
	}
	public void setAlarm_receiver(String alarm_receiver) {
		this.alarm_receiver = alarm_receiver;
	}
	public boolean isIs_read() {
		return is_read;
	}
	public void setIs_read(boolean is_read) {
		this.is_read = is_read;
	}
	public int getIden_id() {
		return iden_id;
	}
	public void setIden_id(int iden_id) {
		this.iden_id = iden_id;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	
	
}
