package kr.co.two.main.dto;

import java.sql.Date;
import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("main")
public class MainDTO {
			
			// member
			private String member_id;
			private String pw;
			private String name;
			private String email;
			private String tel;
			private Date birthday;
			private String phone;
			private String profile_photo; 
			private int Annaul;
			private boolean admin;
			private String dept_code;
			private String position_code;
			private Date reg_date;
			private String reg_id;
			private Date modi_date;
			private String modi_id;
			private String gender;
		    private boolean userBlindWhether;
		    
		    // project
		    private int project_id;
		    private String project_name;
		    private String content;
		    private String start_date;
		    private String end_date;
		    private String project_manager;
		    private String field_manager;
		    private String manager_phone;
		    private String feed_id;
		    private String feed_file_id;
		    private String ori_photo_name;
		    private String photo_name;
		    private String identify_number;
		    private String ext;
		    
		    // mail
		    private int mail_id;
		    private String writeTime;
		    private String mailSubject;
		    private String mailContent;
		    private String Favorites;
		    private boolean temp;
		    
		    private boolean blind;
		    private String type;
		    
		    // mail_receiver
		    private boolean read_chk;
		    private boolean read_date;
		    private boolean bookmark;
		    private boolean is_receiver;
		    private String reference;
		    
		    private String dept_name;
		    private String position_name;
			    
		    // mail_file
		    private int mail_file_id;
		    private String ori_file_name;
		    private String file_path;
		    private String new_file_name;
		    
		    // code
		    private String code_id;
		    private String code_group_id;
		    private int sort_no;
		    private String code_name;
		    
		    // board
		    private int board_id;
			private String subject;
			private boolean is_form;
			private String board_code;
			
			// payment
			private String document_id;
			private String id;
			private String paySubject;
			private String payContent;
			private String form_sort;
			private String amount;
			private String state;
			private char vacation_sort;
			private String equipment_kind;
			private boolean is_billway;
			private String project_kind;
			private String project_leader;
			private String limit_date;
						
			//Annual
		    private double Annual;
		    private double useAnnual;
		    private double remainingAnnual;
		    private String vacation_kind;
		    private int count;
		    
