package doan.quizzOnline.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "dethi_cauhoi")
@IdClass(DeThi_CauHoiPrimaryKey.class)
public class DeThi_CauHoi {
	//
	@Id
	@NotEmpty
    @JoinColumn(name="madethi", nullable=false)
	@ManyToOne(cascade=CascadeType.ALL)
	DeThi maDeThi;
	//
	@Id
	@NotEmpty
    @JoinColumn(name="macauhoi", nullable=false)
	@ManyToOne(cascade=CascadeType.ALL)
	CauHoi maCauHoi;
	//
	public DeThi_CauHoi(){}
	public DeThi_CauHoi(DeThi maDeThi,CauHoi maCauHoi){
		this.maDeThi=maDeThi;
		this.maCauHoi=maCauHoi;
	}
	//
	public DeThi getMaDeThi() {
		return maDeThi;
	}
	public void setMaDeThi(DeThi maDeThi) {
		this.maDeThi = maDeThi;
	}
	public CauHoi getMaCauHoi() {
		return maCauHoi;
	}
	public void setMaCauHoi(CauHoi maCauHoi) {
		this.maCauHoi = maCauHoi;
	}
}