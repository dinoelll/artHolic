package kr.co.two.payment.dto;



import org.apache.ibatis.type.Alias;

@Alias("payList")
public class PayListDTO {
	
	private String name;
	private String code_name;
	private String note;
	private String order_column;
	private String reg_date;
	private String modi_date;
	private String result;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getOrder_column() {
		return order_column;
	}
	public void setOrder_column(String order_column) {
		this.order_column = order_column;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getModi_date() {
		return modi_date;
	}
	public void setModi_date(String modi_date) {
		this.modi_date = modi_date;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
}	
	