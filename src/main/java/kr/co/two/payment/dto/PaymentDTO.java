package kr.co.two.payment.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("payment")
public class PaymentDTO {
	private String document_id;
	private String id;
	private int amount;
	private boolean blind;
	private String paySubject;
	private String payContent;
	private String state;
	private boolean temp;
	private Date start_date;
	private Date end_date;
	private String email;
	private char vacation_sort;
	private String equipment_kind;
	private boolean is_billway;
	private String project_kind;
	private String project_leader;
	
	
	public String getDocument_id() {
		return document_id;
	}
	public void setDocument_id(String document_id) {
		this.document_id = document_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public boolean isBlind() {
		return blind;
	}
	public void setBlind(boolean blind) {
		this.blind = blind;
	}
	public String getPaySubject() {
		return paySubject;
	}
	public void setPaySubject(String paySubject) {
		this.paySubject = paySubject;
	}
	public String getPayContent() {
		return payContent;
	}
	public void setPayContent(String payContent) {
		this.payContent = payContent;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isTemp() {
		return temp;
	}
	public void setTemp(boolean temp) {
		this.temp = temp;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public char getVacation_sort() {
		return vacation_sort;
	}
	public void setVacation_sort(char vacation_sort) {
		this.vacation_sort = vacation_sort;
	}
	public String getEquipment_kind() {
		return equipment_kind;
	}
	public void setEquipment_kind(String equipment_kind) {
		this.equipment_kind = equipment_kind;
	}
	public boolean isIs_billway() {
		return is_billway;
	}
	public void setIs_billway(boolean is_billway) {
		this.is_billway = is_billway;
	}
	public String getProject_kind() {
		return project_kind;
	}
	public void setProject_kind(String project_kind) {
		this.project_kind = project_kind;
	}
	public String getProject_leader() {
		return project_leader;
	}
	public void setProject_leader(String project_leader) {
		this.project_leader = project_leader;
	}
	
	
	
	
	

}
