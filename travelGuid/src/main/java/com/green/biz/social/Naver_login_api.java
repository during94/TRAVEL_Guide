package com.green.biz.social;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class Naver_login_api extends DefaultApi20 {
	
	protected Naver_login_api(){
	}
	private static class InstanceHolder{
			private static final Naver_login_api INSTANCE = new Naver_login_api();
	}
	public static Naver_login_api instance(){
		return InstanceHolder.INSTANCE;
	}
	@Override
	public String getAccessTokenEndpoint() {
		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	}
	@Override
	protected String getAuthorizationBaseUrl() {
		return "https://nid.naver.com/oauth2.0/authorize";
	}

}
