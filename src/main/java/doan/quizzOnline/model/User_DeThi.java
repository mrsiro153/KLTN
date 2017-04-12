package doan.quizzOnline.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user_dethi")
@IdClass(User_DeThiPrimaryKey.class)
public class User_DeThi {
	
	@Id
	@NotEmpty
	@JoinColumn(name="masinhvien")
	@ManyToOne(cascade=CascadeType.ALL)
	User maSinhVien;
	//
	@Id
	@NotEmpty
	@JoinColumn(name="madethi")
	@ManyToOne(cascade= CascadeType.ALL)
	DeThi maDeThi;
	//
	@Column(name="diem")
	float dIem;
	//
	protected User_DeThi(){}
	//
	public User_DeThi(User maSinhVien,DeThi maDeThi,float diem){
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
	public float getDiem() {
		return dIem;
	}
	public void setDiem(float diem) {
		this.dIem = diem;
	}
}
