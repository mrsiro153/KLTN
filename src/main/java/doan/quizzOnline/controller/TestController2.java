package doan.quizzOnline.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import doan.quizzOnline.model.CauHoiDAO;
import doan.quizzOnline.model.DeThi;
import doan.quizzOnline.model.DeThiDAO;
import doan.quizzOnline.model.DeThi_CauHoi;
import doan.quizzOnline.model.DeThi_CauHoiDAO;
import doan.quizzOnline.model.MonHoc;
import doan.quizzOnline.model.MonHocDAO;
import doan.quizzOnline.model.Temporary;
import doan.quizzOnline.model.TemporaryDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;
import doan.quizzOnline.service.UserService;

@Controller
public class TestController2 {
	final Logger logger = Logger.getLogger(this.getClass());
	//final static Lo
	//
	@RequestMapping(value="/user1",method=RequestMethod.GET)
	@ResponseBody
	public void test(){
		List<User> uss = userDAO.findByQuyenAndClassOfStudent("class1");
		for(User u : uss){
			logger.info(u.getHoTen());
		}
	}
	
	@Autowired
	UserService userService;
	
	@Autowired
	DeThiDAO deThiDAO;
	
	@Autowired 
	MonHocDAO monHocDAO;
	
	@Autowired 
	User_DeThiDAO user_DeThiDAO;
	
	@Autowired 
	TemporaryDAO temporaryDAO;
	
	@Autowired
	DeThi_CauHoiDAO deThi_CauHoiDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	CauHoiDAO cauHoiDAO;
	
	
	public void testLog4j2(){
		System.out.println("-------------------");
		logger.info("info");
		logger.debug("debug");
		logger.error("error");
		logger.trace("trace");
		logger.warn("warning");
		logger.fatal("fatal");
		System.out.println("-------------------");
	}
}
