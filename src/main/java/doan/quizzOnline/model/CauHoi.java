package doan.quizzOnline.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;


@Entity
@Table(name = "cauhoi")
public class CauHoi implements Serializable {
	
	@Id
	@NotNull
    @Column(name="idcauhoi", nullable=false)
	Integer idCauHoi;
	//
	@Column(name="noidungcauhoi")
	String noiDungCauHoi;
	//
	@Column(name="dapandung")
	String dapAnDung;
	//
	@JoinColumn(name="manoidung")
	@ManyToOne()
	NoiDung maNoiDung;
	//
	@OneToMany(mappedBy="maCauHoi")
	Set<DeThi_CauHoi> deThiCauHois;
	//
	@OneToOne(mappedBy = "cauHoi")
	ChiTietCauHoi chiTietCauHoi;
	//
	//1 cau hoi --> nhieu temporary
	//1 temporary -->1 cauhoi
	@OneToMany(mappedBy="cauHoi")
	Set<Temporary> temporaris;
	//
	public CauHoi(){}
	public CauHoi(Integer idCauHoi,String noiDungCauHoi,String dapAnDung,NoiDung maNoiDung){
		this.idCauHoi=idCauHoi;
		this.noiDungCauHoi=noiDungCauHoi;
		this.dapAnDung=dapAnDung;
		this.maNoiDung=maNoiDung;
		//this.chiTietCauHoi=chiTietCauHoi;
	}
	//
	public Integer getIdCauHoi() {
		return idCauHoi;
	}
	public void setIdCauHoi(Integer idCauHoi) {
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
