package com.green.biz.view.Controller;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.green.biz.member.MemberService;

@Controller
@SessionAttributes("loginUser")
public class testController {
	
	@RequestMapping(value="test", method = RequestMethod.GET)
	public String go_social() {
		
		return "test";
	}

	
	@Inject
	JavaMailSender mailSender;
	MemberService memberservice;
	
	//private static final Logger logger=
	//	LoggerFactory.getLogger(memberController.class);
	private static final String String = null;
	
	//mailSending 기능
	@RequestMapping(value="auth.do", method = RequestMethod.POST)
	public String mailSending() {
		return "";
	}
}


