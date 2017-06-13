package doan.quizzOnline.model;

import java.sql.Date;
import java.sql.Time;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "dethi")
public class DeThi {
	@Id
	@NotNull
    @Column(name="iddethi", nullable=false)
	Integer idDeThi;
	//
	@Column(name="thoiluong")
	String thoiLuong;
	//
	@Column(name="socauhoi")
	Integer soCauHoi;
	//
	@Column(name="ngaymodethi")
	Date ngayMoDeThi;
	//
	@Column(name="giomodethi")
	Time gioMoDeThi;
	//
	@Column(name="mamonhoc")
	Integer maMonHoc;
	//
	@OneToMany(mappedBy="maDeThi")
	Set<User_DeThi> user_dethis;
	
	@OneToMany(mappedBy="maDeThi")
	Set<DeThi_CauHoi> deThiCauHois;
	//
	@Column(name="status",columnDefinition="default '0'" )
	Integer status;
	//
	public DeThi(){}
	public DeThi(Integer idDeThi,String thoiLuong,Integer soCauHoi,Date ngayMoDeThi,Time gioMoDeThi,Integer maMonHoc){
		this.idDeThi=idDeThi;
		this.thoiLuong=thoiLuong;
		this.soCauHoi=soCauHoi;
		this.ngayMoDeThi=ngayMoDeThi;
		this.gioMoDeThi=gioMoDeThi;
		this.maMonHoc=maMonHoc;
	}
	//
	public DeThi(Integer idDeThi, String thoiLuong, Integer soCauHoi, Integer maMonHoc,Integer status) {
		this.idDeThi = idDeThi;
		this.thoiLuong = thoiLuong;
		this.soCauHoi = soCauHoi;
		this.maMonHoc = maMonHoc;
		this.status=status;
	}
	//
	public Integer getIdDeThi() {
		return idDeThi;
	}
	public void setIdDeThi(Integer idDeThi) {
		this.idDeThi = idDeThi;
	}
	public String getThoiLuong() {
		return thoiLuong;
	}
	public void setThoiLuong(String thoiLuong) {
		this.thoiLuong = thoiLuong;
	}
	public Integer getSoCauHoi() {
		return soCauHoi;
	}
	public void setSoCauHoi(Integer soCauHoi) {
		this.soCauHoi = soCauHoi;
	}
	public Date getNgayMoDeThi() {
		return ngayMoDeThi;
	}
	public void setNgayMoDeThi(Date ngayMoDeThi) {
		this.ngayMoDeThi = ngayMoDeThi;
	}
	public Time getGioMoDeThi() {
		return gioMoDeThi;
	}
	public void setGioMoDeThi(Time gioMoDeThi) {
		this.gioMoDeThi = gioMoDeThi;
	}
	public Integer getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(Integer maMonHoc) {
		this.maMonHoc = maMonHoc;
	}
	//
	public Set<User_DeThi> getUser_dethis() {
		return user_dethis;
	}
	public void setUser_dethis(Set<User_DeThi> user_dethis) {
		this.user_dethis = user_dethis;
	}
	//
	public Set<DeThi_CauHoi> getDeThiCauHois() {
		return deThiCauHois;
	}
	public void setDeThiCauHois(Set<DeThi_CauHoi> deThiCauHois) {
		this.deThiCauHois = deThiCauHois;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
