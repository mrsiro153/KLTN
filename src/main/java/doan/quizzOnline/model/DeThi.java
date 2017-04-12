package doan.quizzOnline.model;

import java.sql.Date;
import java.sql.Time;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "dethi")
public class DeThi {
	@Id
	@NotEmpty
    @Column(name="iddethi", nullable=false)
	int idDeThi;
	//
	@Column(name="thoiluong")
	String thoiLuong;
	//
	@Column(name="socauhoi")
	int soCauHoi;
	//
	@Column(name="ngaymodethi")
	Date ngayMoDeThi;
	//
	@Column(name="giomodethi")
	Time gioMoDeThi;
	//
	@Column(name="mamonhoc")
	int maMonHoc;
	//
	@OneToMany(mappedBy="maDeThi",cascade=CascadeType.ALL)
	Set<User_DeThi> user_dethis;
	//
	@OneToMany(mappedBy="maDeThi",cascade=CascadeType.ALL)
	Set<DeThi_CauHoi> deThiCauHois;
	//
	public DeThi(){}
	public DeThi(int idDeThi,String thoiLuong,int soCauHoi,Date ngayMoDeThi,Time gioMoDeThi,int maMonHoc){
		this.idDeThi=idDeThi;
		this.thoiLuong=thoiLuong;
		this.soCauHoi=soCauHoi;
		this.ngayMoDeThi=ngayMoDeThi;
		this.gioMoDeThi=gioMoDeThi;
		this.maMonHoc=maMonHoc;
	}
	//
	public int getIdDeThi() {
		return idDeThi;
	}
	public void setIdDeThi(int idDeThi) {
		this.idDeThi = idDeThi;
	}
	public String getThoiLuong() {
		return thoiLuong;
	}
	public void setThoiLuong(String thoiLuong) {
		this.thoiLuong = thoiLuong;
	}
	public int getSoCauHoi() {
		return soCauHoi;
	}
	public void setSoCauHoi(int soCauHoi) {
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
	public int getMaMonHoc() {
		return maMonHoc;
	}
	public void setMaMonHoc(int maMonHoc) {
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
	
}
