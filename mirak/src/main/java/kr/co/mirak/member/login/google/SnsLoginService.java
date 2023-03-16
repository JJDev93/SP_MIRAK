package kr.co.mirak.member.login.google;

import java.util.HashMap;

public interface SnsLoginService {
	String getGoogleAccessToken(String authorize_code);
	HashMap<String, Object> getGoogleUserInfo(String access_Token);
}