		    public double getAnnual() {
				return Annual;
			}
			public void setAnnual(double annual) {
				Annual = annual;
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
			public String getForm_sort() {
				return form_sort;
			}
			public void setForm_sort(String form_sort) {
				this.form_sort = form_sort;
			}
			public String getAmount() {
				return amount;
			}
			public void setAmount(String amount) {
				this.amount = amount;
			}
			public String getState() {
				return state;
			}
			public void setState(String state) {
				this.state = state;
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
			public String getLimit_date() {
				return limit_date;
			}
			public void setLimit_date(String limit_date) {
				this.limit_date = limit_date;
			}
			public int getBoard_id() {
				return board_id;
			}
			public void setBoard_id(int board_id) {
				this.board_id = board_id;
			}
			public String getSubject() {
				return subject;
			}
			public void setSubject(String subject) {
				this.subject = subject;
			}
			public boolean isIs_form() {
				return is_form;
			}
			public void setIs_form(boolean is_form) {
				this.is_form = is_form;
			}
			public String getBoard_code() {
				return board_code;
			}
			public void setBoard_code(String board_code) {
				this.board_code = board_code;
			}
			public int getMail_id() {
				return mail_id;
			}
			public void setMail_id(int mail_id) {
				this.mail_id = mail_id;
			}
			
			public String getWriteTime() {
				return writeTime;
			}
			public void setWriteTime(String writeTime) {
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
			public String getFavorites() {
				return Favorites;
			}
			public void setFavorites(String favorites) {
				Favorites = favorites;
			}
			public boolean isTemp() {
				return temp;
			}
			public void setTemp(boolean temp) {
				this.temp = temp;
			}
			public boolean isBlind() {
				return blind;
			}
			public void setBlind(boolean blind) {
				this.blind = blind;
			}
			public String getType() {
				return type;
			}
			public void setType(String type) {
				this.type = type;
			}
			public boolean isRead_chk() {
				return read_chk;
			}
			public void setRead_chk(boolean read_chk) {
				this.read_chk = read_chk;
			}
			public boolean isRead_date() {
				return read_date;
			}
			public void setRead_date(boolean read_date) {
				this.read_date = read_date;
			}
			public boolean isBookmark() {
				return bookmark;
			}
			public void setBookmark(boolean bookmark) {
				this.bookmark = bookmark;
			}
			public boolean isIs_receiver() {
				return is_receiver;
			}
			public void setIs_receiver(boolean is_receiver) {
				this.is_receiver = is_receiver;
			}
			public String getReference() {
				return reference;
			}
			public void setReference(String reference) {
				this.reference = reference;
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
			public int getMail_file_id() {
				return mail_file_id;
			}
			public void setMail_file_id(int mail_file_id) {
				this.mail_file_id = mail_file_id;
			}
			public String getOri_file_name() {
				return ori_file_name;
			}
			public void setOri_file_name(String ori_file_name) {
				this.ori_file_name = ori_file_name;
			}
			public String getFile_path() {
				return file_path;
			}
			public void setFile_path(String file_path) {
				this.file_path = file_path;
			}
			public String getNew_file_name() {
				return new_file_name;
			}
			public void setNew_file_name(String new_file_name) {
				this.new_file_name = new_file_name;
			}
			public String getCode_id() {
				return code_id;
			}
			public void setCode_id(String code_id) {
				this.code_id = code_id;
			}
			public String getCode_group_id() {
				return code_group_id;
			}
			public void setCode_group_id(String code_group_id) {
				this.code_group_id = code_group_id;
			}
			public int getSort_no() {
				return sort_no;
			}
			public void setSort_no(int sort_no) {
				this.sort_no = sort_no;
			}
			public String getCode_name() {
				return code_name;
			}
			public void setCode_name(String code_name) {
				this.code_name = code_name;
			}
		    public int getProject_id() {
				return project_id;
			}
			public void setProject_id(int project_id) {
				this.project_id = project_id;
			}
			public String getProject_name() {
				return project_name;
			}
			public void setProject_name(String project_name) {
				this.project_name = project_name;
			}
			public String getContent() {
				return content;
			}
			public void setContent(String content) {
				this.content = content;
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
			public String getProject_manager() {
				return project_manager;
			}
			public void setProject_manager(String project_manager) {
				this.project_manager = project_manager;
			}
			public String getField_manager() {
				return field_manager;
			}
			public void setField_manager(String field_manager) {
				this.field_manager = field_manager;
			}
			public String getManager_phone() {
				return manager_phone;
			}
			public void setManager_phone(String manager_phone) {
				this.manager_phone = manager_phone;
			}
			public String getFeed_id() {
				return feed_id;
			}
			public void setFeed_id(String feed_id) {
				this.feed_id = feed_id;
			}
			public String getFeed_file_id() {
				return feed_file_id;
			}
			public void setFeed_file_id(String feed_file_id) {
				this.feed_file_id = feed_file_id;
			}
			public String getOri_photo_name() {
				return ori_photo_name;
			}
			public void setOri_photo_name(String ori_photo_name) {
				this.ori_photo_name = ori_photo_name;
			}
			public String getPhoto_name() {
				return photo_name;
			}
			public void setPhoto_name(String photo_name) {
				this.photo_name = photo_name;
			}
			public String getIdentify_number() {
				return identify_number;
			}
			public void setIdentify_number(String identify_number) {
				this.identify_number = identify_number;
			}
			public String getExt() {
				return ext;
			}
			public void setExt(String ext) {
				this.ext = ext;
			}
			
    
			public String getGender() {
				return gender;
			}
			public void setGender(String gender) {
				this.gender = gender;
			}
			public boolean isUserBlindWhether() {
				return userBlindWhether;
			}
			public void setUserBlindWhether(boolean userBlindWhether) {
				this.userBlindWhether = userBlindWhether;
			}
	
			
			public String getMember_id() {
				return member_id;
			}
			public void setMember_id(String member_id) {
				this.member_id = member_id;
			}
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
			public String getTel() {
				return tel;
			}
			public void setTel(String tel) {
				this.tel = tel;
			}
			public Date getBirthday() {
				return birthday;
			}
			public void setBirthday(Date birthday) {
				this.birthday = birthday;
			}
			public String getPhone() {
				return phone;
			}
			public void setPhone(String phone) {
				this.phone = phone;
			}
			public String getProfile_photo() {
				return profile_photo;
			}
			public void setProfile_photo(String profile_photo) {
				this.profile_photo = profile_photo;
			}
			public int getAnnaul() {
				return Annaul;
			}
			public void setAnnaul(int annaul) {
				Annaul = annaul;
			}
			public boolean isAdmin() {
				return admin;
			}
			public void setAdmin(boolean admin) {
				this.admin = admin;
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
			public Date getReg_date() {
				return reg_date;
			}
			public void setReg_date(Date reg_date) {
				this.reg_date = reg_date;
			}
			public String getReg_id() {
				return reg_id;
			}
			public void setReg_id(String reg_id) {
				this.reg_id = reg_id;
			}
			public Date getModi_date() {
				return modi_date;
			}
			public void setModi_date(Date modi_date) {
				this.modi_date = modi_date;
			}
			public String getModi_id() {
				return modi_id;
			}
			public void setModi_id(String modi_id) {
				this.modi_id = modi_id;
			}
			
}
