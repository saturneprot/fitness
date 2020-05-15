package post;

import java.sql.Date;

public class BoardDTO {
	private int b_num;
	private int bc_num;
	private String bc_name;
	private String mid;
	private String mname;
	private String b_subject;
	private String b_content;
	private Date b_date;
	private Date b_time;
	private int b_count;
	private String b_pwd;
	private int b_pos;
	private int b_depth;
	private String b_re;
	private String b_sup;
	
	
	
	public String getB_sup() {
		return b_sup;
	}
	public void setB_sup(String b_sup) {
		this.b_sup = b_sup;
	}
	public String getB_re() {
		return b_re;
	}
	public void setB_re(String b_re) {
		this.b_re = b_re;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBc_num() {
		return bc_num;
	}
	public void setBc_num(int bc_num) {
		this.bc_num = bc_num;
	}
	public int getB_pos() {
		return b_pos;
	}
	public void setB_pos(int b_pos) {
		this.b_pos = b_pos;
	}
	public int getB_depth() {
		return b_depth;
	}
	public void setB_depth(int b_depth) {
		this.b_depth = b_depth;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public int getB_num() {
		return b_num;
	}
	public void setB_num(int b_num) {
		this.b_num = b_num;
	}
	public String getBc_name() {
		return bc_name;
	}
	public void setBc_name(String bc_name) {
		this.bc_name = bc_name;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getB_subject() {
		return b_subject;
	}
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}
	public Date getB_time() {
		return b_time;
	}
	public void setB_time(Date b_time) {
		this.b_time = b_time;
	}
	public int getB_count() {
		return b_count;
	}
	public void setB_count(int b_count) {
		this.b_count = b_count;
	}
	
	
}
