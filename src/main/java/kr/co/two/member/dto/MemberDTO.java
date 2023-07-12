package kr.co.two.member.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {

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
		
		public boolean isUserBlindWhether() {
			return userBlindWhether;
		}
		public void setUserBlindWhether(boolean userBlindWhether) {
			this.userBlindWhether = userBlindWhether;
		}
		// cooper
		private String part;
		private String business;
		private String cooper_id;
		
		public String getCooper_id() {
			return cooper_id;
		}
		public void setCooper_id(String cooper_id) {
			this.cooper_id = cooper_id;
		}
		public String getPart() {
			return part;
		}
		public void setPart(String part) {
			this.part = part;
		}
		public String getBusiness() {
			return business;
		}
		public void setBusiness(String business) {
			this.business = business;
		}
		
		
		
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
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
