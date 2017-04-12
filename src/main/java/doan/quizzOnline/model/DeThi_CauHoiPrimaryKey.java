package doan.quizzOnline.model;

import java.io.Serializable;

public class DeThi_CauHoiPrimaryKey implements Serializable{
	Integer maDeThi;
	Integer maCauHoi;
	//
	public DeThi_CauHoiPrimaryKey(){}
	//
	public Integer getMaDeThi() {
		return maDeThi;
	}
	public void setMaDeThi(Integer maDeThi) {
		this.maDeThi = maDeThi;
	}
	public Integer getMaCauHoi() {
		return maCauHoi;
	}
	public void setMaCauHoi(Integer maCauHoi) {
		this.maCauHoi = maCauHoi;
	}
	//
	@Override
	public boolean equals(Object obj){
		if(obj instanceof DeThi_CauHoiPrimaryKey){
            DeThi_CauHoiPrimaryKey us_de = (DeThi_CauHoiPrimaryKey) obj;
            if(!us_de.getMaDeThi().equals(maDeThi)){
                return false;
            }

            if(!us_de.getMaCauHoi().equals(maCauHoi)){
                return false;
            }
            return true;
        }

        return false;
	}
	@Override
    public int hashCode() {
        return maDeThi.hashCode() + maCauHoi.hashCode();
    }
}
