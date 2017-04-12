package doan.quizzOnline.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "cauhoi")
public class CauHoi implements Serializable {
	
	@Id
	@NotEmpty
    @Column(name="idcauhoi", nullable=false)
	int idCauHoi;
	//
	@Column(name="noidungcauhoi")
	String noiDungCauHoi;
	//
	@Column(name="dapandung")
	String dapAnDung;
	//
	@JoinColumn(name="manoidung")
	@ManyToOne(cascade=CascadeType.ALL)
	NoiDung maNoiDung;
	//
	@OneToMany(mappedBy="maCauHoi",cascade=CascadeType.ALL)
	Set<DeThi_CauHoi> deThiCauHois;
	//
	@OneToOne(cascade = CascadeType.ALL, mappedBy = "cauHoi")
	ChiTietCauHoi chiTietCauHoi;
	//
	//1 cau hoi --> nhieu temporary
	//1 temporary -->1 cauhoi
	@OneToMany(mappedBy="cauHoi",cascade=CascadeType.ALL)
	Set<Temporary> temporaris;
	//
	public CauHoi(){}
	public CauHoi(int idCauHoi,String noiDungCauHoi,String dapAnDung,NoiDung maNoiDung){
		this.idCauHoi=idCauHoi;
		this.noiDungCauHoi=noiDungCauHoi;
		this.dapAnDung=dapAnDung;
		this.maNoiDung=maNoiDung;
		//this.chiTietCauHoi=chiTietCauHoi;
	}
	//
	public int getIdCauHoi() {
		return idCauHoi;
	}
	public void setIdCauHoi(int idCauHoi) {
		this.idCauHoi = idCauHoi;
	}
	public String getNoiDungCauHoi() {
		return noiDungCauHoi;
	}
	public void setNoiDungCauHoi(String noiDungCauHoi) {
		this.noiDungCauHoi = noiDungCauHoi;
	}
	public String getDapAnDung() {
		return dapAnDung;
	}
	public void setDapAnDung(String dapAnDung) {
		this.dapAnDung = dapAnDung;
	}
	public NoiDung getMaNoiDung() {
		return maNoiDung;
	}
	public void setMaNoiDung(NoiDung maNoiDung) {
		this.maNoiDung = maNoiDung;
	}
	//
	public Set<DeThi_CauHoi> getDeThiCauHois() {
		return deThiCauHois;
	}
	public void setDeThiCauHois(Set<DeThi_CauHoi> deThiCauHois) {
		this.deThiCauHois = deThiCauHois;
	}
	//
	public ChiTietCauHoi getChiTietCauHoi() {
		return chiTietCauHoi;
	}
	public void setChiTietCauHoi(ChiTietCauHoi chiTietCauHoi) {
		this.chiTietCauHoi = chiTietCauHoi;
	}
	//
	public Set<Temporary> getTemporaris() {
		return temporaris;
	}
	public void setTemporaris(Set<Temporary> temporaris) {
		this.temporaris = temporaris;
	}
}
