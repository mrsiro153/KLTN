package doan.quizzOnline.model;

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
@Table(name = "noidung")
public class NoiDung {
	//
	@Id
	@NotEmpty
    @Column(name="idnoidung", nullable=false)
	int idNoiDung;
	//
	@JoinColumn(name="idmonhoc")
	@ManyToOne(cascade=CascadeType.ALL)
	MonHoc idMonHoc;
	//
	@Column(name="tennoidung")
	String tenNoiDung;
	//
	@OneToMany(mappedBy="maNoiDung",cascade=CascadeType.ALL)
	Set<CauHoi> cauHois;
	//
	public NoiDung(){}
	public NoiDung(int idNoiDung,MonHoc idMonHoc,String tenNoiDung){
		this.idNoiDung=idNoiDung;
		this.idMonHoc=idMonHoc;
		this.tenNoiDung=tenNoiDung;
	}
	//
	public int getIdNoiDung() {
		return idNoiDung;
	}
	public void setIdNoiDung(int idNoiDung) {
		this.idNoiDung = idNoiDung;
	}
	public MonHoc getIdMonHoc() {
		return idMonHoc;
	}
	public void setIdMonHoc(MonHoc idMonHoc) {
		this.idMonHoc = idMonHoc;
	}
	public String getTenNoiDung() {
		return tenNoiDung;
	}
	public void setTenNoiDung(String tenNoiDung) {
		this.tenNoiDung = tenNoiDung;
	}
	//
	public Set<CauHoi> getCauHois() {
		return cauHois;
	}
	public void setCauHois(Set<CauHoi> cauHois) {
		this.cauHois = cauHois;
	}
	
	
}
