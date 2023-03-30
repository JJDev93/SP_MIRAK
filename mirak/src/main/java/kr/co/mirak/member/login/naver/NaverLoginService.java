package kr.co.mirak.member.login.naver;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.oauth2.common.OAuth2AccessToken;

import kr.co.mirak.member.MemberVO;

public interface NaverLoginService {
	public String getAuthorizationUrl(String state) throws Exception;

	public OAuth2AccessToken getAccessToken(HttpServletRequest request, String code, String state) throws Exception;

	public String getUserInfo(OAuth2AccessToken accesstoken, MemberVO member) throws Exception;

	int naverLogout(String accesstoken) throws Exception;
}