package doan.quizzOnline.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user_dethi")
@IdClass(User_DeThiPrimaryKey.class)
public class User_DeThi {
	
	@Id
	@JoinColumn(name="masinhvien")
	@ManyToOne()
	User maSinhVien;
	//
	//@Size(min=0,max=40)
	@Id
	@JoinColumn(name="madethi")
	@ManyToOne()
	DeThi maDeThi;
	
	@DecimalMax("10.0") 
	@DecimalMin("0.0") 
	@Column(name="diem")
	Float dIem;
	//
	public User_DeThi(){}
	//
	public User_DeThi(User maSinhVien,DeThi maDeThi,Float diem){
		this.maSinhVien=maSinhVien;
		this.maDeThi=maDeThi;
		this.dIem=diem;
	}
	public User getMaSinhVien() {
		return maSinhVien;
	}
	public void setMaSinhVien(User maSinhVien) {
		this.maSinhVien = maSinhVien;
	}
	public DeThi getMaDeThi() {
		return maDeThi;
	}
	public void setMaDeThi(DeThi maDeThi) {
		this.maDeThi = maDeThi;
	}
	public Float getDiem() {
		return dIem;
	}
	public void setDiem(Float diem) {
		this.dIem = diem;
	}
}
