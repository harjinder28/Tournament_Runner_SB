package com.TRunner.Entities;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;

@Entity
@Table(uniqueConstraints = @UniqueConstraint(columnNames = {"email"}))
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int uid;
	String uname;

	String email;
	String password;
	int contact;

//	@OneToMany
//	List<Tournament> tournaments;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}


	public User(int uid, String uname, String email, String password, int contact) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.email = email;
		this.password = password;
		this.contact = contact;
	}
//	public User(int uid, String uname, String email, String password, int contact) {
//		super();
//		this.uid = uid;
//		this.uname = uname;
//		this.email = email;
//		this.password = password;
//		this.contact = contact;
//		this.tournaments = new ArrayList<Tournament>();
//	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getContact() {
		return contact;
	}
	public void setContact(int contact) {
		this.contact = contact;
	}
//	public List<Tournament> getTournaments() {
//		return tournaments;
//	}
//
//	public void setTournaments(List<Tournament> tournaments) {
//		this.tournaments = tournaments;
//	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", email=" + email + ", password=" + password + ", contact="
				+ contact + "]";
	}


}
