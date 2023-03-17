package kr.co.mirak.member.login.google;

import java.util.HashMap;

public interface SnsLoginService {
	HashMap<String, String> getGoogleAccessToken(String authorize_code);
	HashMap<String, Object> getGoogleUserInfo(String access_Token);
}
