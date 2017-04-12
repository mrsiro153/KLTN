package doan.quizzOnline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import doan.quizzOnline.MainClass;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.service.UserService;

@Controller
public class TestController2 {
	final static org.apache.log4j.Logger logger2= org.apache.log4j.Logger.getLogger(TestController2.class);
	//final static Lo
	//
	@RequestMapping(value="/user1",method=RequestMethod.GET)
	@ResponseBody
	public void test(){
		/*
		List<User> uss= userService.getAllUsers();
			uss.forEach((user)->{
			System.out.println(user.getHoTen()+" "+user.getQuyen().getTenQuyen());
		});
		*/
			testLog4j2();
	}
	
	@Autowired
	UserService userService;
	
	public static void testLog4j2(){
		System.out.println("-------------------");
		logger2.info("info");
		logger2.debug("debug");
		logger2.error("error");
		logger2.trace("trace");
		logger2.warn("warning");
		logger2.fatal("fatal");
		System.out.println("-------------------");
	}
}
