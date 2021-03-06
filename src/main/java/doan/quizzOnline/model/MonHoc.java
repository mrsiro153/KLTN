package doan.quizzOnline.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "monhoc")
public class MonHoc {
	@Id
	@NotEmpty
    @Column(name="idmonhoc", nullable=false)
	Integer idMonHoc;
	//
	@Column(name="tenmonhoc")
	String tenMonHoc;
	//
	@OneToMany(mappedBy="idMonHoc")
	Set<NoiDung> noidungs;
	//
	public MonHoc(){}
	public MonHoc(Integer idMonHoc,String tenMonHoc){
		this.idMonHoc=idMonHoc;
		this.tenMonHoc=tenMonHoc;
	}
	//
	public Integer getIdMonHoc() {
		return idMonHoc;
	}
	public void setIdMonHoc(Integer idMonHoc) {
		this.idMonHoc = idMonHoc;
	}
	public String getTenMonHoc() {
		return tenMonHoc;
	}
	public void setTenMonHoc(String tenMonHoc) {
		this.tenMonHoc = tenMonHoc;
	}
	//
	public Set<NoiDung> getNoidungs() {
		return noidungs;
	}
	public void setNoidungs(Set<NoiDung> noidungs) {
		this.noidungs = noidungs;
	}
	
}
