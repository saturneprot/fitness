package order;

import java.util.Date;

public class OrderDTO {
	private String order_num;
	private String mid;
	private String o_name;
	private String o_number;
	private String o_email;
	private String o_addr1;
	private String o_addr2;
	private String o_comment;
	private String o_pay;
	private Date o_date;
	private int p_num;
	private int order_quantity;
	private String p_name;
	private String p_image;
	private int p_price;
	private String o_status;
	
	
	
	public String getO_status() {
		return o_status;
	}
	public void setO_status(String o_status) {
		this.o_status = o_status;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getO_number() {
		return o_number;
	}
	public void setO_number(String o_number) {
		this.o_number = o_number;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_addr1() {
		return o_addr1;
	}
	public void setO_addr1(String o_addr1) {
		this.o_addr1 = o_addr1;
	}
	public String getO_addr2() {
		return o_addr2;
	}
	public void setO_addr2(String o_addr2) {
		this.o_addr2 = o_addr2;
	}
	public String getO_comment() {
		return o_comment;
	}
	public void setO_comment(String o_comment) {
		this.o_comment = o_comment;
	}
	public String getO_pay() {
		return o_pay;
	}
	public void setO_pay(String o_pay) {
		this.o_pay = o_pay;
	}
	public Date getO_date() {
		return o_date;
	}
	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}
	
	
}
