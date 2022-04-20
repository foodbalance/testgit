package com.project.cat.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.cat.common.Paging;
import com.project.cat.member.model.service.MemberService;
import com.project.cat.member.model.vo.Member;


@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	private String reId = "";
	private String rePwd = "";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginPage.do")
	public String moveLoginPage(Model model) {
		model.addAttribute("reid", reId);
		model.addAttribute("repwd", rePwd);
		
		return "member/login";
	}
	
	@RequestMapping("registerPage.do")
	public String moveEnrollPage() {
		return "member/register";
	}
	
	//로그인
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginMethod(HttpServletRequest request, Member member, HttpSession session, SessionStatus status, Model model) {	
		//DB 레코드 불러오기
		Member loginMember = memberService.selectLogin(request.getParameter("inputID"));
				
		String id = request.getParameter("inputID");
		String pwd = request.getParameter("inputPassword");
		String remember = request.getParameter("inputRemember");
		String viewName = null;
		
		if(remember == null) {
			remember = "";
		}
		
		if(remember.equals("Remember")) {
			reId = id;
			rePwd = pwd;
		}else{
			reId = "";
			rePwd = "";
		}
		
		
		System.out.println("아이디 : "+id);
		System.out.println("비밀번호 : "+pwd);

		try {
			//로그인 성공
			//로그인 성공 암호화
			if(loginMember != null && bcryptPasswordEncoder.matches(pwd, loginMember.getUser_pwd()) && loginMember.getLogin_ok().equals("Y")) {
				//로그인 제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
				
				session.setAttribute("loginMember", loginMember);
				status.setComplete();
				
				System.out.println("생년월일 : "+loginMember.getUser_birth());
				
				viewName = "common/main";
			}
			//로그인 성공 비암호화 (로그인 하면 비밀번호 암호화로 변경 시켜놓게 해놓음)
//			if(loginMember != null && loginMember.getUser_pwd().equals(pwd) && loginMember.getLogin_ok().equals("Y")) {
//				//패스워드 암호화 처리(주석으로 조절)
//				loginMember.setUser_pwd(bcryptPasswordEncoder.encode(loginMember.getUser_pwd()));
//			    memberService.updatePwdEncoding(loginMember);
//				//로그인 제한 스택 초기화
//			    loginMember.setLogin_stack(0);
//				memberService.updateLoginStack(loginMember);
//
//				session.setAttribute("loginMember", loginMember);
//				viewName = "common/main";
//			}

			//비밀번호 입력 실패 로그인 제한
			else if(loginMember.getLogin_stack() >= 5 ) {
				//제한 스택 초기화
				loginMember.setLogin_stack(0);
				memberService.updateLoginStack(loginMember);
				//로그인 제한 부여
				loginMember.setLogin_ok("N");
				memberService.updateLoginOk(loginMember);
				
				model.addAttribute("message2", "로그인이 제한된 유저다냥");
				model.addAttribute("message3", "관리자 이메일로 문의 해라냥~!");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 제한자 로그인 시도시
			else if(loginMember.getLogin_ok().equals("N")) {
				model.addAttribute("message2", "로그인이 제한된 유저다냥");
				model.addAttribute("message3", "관리자 이메일로 문의 해라냥~!");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
			//로그인 실패
			else {
				//제한 스택 부여
				System.out.println("로그인 아이디: "+loginMember.getUser_id());
				System.out.println("로그인 스택: "+loginMember.getLogin_stack());
				loginMember.setLogin_stack(loginMember.getLogin_stack()+1);
				memberService.updateLoginStack(loginMember);
	
				model.addAttribute("message", "비밀번호가 일치하지 않는다냥~!");
				model.addAttribute("reid", id);
				model.addAttribute("repwd", pwd);
				viewName = "member/login";
			}
		}catch(Exception e){
			model.addAttribute("message", "등록되지 않은 아이디다냥~!");
			model.addAttribute("reid", id);
			model.addAttribute("repwd", pwd);
			viewName = "member/login";
		}
		
		return viewName;
	}
	
	//로그아웃 처리용
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, 
			Model model) {
		//로그인할 때 생성한 세션객체를 없앰
		HttpSession session = request.getSession(false);
		//세션 객체가 있으면, 리턴받음
		//세션 객체가 없으면, null 리턴됨
		if(session != null) {
			session.invalidate();  //해당 세션객체 없앰
			return "common/main";
		}else {
			model.addAttribute("sessionout", "로그인 세션이 만료됐다냥~!");
			return "common/commonview";
		}
	}
	
// 회원 가입 처리용
	@RequestMapping(value = "enroll.do", method = RequestMethod.POST)
	public String memberInsertMethod( HttpServletRequest request, Member member, Model model) {
		// 메소드 매개변수에 vo 에 대한 객체를 작성하면,
		// 뷰 from 태그 input 의 name 과 vo 의 필드명이 같으면
		// 자동 값이 꺼내져서 객체에 옮겨 기록 저장됨.
		// 커맨드 객체(command object)라고 함

		logger.info("enroll.do : " + member);
	      
	    String address = request.getParameter("postcode") + " "+ request.getParameter("address1") + " " + request.getParameter("address2");

	    //주소 합치기
	    member.setAddress(address);
	    //패스워드 암호화 처리
	    member.setUser_pwd(bcryptPasswordEncoder.encode(member.getUser_pwd()));

//	    System.out.println("회원 생년월일 : "+member.getUser_birth());
//	    System.out.println("회원 ID : "+member.getUser_id());
//	    System.out.println("주소 : " + address);
	    if (memberService.insertMember(member) > 0) {
	    	model.addAttribute("register", "회원 가입을 축하한다냥!");
	    	return "common/commonview";
	    } else {
	    	model.addAttribute("message", "회원 가입 실패!");
	    	return "common/register";
	    }
	}
	   
	//아이디 중복 확인 체크 ajax 통신 요청 처리용 
	//ajax 통신은 뷸리졸버로 뷰파일을 리턴하면 안됨 (뷰페이지가 바뀜)
	//요청한 클라이언트와 출력스트림을 만들어서 통신하는 방식으로 값을 리턴함
	@RequestMapping(value = "idchk.do", method = RequestMethod.POST)
	public void dupIdCheckMethod(@RequestParam("user_id") String user_id, HttpServletResponse response) throws IOException {

		int idcount = memberService.selectDupCheckId(user_id);
	      
	    String returnValue = null;
	    if(idcount == 0) {
	    	returnValue = "ok";
	    }else {
	        returnValue = "dup";
	    }
	      
	    //response를 이용해서 클라이언트로 출력스트림 만들고 값 보내기
	    response.setContentType("text/html; charset=utf-8");
	    PrintWriter out = response.getWriter();
	    out.append(returnValue);
	    out.flush();
	    out.close();
	}
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping("findPwdPage.do")
	public String moveFindPwdMethod() {
		return "member/find_pw";
	}
	
	//비밀번호 찾기 
	@RequestMapping(value = "findPwd.do", method = RequestMethod.POST)
	public String findPwdMethod(@RequestParam("user_id") String user_id, @RequestParam("keyword") String keyword, 
			@RequestParam("user_name") String user_name, @RequestParam("user_birth") java.sql.Date user_birth,
			@RequestParam("user_pwd") String user_pwd, Model model) {
		String value = null;
		Member member = memberService.selectMember(user_id);
		System.out.println(member);
		try {
			if(member == null) {
				model.addAttribute("message", "존재하지 않는 아이디입니다.");
				value = "common/findPwdError";
			}else if(member != null && member.getUser_name().equals(user_name) == false) {
				model.addAttribute("message", "잘못된 이름을 입력하셨습니다.");
				value = "common/findPwdError";
			}else if(member != null && member.getUser_name().equals(user_name) && member.getUser_birth().equals(user_birth) == false) {
				model.addAttribute("message", "올바른 생년월일을 입력해주세요.");
				value = "common/findPwdError";
			}else if(member != null && member.getUser_name().equals(user_name) && member.getUser_birth().equals(user_birth) && member.getKeyword().equals(keyword) == false) {
				model.addAttribute("message", "키워드가 틀렸습니다.");
				value = "common/findPwdError";
			}else if(member != null && member.getUser_name().equals(user_name) && member.getUser_birth().equals(user_birth) && member.getKeyword().equals(keyword)) {
				//로그인 제한 스택 초기화
				member.setLogin_stack(0);
				memberService.updateLoginStack(member);
				//비밀번호 변경
				System.out.println(user_pwd);
				member.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
				//업데이트
				memberService.updatePwdEncoding(member);
				model.addAttribute("message", "비밀번호 변경 성공!");
				
				return "common/findPwdSuccess";
			}
		}catch(Exception e){
			model.addAttribute("message", "비밀 번호 찾기 실패 관리자에게 문의하세요");
			return "common/commonview";
		}
//		try {
//			if(member != null && member.getUser_name().equals(user_name) && member.getUser_birth().equals(user_birth) && member.getKeyword().equals(keyword) ) {
//				member.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
//				System.out.println("변경된 패스워드 : " + member.getUser_pwd());
//				if(memberService.findPwd(member) > 0) 
//					model.addAttribute("message", "비밀번호 변경 성공!!");
//					value = "common/commonview";			
//				}else if(member == null) {
//					model.addAttribute("message", "존재하지 않는 아이디 입니다");
//					value = "common/commonview";
//				}else if(!member.getUser_birth().equals(user_birth)) {
//					model.addAttribute("message", "생년월일이 틀렸습니다.");
//					value = "common/commonview";
//				}else if(!member.getKeyword().equals(keyword)) {
//					model.addAttribute("message", "키워드가 틀렸습니다.");
//					value = "common/commonview";
//				}else {
//					model.addAttribute("message", "비밀번호 찾기 실패");
//					value = "common/commonview";
//				}		
//		}catch(Exception e){
//			e.printStackTrace();
//		}
		return value;
	}
	//마이페이지 이동 처리
	@RequestMapping("myinfo.do")
    public ModelAndView myInfoMethod(@RequestParam("user_id") String user_id, ModelAndView mv) {
       Member member = memberService.selectMember(user_id);

       if (member != null) { // 조회가 성공했다면
          mv.addObject("member", member);          
          mv.setViewName("member/myInfoPage");
       } else { // 조회가 실패했다면
          mv.addObject("message", user_id + " : 회원 정보 조회 실패");
          mv.setViewName("common/commoview");
       }
       return mv;
    }
	
//	//마이페이지 내정보 업데이트
	@RequestMapping(value="mupdate.do", method=RequestMethod.POST)
	public String memberUpdateMethod(HttpServletRequest request, Member member, Model model, @RequestParam("origin_userpwd") String originUserpwd) {
		String address = request.getParameter("postcode") + " "+ request.getParameter("address1") + " " + request.getParameter("address2");
		
	    //새로운 암호가 전송이 왔다면
		String user_pwd = member.getUser_pwd().trim();
		
		if(user_pwd != null && user_pwd.length() > 0) {
			if(!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
				// 멤버에 새로운 암호를 저장 :암호화 처리
				member.setUser_pwd(bcryptPasswordEncoder.encode(user_pwd));
			}
		}else {
			//새로운 암호가 없다면
			member.setUser_pwd(originUserpwd);
		}
		
		//주소 합치기
	    member.setAddress(address);
	    
		if(memberService.updateMember(member) > 0) {
			//수정 성공했다면
			//비밀번호 인코딩
			memberService.updatePwdEncoding(member);
			model.addAttribute("message", member.getUser_id() + "회원 정보 변경 성공");
			return "common/commonview" ;
		}else {
			model.addAttribute("message", "회원 정보 수정 실패");
			return "common/commonview";
		}
	}
	
	//회원탈퇴 팝업 페이지로 이동
	@RequestMapping("delPopup.do")
	public String moveDelPop() {
		return "member/delPopup";
	}
	
	//회원탈퇴 처리용
	@RequestMapping(value="mdelete.do")
	public String memberDeleteMethod(Member member, HttpSession session, RedirectAttributes ra,@RequestParam("user_id") String user_id, @RequestParam("user_pwd") String user_pwd, @RequestParam("keyword") String keyword, Model model) {
		String value = null;
		try {
			System.out.println(user_id);
			member = memberService.selectMember(user_id);
			System.out.println(member.getUser_id());
			String originUserpwd = member.getUser_pwd().trim();
			
		
			try {
				if(!bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
					ra.addFlashAttribute("result", "pwdError");
					value = "redirect:delPopup.do";
				}else if(bcryptPasswordEncoder.matches(user_pwd, originUserpwd) && member.getKeyword().equals(keyword) == false) {
					ra.addFlashAttribute("result", "keyError");
					value= "redirect:delPopup.do";
				}else if(bcryptPasswordEncoder.matches(user_pwd, originUserpwd) && member.getKeyword().equals(keyword)) {
					memberService.deleteMember(user_id);
					session.invalidate();
					ra.addFlashAttribute("result", "delOk");
					value= "redirect:delPopup.do";
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}catch(NullPointerException e) {
			ra.addFlashAttribute("result", "idError");
			value = "redirect:delPopup.do";
		}
		return value;
			
		
//		if(bcryptPasswordEncoder.matches(user_pwd, originUserpwd)) {
//			memberService.deleteMember(user_id);
//			ra.addFlashAttribute("result", "delOk");
//			return "redirect:delPopup.do";
//		}else {
////			model.addAttribute("result", "removeFalse");
//			ra.addFlashAttribute("result", "delFalse");
//			return "redirect:delPopup.do";
//		}
		
	}
	
	//관리자 회원관리 기능 처리용
//	@RequestMapping("mlist.do")
//	public String memberListViewMethod(Model model) {
//		ArrayList<Member> list = memberService.selectList();
//		
//		if(list.size() > 0) {
//			model.addAttribute("list", list);
//			return "member/manage";
//		}else {
//			model.addAttribute("message", "회원 목록이 존재하지 않습니다.");
//			return "common/error";
//		}
//	}
	
	//회원관리 페이지
	@RequestMapping("mlist.do")
	public ModelAndView memberListViewMethod(@RequestParam(name="page", required=false) String page, ModelAndView mv ) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		System.out.println(page);
		//페이징 계산처리 
		int limit = 5; //한페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = memberService.selectListCount();
		System.out.println("멤버 수 : " + listCount);
		//페이지 수 계산
		//주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개 필요함)
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
		int startPage = (int)((double)currentPage / 10 + 0.9);
		//현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + 5 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//쿼리문에 전달할 현재페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		Paging paging = new Paging(startRow, endRow);
		System.out.println("페이징 : " + paging);
		//서비스 메소드 실행하고 결과 받기
		ArrayList<Member> list = memberService.selectList(paging);
		System.out.println("리스트 :" + list.size());
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);

			
			mv.setViewName("member/usermanage");
			
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패.");
			mv.setViewName("common/commonview");
		}
		
		return mv;
	}
	
	//로그인 제한/가능 변경 처리용
    @RequestMapping("loginok.do")
    public String changeLoginOKMethod(Member member, Model model) {
    	logger.info("loginok.do : " + member.getUser_id() + ", " + member.getLogin_ok());
    	System.out.println(member.getUser_id());
	   
	    if(memberService.updateLoginOk(member) > 0) {
		   return "redirect:mlist.do";
	    }else {
		   model.addAttribute("meassge", "로그인 제한/허용 처리 오류 발생!");
		   return "common/commonview";
	    }
    }
    
  //회원 검색 기능 처리용
