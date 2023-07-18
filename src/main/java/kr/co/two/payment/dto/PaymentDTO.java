package kr.co.two.payment.dto;



import org.apache.ibatis.type.Alias;

@Alias("payment")
public class PaymentDTO {
	private String document_id;
	private String id;
	private String paySubject;
	private String payContent;
	private String form_sort;
	private String amount;
	private boolean blind;
	private String state;
	private boolean temp;
	private String start_date;
	private String end_date;
	private String email;
	private String vacation_sort;
	private String equipment_kind;
	private boolean is_billway;
	private String project_kind;
	private String project_leader;
	private String limit_date;
	private String code_name;
	private String name;
	private String position;
	private String vacation_kind;
	private String dept_name;
	private String ori_file_name;
	private String new_file_name;
	private String note;
	private String result;
	private String modi_date;
	private String shipMember_id;
	private String payment_ship_id;
	private String referMember_id;
	private String refer;
	private String order_column;
	private String form;
	private String reg_date;
	private String profile_photo;
	

	
	public String getForm_sort() {
		return form_sort;
	}
	public void setForm_sort(String form_sort) {
		this.form_sort = form_sort;
	}
	
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

	

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
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
	public String getLimit_date() {
		return limit_date;
	}
	public void setLimit_date(String limit_date) {
		this.limit_date = limit_date;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getVacation_sort() {
		return vacation_sort;
	}
	public void setVacation_sort(String vacation_sort) {
		this.vacation_sort = vacation_sort;
	}
	public String getVacation_kind() {
		return vacation_kind;
	}
	public void setVacation_kind(String vacation_kind) {
		this.vacation_kind = vacation_kind;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getOri_file_name() {
		return ori_file_name;
	}
	public void setOri_file_name(String ori_file_name) {
		this.ori_file_name = ori_file_name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getModi_date() {
		return modi_date;
	}
	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}

	public String getPayment_ship_id() {
		return payment_ship_id;
	}
	public void setPayment_ship_id(String payment_ship_id) {
		this.payment_ship_id = payment_ship_id;
	}

	public String getRefer() {
		return refer;
	}
	public void setRefer(String refer) {
		this.refer = refer;
	}
	public String getOrder_column() {
		return order_column;
	}
	public void setOrder_column(String order_column) {
		this.order_column = order_column;
	}
	public String getShipMember_id() {
		return shipMember_id;
	}
	public void setShipMember_id(String shipMember_id) {
		this.shipMember_id = shipMember_id;
	}
	public String getReferMember_id() {
		return referMember_id;
	}
	public void setReferMember_id(String referMember_id) {
		this.referMember_id = referMember_id;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getProfile_photo() {
		return profile_photo;
	}
	public void setProfile_photo(String profile_photo) {
		this.profile_photo = profile_photo;
	}
	public String getNew_file_name() {
		return new_file_name;
	}
	public void setNew_file_name(String new_file_name) {
		this.new_file_name = new_file_name;
	}
	
	
	
	
	

}
