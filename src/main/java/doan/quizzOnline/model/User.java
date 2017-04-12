package doan.quizzOnline.model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user")
public class User {
	@Id
	@NotEmpty
    @Column(name="id", nullable=false)
	String id;
	//
	@Column(name="hoten")
	String hoTen;
	//
	@Column(name="ngaysinh")
	Date ngaySinh;
	//
	@Column(name="gioitinh")
	String gioiTinh;
	//
	@Column(name="diachi")
	String diaChi;
	//
	@Column(name="sdt")
	String sDT;
	//
	@Column(name="password")
	String passWord;
	//
	//@Column(name="quyen")
	//int quyen;
	
	//foreign key
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="quyen",updatable=false)
	Quyen quyen;
	//
	@OneToMany(mappedBy="maSinhVien",cascade=CascadeType.ALL)
	Set<User_DeThi> user_dethis;
	//
	public User(){}
	public User(String id, String hoTen, Date ngaySinh, String gioiTinh, String diaChi, String sDT, String passWord,
			Quyen quyen) {
		this.id = id;
		this.hoTen = hoTen;
		this.ngaySinh = ngaySinh;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.sDT = sDT;
		this.passWord = passWord;
		this.quyen = quyen;
	}
	//
	public Quyen getQuyen() {
		return quyen;
	}
	public void setQuyenUser(Quyen quyen) {
		this.quyen = quyen;
	}
	//
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHoTen() {
		return hoTen;
	}
	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}
	public Date getNgaySinh() {
		return ngaySinh;
	}
	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}
	public String getGioiTinh() {
		return gioiTinh;
	}
	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}
	public String getDiaChi() {
		return diaChi;
	}
	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}
	public String getsDT() {
		return sDT;
	}
	public void setsDT(String sDT) {
		this.sDT = sDT;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	//foreign key
	//
	public Set<User_DeThi> getUser_dethis() {
		return user_dethis;
	}
	public void setUser_dethis(Set<User_DeThi> user_dethis) {
		this.user_dethis = user_dethis;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", hoTen=" + hoTen + ", ngaySinh=" + ngaySinh + ", gioiTinh=" + gioiTinh + ", diaChi="
				+ diaChi + ", sDT=" + sDT + ", passWord=" + passWord + ", quyen=" + quyen + "]";
	}
	
}
