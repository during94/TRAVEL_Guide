package com.green.biz.view.Controller;

import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.green.biz.UserContent.UserContentService;
import com.green.biz.UserContent.UserContentVO;
import com.green.biz.banner.bannerService;
import com.green.biz.banner.bannerVO;
import com.green.biz.mail.EmailCheck;
import com.green.biz.member.MemberService;
import com.green.biz.member.MemberVO;
import com.green.biz.social.Kakao_login_api;
import com.green.biz.social.Naver_loginBO;
import com.green.biz.util.SearchCriteria;

@Controller
@SessionAttributes("loginUser")
public class memberController {
	
	private Naver_loginBO naverLoginBO;
	
	//@Autowired
	//private UserMailSenderService mailsender;
	
	@Autowired
	private void setNaverLoginBO(Naver_loginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private EmailCheck emailcheck;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private bannerService bannerService;
	
	@Autowired
	private UserContentService contentService;
	
	@RequestMapping(value="main", method = RequestMethod.GET)
	public String main(Model model, bannerVO vo, UserContentVO top_vo ) {
		
		List<bannerVO> banner= bannerService.banner_list(vo);
		
		model.addAttribute("bannerList", banner);
		
		List<UserContentVO> content= contentService.topList(top_vo);
		
		model.addAttribute("contentList", content);
		
		return "main";
	}
	
	@RequestMapping(value="/login_form", method=RequestMethod.GET)
	public String loginForm(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("naver_url", naverAuthUrl);
		
		return "login/login_form";
	}
	
	@RequestMapping(value="/login" , method=RequestMethod.POST)
	public String login(MemberVO vo, Model model) {
		
		MemberVO loginUser = memberService.getUser(vo);
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			
			return "redirect:main_form";
		} else {
			return "login/login_fail";
		}
	}
	
	@RequestMapping(value="/logout_form" ,method=RequestMethod.GET)
	public String logout(HttpSession socail_session, SessionStatus session) {
		session.setComplete();
		socail_session.invalidate();
		
		return "redirect:main";
	}
	
	@RequestMapping(value="/id_check_box")
	public String id_check_box() {
		
		return "/login/id_check_box";
	}
	
	@RequestMapping(value="id_check_form", method = RequestMethod.POST)
	public String find_check_id(@RequestParam(value="id", defaultValue = "" ,required = false)
												String id, Model model) {
		MemberVO userID = memberService.find_id(id);
		
		if(userID != null) {
			model.addAttribute("message", 1);
		} else {
			model.addAttribute("message", -1);
		}
		
		model.addAttribute("id", id);
		
		return "login/id_check_box";
	}
	
	@RequestMapping(value="/main_form")
	public String go_main(Model model, bannerVO vo, UserContentVO top_vo) {
		
		List<bannerVO> banner= bannerService.banner_list(vo);
		
		model.addAttribute("bannerList", banner);
		
		List<UserContentVO> content= contentService.topList(top_vo);
		
		model.addAttribute("contentList", content);
		
		return "main";
	}
	
	@RequestMapping(value="/main_login", method = RequestMethod.GET)
	public String go_main_login(Model model, bannerVO vo) {
		
		List<bannerVO> banner= bannerService.banner_list(vo);
		
		model.addAttribute("bannerList", banner);
			
		return "/login/main_login";
	}
	
	@RequestMapping(value="/join_form")
	public String join_form() {
		
		return "login/join_form";
	}
	
	
	@RequestMapping(value="mail_check", method = RequestMethod.GET)
	public String mail_check(@ModelAttribute("loginUser")MemberVO vo, Model model){
		System.out.println("메일 확인용" + vo);
		
		String authKey = emailcheck.getKey(10);
		
		vo.setEmail_check(authKey);
		
		memberService.update_email_ck(vo);
		System.out.println("이메일 인증 작업 확인 : " + vo);
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			
			String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
					+"<p>인증번호는 " + "<h4>"+authKey+"</h4> 입니다.</p>"
					+"인증 페이지 창에 입력해 주세요.";
			
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom("YourName <your_email@address>");
				helper.setTo(vo.getEmail());
				helper.setSubject("회원가입 이메일 인증");
				helper.setText(mailContent, true);
			}
		};
		
		mailSender.send(preparator);
		
		return "login/mail_check";
	}

	@RequestMapping(value="email_ck_ok")
	public String email_ck_ok(@ModelAttribute("loginUser") MemberVO vo){
		vo.setEmail_check("Y");
		
		memberService.update_email_ck(vo);
		
		System.out.println("인증 완료 후 메일 체크 변경확인" + vo);
		
		return "login/self_close";
	}
	
	@RequestMapping(value="new_join")
	public String join(MemberVO vo) {
		memberService.insertUser(vo);
		
		return "redirect:login_form";
	}
	
	@RequestMapping(value="mypage_main")
	public String mypage(MemberVO vo, Object sessionId_kakao) {
		
		System.out.println("넘겨받은 값 : " + sessionId_kakao);
		MemberVO member = memberService.getUser(vo);

		if(member != null) {
			return "mypage/mypage_main";
		} else if(sessionId_kakao != null){
			return "mypage/mypage_main2";
		} else {
			return "login/login_form";
		}
		
	}
	
	@RequestMapping(value="mypage_main2")
	public String mypage2(MemberVO vo, Model model) {
		
		MemberVO member = memberService.getUser(vo);

		if(member != null) {
			return "mypage/mypage_main2";
		} else {
			model.addAttribute("message", 1);
				
			return "mypage/mypage_main";				
		}
	}
	
	@RequestMapping(value="mypage_update" , method = RequestMethod.GET)
	public String mypage_update() {
		return "mypage/mypage_update";
	}
	
	@RequestMapping(value="myinfo_update", method = RequestMethod.POST)
	public String myinfo_update(MemberVO vo,HttpSession session) {
		
		memberService.updateInfo(vo);
		
		
		session.invalidate();
		
		return "login/login_form";
	}
	
	@RequestMapping(value="find_user")
	public String find_id_view() {
		
		return "/login/find_user";
	}
	
	@RequestMapping(value="find_myid")
	public String find_myid_check(MemberVO vo, Model model) {
		
		MemberVO member = memberService.find_name_email(vo);
		
		if(member != null) {
			model.addAttribute("message", "1");
			model.addAttribute("id",member.getId());
		} else {
			model.addAttribute("message", "-1");
		}
		
		return "login/findResult";
	}
	
	@RequestMapping(value="find_mypwd")
	public String find_mypwd(MemberVO vo, Model model) {
		MemberVO member = memberService.find_pwd(vo);
		
		if(member != null) {
			model.addAttribute("message", "1");
			model.addAttribute("id", member.getId());
		} else {
			model.addAttribute("message", "-1");
		}
		
		return "login/findPwdResult";
	}
	
	@RequestMapping(value="update_pwd")
	public String update_pwd(MemberVO vo) {
		memberService.update_pwd(vo);
		
		return "/login/login_form";
	}
	
}








































