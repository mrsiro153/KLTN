package doan.quizzOnline.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "chitietcauhoi")
public class ChiTietCauHoi implements Serializable{
	//
	@Id
	@NotNull
    @Column(name="macauhoi", nullable=false)
	Integer maCauHoi;
	//
	@Column(name="dapana")
	String dapAnA;
	//
	@Column(name="dapanb")
	String dapAnB;
	//
	@Column(name="dapanc")
	String dapAnC;
	//
	@Column(name="dapand")
	String dapAnD;
	//
	//this properties for reference CauHoi
	@JoinColumn(name = "macauhoi")
	@OneToOne
	CauHoi cauHoi;
	//
	public ChiTietCauHoi(){}
	public ChiTietCauHoi(Integer maCauHoi,String dapAnA,String dapAnB,String dapAnC,String dapAnD){
		this.maCauHoi=maCauHoi;
		this.dapAnA=dapAnA;
		this.dapAnB=dapAnB;
		this.dapAnC=dapAnC;
		this.dapAnD=dapAnD;
	}
	//
	public Integer getMaCauHoi() {
		return maCauHoi;
	}
	public void setMaCauHoi(Integer maCauHoi) {
		this.maCauHoi = maCauHoi;
	}
	public String getDapAnA() {
		return dapAnA;
	}
	public void setDapAnA(String dapAnA) {
		this.dapAnA = dapAnA;
	}
	public String getDapAnB() {
		return dapAnB;
	}
	public void setDapAnB(String dapAnB) {
		this.dapAnB = dapAnB;
	}
	public String getDapAnC() {
		return dapAnC;
	}
	public void setDapAnC(String dapAnC) {
		this.dapAnC = dapAnC;
	}
	public String getDapAnD() {
		return dapAnD;
	}
	public void setDapAnD(String dapAnD) {
		this.dapAnD = dapAnD;
	}
	//
	public CauHoi getCauHoi() {
		return cauHoi;
	}
	public void setCauHoi(CauHoi cauHoi) {
		this.cauHoi = cauHoi;
	}
	
}
