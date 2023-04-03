package kr.co.mirak.member.login.naver;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.DefaultOAuth2RefreshToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;

@Service
public class NaverLoginServiceImpl implements NaverLoginService {

	@Autowired
	MemberService memberService;

	private String clientId = "W_XBZ8KSSrZT5ts3cW9K";
	private String clientSecret = "w7bUjL_Agk";
	private String callbackUrl = "https://www.mirak.shop/naverCallback";
	private String refreshToken = "";

	public NaverLoginServiceImpl() {
	}

	@Override
	public String getAuthorizationUrl(String state) throws Exception {

		String redirectURI = URLEncoder.encode(callbackUrl, "UTF-8");
		String naverAuthUrl = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=" + clientId
				+ "&state=" + state + "&redirect_uri=" + redirectURI;
		return naverAuthUrl;
	}

	@Override
	public OAuth2AccessToken getAccessToken(HttpServletRequest request, String code, String state) throws Exception {
		HttpSession session = request.getSession();
		String sessionState = (String) session.getAttribute("state");
		if (!state.equals(sessionState)) {
			throw new Exception("InvalidState");
		}

		String redirectURI = URLEncoder.encode(callbackUrl, "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;

		String response = requestGet(apiURL);
		JsonParser parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) parser.parse(response);

		String accessToken = jsonObj.get("access_token").getAsString();
		refreshToken = jsonObj.get("refresh_token").getAsString();
		String tokenType = jsonObj.get("token_type").getAsString();
		long expiresIn = jsonObj.get("expires_in").getAsLong();

		DefaultOAuth2AccessToken oauthToken = new DefaultOAuth2AccessToken(accessToken);
		oauthToken.setRefreshToken(new DefaultOAuth2RefreshToken(refreshToken));
		oauthToken.setTokenType(tokenType);
		oauthToken.setExpiration(new Date(System.currentTimeMillis() + (expiresIn * 1000L)));

		return oauthToken;
	}

	@Override	
	public String getUserInfo(OAuth2AccessToken oauth, MemberVO member) throws Exception {
		String userInfo = "";
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("Authorization", "Bearer " + oauth.getValue());
			userInfo = get(apiURL, requestHeaders);

			JSONObject jsonObject = new JSONObject(userInfo);
			JSONObject response = jsonObject.getJSONObject("response");
			String mem_id = response.getString("email");
			String mem_isapi = "NAVER";
			int result = memberService.existIdAndIsApi(mem_id, mem_isapi);
			if (result == 0) {
				member.setMem_isapi("NAVER");
				member.setMem_id(mem_id);
				member.setMem_name(response.getString("name"));
				member.setMem_pw(response.getString("id"));
				String mem_gender = response.getString("gender");
				if (mem_gender == "F") {
					member.setMem_gender(1);
				} else {
					member.setMem_gender(2);
				}
				int birth = Integer.parseInt(response.getString("birthyear"));
				member.setMem_age(Calendar.getInstance().get(Calendar.YEAR) - birth + 1);
				member.setMem_phone((response.getString("mobile")).replace("-", ""));
				return "join";
			} else if (result == 1) {
				member.setMem_id(mem_id);
				member.setMem_isapi("NAVER");
				return "login";

			}

		} catch (IOException e) {
			throw new IOException("getUserProfile error: " + e.getMessage());
		}
		return "fail";
	}

	public int naverLogout(String accessToken) throws Exception {
		int result = 0;

		String url = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id={client_id}&client_secret={client_secret}&access_token={access_token}&refresh_token={refresh_token}&service_provider=NAVER";
		url = url.replace("{client_id}", clientId).replace("{client_secret}", clientSecret)
				.replace("{access_token}", accessToken).replace("{refresh_token}", refreshToken);

		URL urlObj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();
		con.setRequestMethod("GET");

		int responseCode = con.getResponseCode();
		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}

		in.close();
		result = 1;
		
		return result;
	}

	private String get(String apiUrl, Map<String, String> requestHeaders) throws IOException {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			} else {
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new IOException("get error: " + e.getMessage());
		} finally {
			con.disconnect();
		}
	}

	private String requestGet(String apiURL) throws IOException {
		URL url = new URL(apiURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");

		BufferedReader br;
		if (conn.getResponseCode() == 200) {
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		String inputLine;
		StringBuilder response = new StringBuilder();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		br.close();

		return response.toString();
	}

	private HttpURLConnection connect(String apiUrl) throws IOException {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new IOException("connect error: " + e.getMessage(), e);
		} catch (IOException e) {
			throw new IOException("connect error: " + e.getMessage(), e);
		}
	}

	private String readBody(InputStream body) throws IOException {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new IOException("readBody error: " + e.getMessage());
		}
	}
}