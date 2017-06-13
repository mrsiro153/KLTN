package doan.quizzOnline.controller.lecture;

import java.sql.ResultSet;


public class GetSubject {
	/*
	public ResultSet getAllSubjects(){
		ResultSet rs=null;
		try {
			ConnectDatabase cn = new ConnectDatabase();
			String sql="SELECT * FROM quizz.dethi,quizz.monhoc where dethi.MaMonHoc=monhoc.idMonHoc order by idDeThi";
			rs=cn.GetData(sql);
			if(!rs.next()){
				//nodta
			}else{
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return rs;
	}
	public ResultSet getParts(String idSubject){
		ResultSet rs= null;
		try {
			ConnectDatabase cn = new ConnectDatabase();
			String sql="SELECT * FROM quizz.noidung where idMonHoc="+idSubject;
			rs=cn.GetData(sql);
			if(!rs.next()){
				//nodta
			}else{
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return rs;
	}
	public ResultSet getOnlySubjects(){
		ResultSet rs= null;
		try {
			ConnectDatabase cn = new ConnectDatabase();
			String sql="SELECT * FROM quizz.monhoc";
			rs=cn.GetData(sql);
			if(!rs.next()){
				//nodta
			}else{
				return rs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return rs;
	}
	*/
}
