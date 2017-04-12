package doan.quizzOnline.model;

import java.io.Serializable;

import javax.persistence.Column;

public class TemporaryPrimaryKey implements Serializable {
	private String iduser;
	//
	private Integer idexam;
	//
	private Integer idquizz;
	//
	public TemporaryPrimaryKey(){}
	//
	public Integer getIdquizz() {
		return idquizz;
	}
	public void setIdquizz(Integer idquizz) {
		this.idquizz = idquizz;
	}
	public String getIdUser() {
		return iduser;
	}
	public void setIdUser(String idUser) {
		this.iduser = idUser;
	}
	public Integer getIdExam() {
		return idexam;
	}
	public void setIdExam(Integer idExam) {
		this.idexam = idExam;
	}
	@Override
    public boolean equals(Object obj) {
        if(obj instanceof TemporaryPrimaryKey){
            TemporaryPrimaryKey temp = (TemporaryPrimaryKey) obj;

            if(!temp.getIdExam().equals(idexam)){
                return false;
            }

            if(!temp.getIdUser().equals(iduser)){
                return false;
            }
            if(!temp.getIdquizz().equals(idquizz)){
                return false;
            }


            return true;
        }

        return false;
    }
	@Override
    public int hashCode() {
        return idexam.hashCode() + iduser.hashCode()+idquizz.hashCode();
    }
	
}
