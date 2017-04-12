package doan.quizzOnline.model;

import java.io.Serializable;

public class User_DeThiPrimaryKey implements Serializable{
	String maSinhVien;
	Integer maDeThi;
	//
	public User_DeThiPrimaryKey(){}
	//
	public String getMaSinhVien() {
		return maSinhVien;
	}
	public void setMaSinhVien(String maSinhVien) {
		this.maSinhVien = maSinhVien;
	}
	public Integer getMaDeThi() {
		return maDeThi;
	}
	public void setMaDeThi(int maDeThi) {
		this.maDeThi = maDeThi;
	}
	//
	@Override
	public boolean equals(Object obj){
		if(obj instanceof User_DeThiPrimaryKey){
            User_DeThiPrimaryKey us = (User_DeThiPrimaryKey) obj;

            if(!us.getMaDeThi().equals(maDeThi)){
                return false;
            }

            if(!us.getMaSinhVien().equals(maSinhVien)){
                return false;
            }
            return true;
        }

        return false;
	}
	@Override
    public int hashCode() {
        return maDeThi.hashCode() + maSinhVien.hashCode();
    }
}
