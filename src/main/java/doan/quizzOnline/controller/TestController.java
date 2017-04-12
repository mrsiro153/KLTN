package doan.quizzOnline.controller;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import doan.quizzOnline.model.CauHoi;
import doan.quizzOnline.model.CauHoiDAO;
import doan.quizzOnline.model.ChiTietCauHoiDAO;
import doan.quizzOnline.model.DeThi;
import doan.quizzOnline.model.DeThiDAO;
import doan.quizzOnline.model.DeThi_CauHoi;
import doan.quizzOnline.model.MonHoc;
import doan.quizzOnline.model.MonHocDAO;
import doan.quizzOnline.model.NoiDung;
import doan.quizzOnline.model.NoiDungDAO;
import doan.quizzOnline.model.Quyen;
import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.Temporary;
import doan.quizzOnline.model.TemporaryDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;

import java.sql.Date;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	final static Logger logger = Logger.getLogger(TestController.class);
	
	@RequestMapping(value="/test",method=RequestMethod.GET)
	@ResponseBody
	public void test(){
		for(User us: userDAO.findAll()){
			//System.out.println(us.getHoTen()+" "+us.getQuyen().getTenQuyen());
			//get by User
			for(Object j : us.getUser_dethis()){
				if(j instanceof User_DeThi){
					User_DeThi ob = (User_DeThi)j;
					System.out.println(ob.getMaDeThi().getIdDeThi()+" "+ob.getDiem());
				}
			}
			
		}
		/*
		for(Quyen q:quyenDAO.findAll()){
			System.out.println(q.getTenQuyen());
			Set<User>  s = q.getUsers();
			for(Object ob: s){
				User us = (User)ob;
				System.out.println(us.getHoTen());
			}
			System.out.println("");
		}
		*/
	}
	//
	@RequestMapping(value="/test1",method=RequestMethod.GET)
	@ResponseBody
	public void test1(){
		for(User_DeThi us: user_DeThiDAO.findAll()){
			System.out.println(us.getMaSinhVien().getHoTen()+" : "+us.getMaDeThi().getIdDeThi()+" : "+us.getDiem());
		}
	}
	
	@RequestMapping(value="/test2",method=RequestMethod.GET)
	@ResponseBody
	public void test2(){
		for(DeThi d: deThiDAO.findAll()){
			System.out.println(d.getMaMonHoc()+" "+d.getSoCauHoi());
			for(User_DeThi d1:d.getUser_dethis()){
				logger.fatal(d1.getMaSinhVien().getHoTen()+": "+d1.getDiem());
			}
			System.out.println("---------------------");
		}
	}
	
	@RequestMapping(value="/test3",method=RequestMethod.GET)
	@ResponseBody
	public void test3(){
		for(CauHoi c: cauHoiDAO.findAll()){
			System.out.println(c.getNoiDungCauHoi());
			for(DeThi_CauHoi c1:c.getDeThiCauHois()){
				System.out.println(c1.getMaDeThi().getIdDeThi());
			}
			System.out.println("------------------------------------");
		}
	}
	
	@RequestMapping(value="/test4",method=RequestMethod.GET)
	@ResponseBody
	public void test4(){
		//get noi dung of mon hoc
		for(MonHoc m:monHocDAO.findAll()){
			System.out.println(m.getTenMonHoc());
			for(NoiDung n:m.getNoidungs()){
				System.out.println(n.getTenNoiDung());
			}
			System.out.println("---------------------");
		}
	}
	
	@RequestMapping(value="/test5",method=RequestMethod.GET)
	@ResponseBody
	public void test5(){
		//get noi dung of mon hoc
		for(NoiDung n:noiDungDAO.findAll()){
			System.out.println(n.getTenNoiDung());
			for(CauHoi ch:n.getCauHois()){
				System.out.println(ch.getNoiDungCauHoi());
			}
			System.out.println("--------------------------");
		}
	}
	//
	@RequestMapping(value="/test6",method=RequestMethod.GET)
	@ResponseBody
	public void test6(){
		//get CauHoi and CauHoiChiTiet
		for(CauHoi c:cauHoiDAO.findAll()){
			System.out.println(c.getIdCauHoi()+" "+c.getNoiDungCauHoi()+" "+c.getChiTietCauHoi().getDapAnA()+" "+c.getChiTietCauHoi().getDapAnB());
			System.out.println("-------------------");
		}
	}
	//
	@RequestMapping(value="/test7",method=RequestMethod.GET)
	@ResponseBody
	public void test7(){
		for(NoiDung n: noiDungDAO.findAll()){
			System.out.println(n.getTenNoiDung());
			for(CauHoi c:n.getCauHois()){
				System.out.println(c.getNoiDungCauHoi()+" "+c.getChiTietCauHoi().getDapAnA());
			}
			System.out.println("--------------------");
		}
	}
	//
	@RequestMapping(value="/test8",method=RequestMethod.GET)
	@ResponseBody
	public void test8(){
		for(CauHoi c: cauHoiDAO.findAll()){
			System.out.println("--------------------------");
			System.out.println(c.getNoiDungCauHoi());
			for(Temporary t:c.getTemporaris()){
				System.out.println(t.getIdQuizz()+" "+t.getTimeRe());
			}
		}
		//
	}
	
	@RequestMapping(value="/add1",method=RequestMethod.GET)
	@ResponseBody
	public void add1(){
		Quyen quyen = quyenDAO.findById(1);
		Date d = new Date(1220, 02, 5);
		User us = new User("bank3","hello world",d,"Nam","Pham Ngoc Thach","01245335","123",quyen);
		userDAO.save(us);
	}
		
	//
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	QuyenDAO quyenDAO;
	
	@Autowired
	User_DeThiDAO user_DeThiDAO;
	
	@Autowired
	DeThiDAO deThiDAO;
	
	@Autowired
	CauHoiDAO cauHoiDAO;
	
	@Autowired
	MonHocDAO monHocDAO;
	
	@Autowired
	NoiDungDAO noiDungDAO;
	
	@Autowired
	ChiTietCauHoiDAO chiTietCauHoiDAO;
	
	@Autowired
	TemporaryDAO temporaryDAO;
}
