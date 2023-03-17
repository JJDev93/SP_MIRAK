package kr.co.mirak.member.login.google;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class SnsLoginServiceImpl implements SnsLoginService {

	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private GoogleOAuthConfigUtils googleUtils;
	
	public SnsLoginServiceImpl() {}
	
	public SnsLoginServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	/**
	 * GOOGLE AccessToken 처리
	 */
	@Override
	public HashMap<String, String> getGoogleAccessToken(String authorize_code) {
		HashMap<String, String> token = new HashMap<String, String>();
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://www.googleapis.com/oauth2/v4/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			//POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        
	        //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	        StringBuilder sb = new StringBuilder();
	        sb.append("grant_type=authorization_code");
	        sb.append("&client_id=" + googleUtils.getGoogleClientId());
	        sb.append("&client_secret=" + googleUtils.getGoogleSecret());
	        sb.append("&redirect_uri=http://localhost:8080/login/google/auth");
	        sb.append("&code="+authorize_code);
	        sb.append("&approval_prompt=force");
	        bw.write(sb.toString());
	        bw.flush();
	        
	        System.out.println("url : " + url);
	        System.out.println("sb : " + sb);
	        
	        //결과 코드가 200이라면 성공
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        if(responseCode==200){
	        	//요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            
	            //Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
				
				token.put("access_token", access_Token);
				token.put("refresh_token", refresh_Token);
				
	            br.close();
	            bw.close();
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return token;
	}

	@Override
	public HashMap<String, Object> getGoogleUserInfo(String access_Token) {
		HashMap<String, Object> googleUserInfo = new HashMap<String, Object>();
		String reqURL = "https://www.googleapis.com/userinfo/v2/me?access_token="+access_Token;
		try {
			URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
	        
	        //요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : "+responseCode);
	        
	        if(responseCode == 200){
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String line = "";
		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
				System.out.println("response body : " + result);
				
		        JsonParser parser = new JsonParser();
		        JsonElement element = parser.parse(result);
		        
		        String name = element.getAsJsonObject().get("name").getAsString();
		        String email = element.getAsJsonObject().get("email").getAsString();
		        String id = "GOOGLE_"+element.getAsJsonObject().get("id").getAsString();
		        
		        googleUserInfo.put("name", name);
		        googleUserInfo.put("email", email);
		        googleUserInfo.put("id", id);
		        
		        System.out.println("login Controller : " + googleUserInfo);
	        }
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		return googleUserInfo;
	}
}
