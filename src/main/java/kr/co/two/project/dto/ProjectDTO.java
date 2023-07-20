package kr.co.two.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("project")
public class ProjectDTO {
   
   private int project_id;
   private String member_id;
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
   
   //member
   private String pw;
   private String name;
   private String email;
   private String dept_code;
   private String position_code;
   private String dept_name;
   private String position_name;
   
   
   public int getProject_id() {
      return project_id;
   }
   public void setProject_id(int project_id) {
      this.project_id = project_id;
   }
   public String getMember_id() {
      return member_id;
   }
   public void setMember_id(String member_id) {
      this.member_id = member_id;
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


}