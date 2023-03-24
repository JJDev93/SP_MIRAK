package kr.co.mirak.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.mirak.member.MemberService;
import kr.co.mirak.member.MemberVO;
import kr.co.mirak.member.login.google.GoogleOAuthConfigUtils;
import kr.co.mirak.member.login.google.SnsLoginService;

@Controller
public class LoginController {
   final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
   final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
   final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";

   @Autowired
   private MemberService memberService;
   @Autowired
   private BCryptPasswordEncoder pwEncoder;
   @Autowired
   private GoogleOAuthConfigUtils googleUtils;
   @Autowired
   private SnsLoginService snslogin;

   private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

   // 로그인페이지
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String loginView(Model model, HttpSession session) {
      System.out.println("=== 로그인 화면으로 이동 중 ===");
      String googleUrl = googleUtils.googleInitUrl();
//      System.out.println("googleUrl : " + googleUrl);
      model.addAttribute("googleUrl", googleUrl);
      
      String preUrl = (String) session.getAttribute("pre_url");
      System.out.println("preUrl : " + preUrl);
      
      return "member/login";
   }

   // 로그인
   @RequestMapping(value = "/login", method = RequestMethod.POST)
   public String login(MemberVO memberVO, Model model, HttpServletRequest request, RedirectAttributes rttr)
         throws Exception {

      System.out.println("login 메서드 진입");
      System.out.println("전달된 데이터 : " + "[" + memberVO.getMem_id() + " , " + memberVO.getMem_pw() + "]");

      /* 암호화부분 */

      HttpSession session = request.getSession();

      String rawPw = "";
      String encodePw = "";

      MemberVO lvo = memberService.login(memberVO); // 제출한아이디와 일치하는 아이디있는지

      if (lvo != null) { // 일치하는 아이디 존재시

         rawPw = memberVO.getMem_pw(); // 사용자가 제출한 비번
         encodePw = lvo.getMem_pw(); // db에 저장한 인코딩된 비번

         System.out.println("제출한비번:" + rawPw);
         System.out.println("인코딩된비번:" + lvo.getMem_pw());

         String mem_id;

         if (true == pwEncoder.matches(rawPw, encodePw)) { // 비번 일치 여부 판단
            // logger.info("일로오나");
            memberVO.setMem_pw(""); // 인코딩된 비번 정보 지움
            mem_id = memberVO.getMem_id();

            session.setAttribute("mem_id", mem_id); // 세션에 사용자정보 저장
            logger.info("로그인 성공");

            String preUrl = (String) session.getAttribute("pre_url");
            String returnURL = "";
            System.out.println("preUrl : " + preUrl);
            if (preUrl != null) {
               System.out.println("이전 페이지로 이동");
               returnURL = "redirect:" + preUrl;
               session.removeAttribute("pre_url");
            } else {
               System.out.println("메인으로 이동");
               returnURL = "redirect:/";
            }
            return returnURL;

         } else { // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)

            rttr.addFlashAttribute("result", 0);
            logger.info("일치하는 아이디가 없습니다");
            return "member/login"; // 로그인 페이지로 이동
         }
      } else { // 일치하는 아이디가 존재하지 않을시 (로그인 실패)

         rttr.addFlashAttribute("result", 0);
         rttr.addFlashAttribute("message", "일치하는 아이디가 없습니다.");
         logger.info("로그인 실패");
         return "member/login"; // 로그인페이지로 이동
      }

   }

   // 로그아웃
   @RequestMapping("/logout")
   public String logout(HttpSession session) throws Exception {
      String mem_id = (String) session.getAttribute("mem_id");
      String access_Token = (String) session.getAttribute("access_Token");
      MemberVO member = memberService.getMemberDetail(mem_id);
      String user_api = member.getMem_isapi();
      System.out.println("user_api : " + user_api);

      if (access_Token != null) {
         if (user_api.equals("google")) {
            int result = snslogin.googleLogout(access_Token);
            System.out.println("구글로그아웃 : " + result);
         } else if (user_api.equals("kakao")) {
            System.out.println("unlink :" + user_api);
            session.invalidate();
            return "redirect:/kakaounlink";
         }
         System.out.println(user_api + "로그아웃 성공!!");
      }else if(user_api == null) {
    	  
      }else if(user_api.equals("naver")) {
         System.out.println("unlink :" + user_api);
         return "redirect:/kakaounlink";
      }
      System.out.println("access_Token is null");
      session.invalidate();
      return "redirect:/";
   }

   // 연결끊기
   @RequestMapping(value = "/kakaounlink")
   public String unlink(HttpSession session) {
      memberService.unlink((String) session.getAttribute("access_Token"));
      session.invalidate();
      return "redirect:/";
   }

   // 아이디찾기
   @RequestMapping(value = "/idfind", method = RequestMethod.GET)
   public String idfindform(HttpSession session) {
      System.out.println("아이디 찾기 이동..");
      
      String preUrl = (String) session.getAttribute("pre_url");
      System.out.println("preUrl : " + preUrl);
      
      if (preUrl != null) {
         session.removeAttribute("pre_url");
      }
      return "member/idfind";
   }

   // 아이디 찾기
   @RequestMapping(value = "/idfind", method = RequestMethod.POST)
   public String idfind(MemberVO vo, HttpSession session, Model model) {
      String returnURL = "member/idfind";
      String preUrl = (String) session.getAttribute("pre_url");
      System.out.println("아이디찾기중... , preUrl : " + preUrl);

      try {
         MemberVO member = memberService.idfind(vo);
         model.addAttribute("member", member);
         System.out.println(member);

         if (member.getMem_id() != null) {
            model.addAttribute("mem_id", member.getMem_id());
            System.out.println(member.getMem_id());
            if (preUrl != null) {
               System.out.println("이전 페이지로 이동");
               returnURL = "member/idfind" + preUrl;
               session.removeAttribute("pre_url");
            } else {
               returnURL = "member/idfind";
            }
         }
      } catch (Exception e) {
         returnURL = "member/idfind";
         model.addAttribute("message", "정보를 다시 입력해주세요....");
      }
      return returnURL;
   }

   // 비번재설정
   @RequestMapping(value = "/pwreset", method = RequestMethod.GET)
   public String pwresetform() {
      System.out.println("비번 재설정 이동..");
      return "member/pwreset";
   }

   // 비번재설정
   @RequestMapping(value = "/pwreset", method = RequestMethod.POST)
   public String pwreset(MemberVO vo, Model model, RedirectAttributes rttr) {
      System.out.println("비밀번호 재설정중....");
      System.out.println(vo);

      try {
         if (vo.getMem_id() == null) {
            memberService.idfind_pw(vo).getMem_id();
         }
         if (vo.getMem_id() != null && vo.getMem_pw() != null) {
            // 암호화 1

            String rawPw = ""; // 인코딩 전 비밀번호
            String encodePw = ""; // 인코딩 후 비밀번호

            rawPw = vo.getMem_pw(); // 비밀번호 데이터 얻음
            encodePw = pwEncoder.encode(rawPw); // 비밀번호 인코딩
            vo.setMem_pw(encodePw); // 인코딩된 비밀번호 vo객체에 다시 저장

            memberService.pwreset(vo);
            rttr.addFlashAttribute("message", "비밀번호가 변경되었습니다.");
            return "redirect:/";
         }
         model.addAttribute("mem_id", vo.getMem_id());
         return "member/pwreset";
      } catch (Exception e) {
         e.printStackTrace();
         model.addAttribute("message", "정보를 다시 입력해주세요....");
      }
      return "member/pwreset";
   }
}