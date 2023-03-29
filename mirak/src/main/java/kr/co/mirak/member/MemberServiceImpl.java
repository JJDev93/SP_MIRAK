
package kr.co.mirak.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class MemberServiceImpl implements MemberService {

	
   private SqlSessionTemplate sqlSessionTemplate;

   public MemberServiceImpl() {
   }

   public MemberServiceImpl(SqlSessionTemplate sqlSessionTemplate) {
      this.sqlSessionTemplate = sqlSessionTemplate;
   }

   // 로그인
   public MemberVO login(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.login(vo);
      return memVO;
   }

   // 아이디 찾기
   public MemberVO idfind(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.idfind(vo);
      return memVO;
   }

   // 아이디 찾기(비번 리셋용)
   public MemberVO idfind_pw(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.idfind(vo);
      return memVO;
   }

   // 비번 리셋
   public int pwreset(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int success = mapper.pwreset(vo);
      return success;
   }

   // 회원가입
   @Override
   public int createUser(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int success = mapper.createUser(vo);
      return success;
   }

   @Override
   public int naverinsert(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int success = mapper.naverinsert(vo);
      return success;
   }

   // 세션 값으로 회원 정보 확인
   public MemberVO getMemberInfo(HttpSession session) {
      String myid = (String) session.getAttribute("mem_id");
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.getMemberInfo(myid);
      return memVO;
   }

   public int memupdate(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int updatesuccess = mapper.memupdate(vo);
      return updatesuccess;
   }

   @Override
   public int memdelete(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int seccess = mapper.memdelete(vo);
      return seccess;
   }

   // 아이디체크
   @Override
   public int idCheck(String id) throws Exception {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int result = mapper.idCheck(id);
      return result;
   }
   

   // kakao

   @Override
   public String getAccessToken(String code) {
      String access_Token = "";
      String refresh_Token = "";
      String reqURL = "https://kauth.kakao.com/oauth/token";

      try {
         URL url = new URL(reqURL);

         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         // POST 요청을 위해 기본값이 false인 setDoOutput을 true로

         conn.setRequestMethod("POST");
         conn.setDoOutput(true);
         // POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

         BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
         StringBuilder sb = new StringBuilder();
         sb.append("grant_type=authorization_code");

         sb.append("&client_id=e481c91b1136f51f927a619fc062146d"); // 본인이 발급받은 key
         sb.append("&redirect_uri=http://mirak.shop/kakaoLogin"); // 본인이 설정한 주소

         sb.append("&code=" + code);
         bw.write(sb.toString());
         bw.flush();

         // 결과 코드가 200이라면 성공
         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);

         // 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
         String line = "";
         String result = "";

         while ((line = br.readLine()) != null) {
            result += line;
         }
         System.out.println("response body : " + result);

         // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);

         access_Token = element.getAsJsonObject().get("access_token").getAsString();
         refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

         System.out.println("access_token : " + access_Token);
         System.out.println("refresh_token : " + refresh_Token);

         br.close();
         bw.close();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return access_Token;
   }

   @Override
   public HashMap<String, Object> getUserInfo(String access_Token) {
      
      // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
      HashMap<String, Object> userInfo = new HashMap<>();
      String reqURL = "https://kapi.kakao.com/v2/user/me";
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");

         // 요청에 필요한 Header에 포함될 내용
         conn.setRequestProperty("Authorization", "Bearer " + access_Token);

         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);

         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

         String line = "";
         String result = "";

         while ((line = br.readLine()) != null) {
            result += line;
         }
         System.out.println("response body : " + result);

         JsonParser parser = new JsonParser();
         JsonElement element = parser.parse(result);

         JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
         JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

         String nickname = properties.getAsJsonObject().get("nickname").getAsString();
         String email = kakao_account.getAsJsonObject().get("email").getAsString();
         String id = element.getAsJsonObject().get("id").getAsString();

         userInfo.put("id", id);
         userInfo.put("nickname", nickname);
         userInfo.put("email", email);

      } catch (IOException e) {
         e.printStackTrace();
      }
      return userInfo;
   }

   
   //카카오 로그아웃
   public void kakaoLogout(String access_Token) {
      String reqURL = "https://kapi.kakao.com/v1/user/logout";
      try {
         URL url = new URL(reqURL);
         HttpURLConnection conn = (HttpURLConnection) url.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Authorization", "Bearer " + access_Token );
         

         int responseCode = conn.getResponseCode();
         System.out.println("responseCode : " + responseCode);
         BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

         String result = "";
         String line = "";

         while ((line = br.readLine()) != null) {
            result += line;
         }
         System.out.println(result);
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   //연결해제
   @Override
   public void unlink(String access_Token) {
      String reqURL = "https://kapi.kakao.com/v1/user/unlink";
      String naverURL = "https://nid.naver.com/nidlogin.logout";
      
       try {
          if(access_Token != null) {
           URL url = new URL(reqURL);
           System.out.println(url);
           HttpURLConnection conn = (HttpURLConnection) url.openConnection();
           conn.setRequestMethod("POST");
           conn.setRequestProperty("Authorization", "Bearer " + access_Token);
           
           int responseCode = conn.getResponseCode();
           System.out.println("responseCode : " + responseCode);
           
           BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
           
           String result = "";
           String line = "";
           
           while ((line = br.readLine()) != null) {
               result += line;
           }
           System.out.println(result);
          }
          
       } catch (IOException e) {
           e.printStackTrace();
       }
   }

   // ADMIN ID값으로 회원 정보 확인
   public MemberVO getMemberDetail(String memId) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.getMemberInfo(memId);
      return memVO;
   }

   // 김원중이 건드린 부분

   public int getTotal(CriteriaM cri) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      return mapper.getTotal(cri);
   }

   public List<MemberVO> getListPaging(CriteriaM cri) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      return mapper.getListPaging(cri);
   }

   public MemberVO adminMemberDetail(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      MemberVO memVO = mapper.adminMemberDetail(vo);
      memVO.toString();
      return memVO;
   }
   
   public int adminMemberDel(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int result = mapper.adminMemberDel(vo);
      return result;
   }

   public int adminMemberUpdate(MemberVO vo) {
      MemberMapper mapper = sqlSessionTemplate.getMapper(MemberMapper.class);
      int updatesuccess = mapper.adminMemberUpdate(vo);
      return updatesuccess;
   }




}