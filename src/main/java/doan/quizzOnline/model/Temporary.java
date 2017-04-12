package doan.quizzOnline.model;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
//public class Temporary{}
///*
@Entity
@Table(name = "temporary")
@IdClass(TemporaryPrimaryKey.class)
public class Temporary implements Serializable{
	//
	@Id
	@Column(name="iduser")
	String iduser;
	//	
	@Id
	@Column(name="idexam")
	int idexam;
	//
	@Column(name="timere")
	String timere;
	//
	@Id
	@NotEmpty
	@Column(name="idquizz",nullable=false)
	int idquizz;
	//
	@Column(name="yourans")
	String yourAns;
	//
	@ManyToOne(cascade=CascadeType.ALL,optional=false)
	@JoinColumn(name="idquizz",insertable=false,updatable=false)
	CauHoi cauHoi;
	//
	public Temporary() {}
	public Temporary(String idUser, int idExam, String timeRe, int idQuizz, String yourAns) {
		this.iduser = idUser;
		this.idexam = idExam;
		this.timere = timeRe;
		this.idquizz = idQuizz;
		this.yourAns = yourAns;
	}
	//
	public String getIdUser() {
		return iduser;
	}
	public void setIdUser(String idUser) {
		this.iduser = idUser;
	}
	public int getIdExam() {
		return idexam;
	}
	public void setIdExam(int idExam) {
		this.idexam = idExam;
	}
	public String getTimeRe() {
		return timere;
	}
	public void setTimeRe(String timeRe) {
		this.timere = timeRe;
	}
	public int getIdQuizz() {
		return idquizz;
	}
	public void setIdQuizz(int idQuizz) {
		this.idquizz = idQuizz;
	}
	public String getYourAns() {
		return yourAns;
	}
	public void setYourAns(String yourAns) {
		this.yourAns = yourAns;
	}
	//
	
}
//*/
