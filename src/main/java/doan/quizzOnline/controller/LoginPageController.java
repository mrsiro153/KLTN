package doan.quizzOnline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginPageController {
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String returnTrangChu() {
		return "Login";
	}
	
}
