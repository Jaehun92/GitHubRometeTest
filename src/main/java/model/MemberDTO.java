package model;

import java.sql.Date;

public class MemberDTO {
	
	private String id;
	private String pwd;
	private String name;
	private java.sql.Date regidate;
	private String age;
	//생성자]
	public MemberDTO() {}
	public MemberDTO(String id, String pwd, String name, Date regidate, String age) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.regidate = regidate;
		this.age = age;
	}
	//게터/세터
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}

	@Override
	public String toString() {		
		return String.format("이름:%s,아이디:%s,비번:%s,나이:%s",name,id,pwd,age);
	}
	
	
	
}
