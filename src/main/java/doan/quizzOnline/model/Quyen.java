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
@Table(name = "quyen")
public class Quyen {
	
	@Id
	@NotEmpty
    @Column(name="idquyen", nullable=false)
	Integer id;
	
	@Column(name="Tenquyen")
	String tenQuyen;
	//
	//foreign key
	@OneToMany(mappedBy="quyen")
	Set<User> users;
	//
	public Set<User> getUsers() {
		return users;
	}
	public void setUsers(Set<User> users) {
		this.users = users;
	}
	//
	protected Quyen(){}
	//
	public Quyen(Integer idQuyen,String tenQuyen){
		this.id=idQuyen;
		this.tenQuyen=tenQuyen;
	}
	public Integer getIdQuyen() {
		return id;
	}
	public void setIdQuyen(Integer idQuyen) {
		this.id= idQuyen;
	}
	public String getTenQuyen() {
		return tenQuyen;
	}
	public void setTenQuyen(String tenQuyen) {
		this.tenQuyen = tenQuyen;
	}
	
}
