package com.green.biz.view.Controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.green.biz.social.Kakao_login_api;
import com.green.biz.social.Naver_loginBO;

@Controller
public class SocialController {

	
	private Naver_loginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private Kakao_login_api kakao;
	
	@Autowired
	private void setNaverLoginBO(Naver_loginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}
	
	/*
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/social_login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
	// 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 
	String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
	//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
	System.out.println("네이버:" + naverAuthUrl);
	//네이버
	model.addAttribute("naver_url", naverAuthUrl);
	return "login_social/social_login";
	}
	*/
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	System.out.println("여기는 " + apiResult);
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	System.out.println("여기는" + jsonObj);
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("name");
	String phone = (String)response_obj.get("mobile");
	String gender = (String)response_obj.get("gender");
	System.out.println(nickname);
	//4.파싱 닉네임 세션으로 저장
	session.setAttribute("sessionId",nickname); //세션 생성
	session.setAttribute("sessionPhone",phone); //세션 생성
	session.setAttribute("sessionGender",gender); //세션 생성
	model.addAttribute("result", apiResult);
	return "redirect:main_form";
	}
	
	
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session)throws IOException {
	System.out.println("여기는 logout");
	session.invalidate();
	return "redirect:main_form";
	}
	
	//카카오 로그인
	@RequestMapping(value="social_login_kakao")
	public String kakao_login(@RequestParam(value="code", required = false) String code,
								HttpSession session) {
		System.out.println(code);
		String access_Token = kakao.getAccessToken(code);
		
		System.out.println("controller access_token : " + access_Token);
		
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
		
	    if (userInfo.get("nickname") != null) {
	        session.setAttribute("sessionId_kakao", userInfo.get("nickname"));
	        session.setAttribute("sessionId_kakao_mail", userInfo.get("has_email"));
	        session.setAttribute("sessionId_kakao_birthday", userInfo.get("has_birthday"));
	        session.setAttribute("sessionId_kakao_gender", userInfo.get("has_gender"));
	        session.setAttribute("access_Token", access_Token);
	    }
	    
	    System.out.println("닉네임 : " + userInfo.get("nickname"));
	    System.out.println("session 값 : " + session);
	    
		return "redirect:main_form";
	}
	
	//카카오 로그아웃
	@RequestMapping(value="logout_kakao")
	public String logout_kakao(HttpSession session, HttpServletRequest request) {
		//세션에 담긴값 초기화
		session.invalidate();
		
		return "redirect:main_form";
	}

}
