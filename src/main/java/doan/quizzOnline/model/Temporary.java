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
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
//public class Temporary{}
///*
@Entity
@Table(name = "temporary")
@IdClass(TemporaryPrimaryKey.class)
public class Temporary implements Serializable{
	//
	@Id
	@NotEmpty
	@Column(name="iduser")
	String iduser;
	//	
	@Id
	@NotNull
	@Column(name="idexam")
	Integer idexam;
	//
	@Column(name="timere")
	String timere;
	//
	@Id
	@NotNull
	@Column(name="idquizz",nullable=false)
	Integer idquizz;
	//
	@Column(name="yourans")
	String yourAns;
	//
	@ManyToOne(optional=false)
	@JoinColumn(name="idquizz",insertable=false,updatable=false)
	CauHoi cauHoi;
	//
	public Temporary() {}
	public Temporary(String idUser, Integer idExam, String timeRe, Integer idQuizz, String yourAns) {
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
	public Integer getIdExam() {
		return idexam;
	}
	public void setIdExam(Integer idExam) {
		this.idexam = idExam;
	}
	public String getTimeRe() {
		return timere;
	}
	public void setTimeRe(String timeRe) {
		this.timere = timeRe;
	}
	public Integer getIdQuizz() {
		return idquizz;
	}
	public void setIdQuizz(Integer idQuizz) {
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