//    @RequestMapping(value="msearch.do", method = RequestMethod.POST)
//    public String memberSearchMethod(HttpServletRequest request, Model model) {
// 	     String action = request.getParameter("action");
// 	     String keyword = null;
// 	     keyword = request.getParameter("keyword");
// 	     
//
// 	   //서비스 메소드 리턴값 받을 리스트 준비
// 	     ArrayList<Member> list = null;
// 	   
// 	     switch(action) {
// 	     case"user_id":	list = memberService.selectSearchUserid(keyword);
// 	   				break;
// 	     case"loginok":	list = memberService.selectSearchLoginOk(keyword);
// 	   				break;
// 	     }
// 	   
// 	     if(list.size() > 0) {
// 		     model.addAttribute("list", list);
// 		     return "member/usermanage";
// 	     }else {
// 		     model.addAttribute("message", action + " 검색에 대한" + keyword + " 결과가 존재하지 않습니다.");
// 		     return "common/commonview";
//
// 	     }
//    }
    
    
    
    //아이디로 검색해서 조회 및 페이징 처리
    @RequestMapping(value = "msearch.do")
    public ModelAndView memberSearchMethod(@RequestParam(name ="keyword") String keyword, @RequestParam(name="page", required=false) String page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징 계산처리 -- 별도의 클래스로 작성해서 사용해도 됨 --------------------
		int limit = 5; //한 페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = memberService.searchListCount(keyword);
		System.out.println("리스트 카운트 : " + listCount);
		//페이지 수 계산
		//주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개 필요함)
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
		int startPage = (int)((double)currentPage / 10 + 0.9);
		//현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		
		//쿼리문에 전달할 현재페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		Paging paging = new Paging(startRow, endRow, keyword);
		//별도의 클래스 작성 끝 -----------------------------------------------
		System.out.println(paging);
		//서비스 메소드 실행하고 결과받기
		ArrayList<Member> list = memberService.searchId(paging);
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("action", "msearch");
			mv.addObject("keyword", keyword);
			
			mv.setViewName("member/usermanage");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		
		return mv;
    }
    
    //로그인 가능/제한으로 회원 조회 및 페이징 처리
    @RequestMapping(value = "loginsearch.do")
    public ModelAndView loginSearchMethod(@RequestParam(name ="keyword") String keyword, @RequestParam(name="page", required=false) String page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//페이징 계산처리 -- 별도의 클래스로 작성해서 사용해도 됨 --------------------
		int limit = 5; //한 페이지에 출력할 목록 갯수
		//페이지 수 계산을 위해 총 목록갯수 조회
		int listCount = memberService.searchOkListCount(keyword);
		System.out.println("리스트 카운트 : " + listCount);
		//페이지 수 계산
		//주의 : 목록이 11개이면, 페이지 수는 2가 됨 (나머지 목록 1개도 출력페이지가 1개 필요함)
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재페이지가 포함된 페이지 그룹의 시작값 지정 (뷰 아래쪽에 표시할 페이지 수를 10개씩 한 경우)
		int startPage = (int)((double)currentPage / 10 + 0.9);
		//현재 페이지가 포함된 페이지 그룹의 끝값
		int endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}

		
		//쿼리문에 전달할 현재페이지에 출력할 목록의 첫행과 끝행 객체 처리
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
		Paging paging = new Paging(startRow, endRow, keyword);
		//별도의 클래스 작성 끝 -----------------------------------------------
		System.out.println(paging);
		System.out.println(keyword);
		//서비스 메소드 실행하고 결과받기
		ArrayList<Member> list = memberService.selectSearchLoginOk(paging);
		
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("listCount", listCount);
			mv.addObject("maxPage", maxPage);
			mv.addObject("currentPage", currentPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("limit", limit);
			mv.addObject("action", "loginsearch");
			mv.addObject("keyword", keyword);
			
			mv.setViewName("member/usermanage");
		}else {
			mv.addObject("message", currentPage + "페이지 목록 조회 실패");
			mv.setViewName("common/commonview");
		}
		
		return mv;
    }
    
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	}
