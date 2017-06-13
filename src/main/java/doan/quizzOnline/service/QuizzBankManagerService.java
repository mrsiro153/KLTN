package doan.quizzOnline.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import doan.quizzOnline.DTO.Quizz;
import doan.quizzOnline.model.CauHoi;
import doan.quizzOnline.model.CauHoiDAO;

@Service
public class QuizzBankManagerService {
	
	public ArrayList<Quizz> getAllQuizzsArrayList(){
		ArrayList<Quizz> ar=new ArrayList<Quizz>();
		for(CauHoi c: cauHoiDAO.findAll()){
			try{
			ar.add(new Quizz(c.getIdCauHoi()+"",c.getNoiDungCauHoi(),c.getDapAnDung(),c.getChiTietCauHoi().getDapAnA(),
					c.getChiTietCauHoi().getDapAnB(),c.getChiTietCauHoi().getDapAnC(),c.getChiTietCauHoi().getDapAnD()));
			}catch(Exception e){
				
			}
		}
		return ar;
	}
	
	//
	
	
	@Autowired
	CauHoiDAO cauHoiDAO;
}
