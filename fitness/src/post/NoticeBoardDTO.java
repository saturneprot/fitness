package post;

import java.sql.Date;

public class NoticeBoardDTO {
	private int nb_num;
	private int bc_num;
	private String id;
	private String nb_subject;
	private String nb_content;
	private Date nb_date;
	private Date nb_time;
	private int nb_count;
	public int getNb_num() {
		return nb_num;
	}
	public void setNb_num(int nb_num) {
		this.nb_num = nb_num;
	}
	public int getBc_num() {
		return bc_num;
	}
	public void setBc_num(int bc_num) {
		this.bc_num = bc_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNb_subject() {
		return nb_subject;
	}
	public void setNb_subject(String nb_subject) {
		this.nb_subject = nb_subject;
	}
	public String getNb_content() {
		return nb_content;
	}
	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}
	public Date getNb_date() {
		return nb_date;
	}
	public void setNb_date(Date nb_date) {
		this.nb_date = nb_date;
	}
	public Date getNb_time() {
		return nb_time;
	}
	public void setNb_time(Date nb_time) {
		this.nb_time = nb_time;
	}
	public int getNb_count() {
		return nb_count;
	}
	public void setNb_count(int nb_count) {
		this.nb_count = nb_count;
	}
	
	
}
