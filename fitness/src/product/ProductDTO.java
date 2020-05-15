package product;

import java.sql.Date;

public class ProductDTO {
	private int p_num;
	private String p_code;
	private String p_name;
	private int p_price;
	private int p_stock;
	private Date p_regdate;
	private String p_comment;
	private String p_company;
	private String p_image;
	private String c_name;
	private String p_hide;
	private Date p_regdate2;
	
	public Date getP_regdate2() {
		return p_regdate2;
	}
	public void setP_regdate2(Date p_regdate2) {
		this.p_regdate2 = p_regdate2;
	}
	public String getP_hide() {
		return p_hide;
	}
	public void setP_hide(String p_hide) {
		this.p_hide = p_hide;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_code() {
		return p_code;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_stock() {
		return p_stock;
	}
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	public String getP_comment() {
		return p_comment;
	}
	public void setP_comment(String p_comment) {
		this.p_comment = p_comment;
	}
	public String getP_company() {
		return p_company;
	}
	public void setP_company(String p_company) {
		this.p_company = p_company;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Date getP_regdate() {
		return p_regdate;
	}
	public void setP_regdate(Date p_regdate) {
		this.p_regdate = p_regdate;
	}
	
	
}
