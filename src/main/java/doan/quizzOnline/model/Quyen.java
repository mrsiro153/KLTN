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
	int id;
	
	@Column(name="Tenquyen")
	String tenQuyen;
	//
	//foreign key
	@OneToMany(mappedBy="quyen",cascade=CascadeType.ALL)
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
	public Quyen(int idQuyen,String tenQuyen){
		this.id=idQuyen;
		this.tenQuyen=tenQuyen;
	}
	public int getIdQuyen() {
		return id;
	}
	public void setIdQuyen(int idQuyen) {
		this.id= idQuyen;
	}
	public String getTenQuyen() {
		return tenQuyen;
	}
	public void setTenQuyen(String tenQuyen) {
		this.tenQuyen = tenQuyen;
	}
	
}
