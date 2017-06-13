package doan.quizzOnline.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "dethi_cauhoi")
@IdClass(DeThi_CauHoiPrimaryKey.class)
public class DeThi_CauHoi {
	
	//@Valid
	@Id
    @JoinColumn(name="madethi")
	@ManyToOne()
	DeThi maDeThi;
	//
	//@Valid
	
	//@NotEmpty
	@Id
    @JoinColumn(name="macauhoi")
	@ManyToOne()
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