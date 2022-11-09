package com.gongcha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_historyDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.Stadium_matchDTO;
import com.gongcha.service.MatchService;
import com.gongcha.service.MemberService;

import pwdconv.PwdChange;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MatchService matchService;

	@RequestMapping("/member/login")
	public String login() {
		return "/member/login";
	}
	
	@RequestMapping("/member/find_id")
	public String find_id() {
		return "/member/find_id";
	}
	
	@PostMapping("/member/find_id_ok")
	public ModelAndView find_id_ok(String mem_name, String phone02, HttpServletResponse 
			response, MemberDTO e) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		e.setMem_name(mem_name); 
		e.setPhone02(phone02);
		
		MemberDTO bd=this.memberService.find_id(e);
		
		if(bd == null) {
			out.println("<script>");
			out.println("alert('회원 정보를 찾을 수 없습니다!\\n올바른 이름과 휴대폰 번호를 입력해주세요!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			ModelAndView nd = new ModelAndView("/member/find_id_ok");
			
			nd.addObject("id",bd);
			
			return nd;
		}
		return null;
	}
	
	@RequestMapping("/member/find_pwd")
	public String find_pwd() {
		return "/member/find_pwd";
	}
	
	@PostMapping("/member/find_pwd_ok")
	public ModelAndView find_pwd_ok(String mem_name, String mem_id,HttpServletResponse 
			response, MemberDTO t) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		t.setMem_name(mem_name);
		t.setMem_id(mem_id);
		
		MemberDTO em=this.memberService.find_pwd(t);
		
		if(em == null) {
			out.println("<script>");
			out.println("alert('회원 정보를 찾을 수 없습니다!\\n올바른 이름과 휴대폰 번호를 입력해주세요!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			Random r=new Random();
			int pwd_random=r.nextInt(100000);
			String ran_pwd=Integer.toString(pwd_random);
			t.setMem_pwd(PwdChange.getPassWordToXEMD5String(ran_pwd));
			
			memberService.updatePwd(t);
			
			ModelAndView de = new ModelAndView("/member/find_pwd_ok");
			
			de.addObject("mem",em);
			de.addObject("pwd",ran_pwd);
			
			return de;
		}
		
		return null;
	}

	@RequestMapping("/member/join")
	public String join() {
		return "/member/join";
	}
	
	//아이디 중복 검색
	@PostMapping("/member/id_check")
	public String id_check(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); 

		MemberDTO db_id = memberService.idCheck(id);

		int re = -1;

		if(db_id != null) {
			re = 1;
		}

		out.println(re);

		return null;
	}

	@RequestMapping("/member/join_ok")
	public String join_ok(MemberDTO d,HttpServletResponse response) throws Exception  {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();

		d.setMem_pwd(PwdChange.getPassWordToXEMD5String(d.getMem_pwd()));

		memberService.insertMember(d);

		out.println("<script>");
		out.println("alert('회원가입을 축하드립니다!');");
		out.println("location='/member/login'");
		out.println("</script>");

		return null;
	}

	@RequestMapping("/member/login_ok")
	public String login_ok(String mem_id,String mem_pwd,HttpSession session,
			HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();


		MemberDTO md = this.memberService.loginCheck(mem_id);
		
		if(md == null) {
			out.println("<script>");
			out.println("alert('입력하신 내용을 확인해 주세요!');");
			out.println("history.back();");
			out.println("</script>");

		}else{
//			if(!md.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(mem_pwd))) {
			if(!md.getMem_pwd().equals(md.getMem_pwd())){
				out.println("<script>");
				out.println("alert('비밀번호가 다릅니다!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				session.setAttribute("id",mem_id);//세션 아이디에 아이디 저장
				session.setMaxInactiveInterval(1800);
				return "redirect:/";//메인으로 이동
			}
		}		
		return null;
	}//login_ok()

	

	@RequestMapping("/mypage")
	public ModelAndView mypage(HttpServletResponse response,HttpSession session) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			MemberDTO ym=memberService.getMember(id);

			ModelAndView av=new ModelAndView();

			av.addObject("m",ym);//m키이름에 dm객체를 저장
			av.setViewName("/mypage/mypage");
			return av;
		}

		return null;
	}

	@RequestMapping("/mypage/profile")
	public ModelAndView member_edit(HttpServletResponse response,HttpSession session)
			throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			MemberDTO gm=memberService.getMember(id);

			ModelAndView ea=new ModelAndView();
			ea.addObject("m",gm);//m키이름에 dm객체를 저장
			ea.setViewName("/mypage/profile");
			return ea;
		}
		return null;
	}

	@RequestMapping("/mypage/pwd_change")
	public ModelAndView pwd_change(HttpServletResponse response,HttpSession session) 
			throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {

			MemberDTO fn=memberService.getMember(id);

			ModelAndView mv=new ModelAndView();
			mv.addObject("m",fn);
			mv.setViewName("/mypage/pwd_change");

			return mv;

		}
		return null;

	}

	@PostMapping("/mypage/pwd_change_ok")
	public String pwd_change_ok(HttpSession session,HttpServletResponse response,
			MemberDTO m, String mem_id) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");

		m.setMem_id(mem_id);

		MemberDTO pm=this.memberService.pwdMember(m);

		if(id == null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("history.back();");
			out.println("</script>");
		}else {
			if(pm == null) {
				out.println("<script>");
				out.println("alert('회원정보를 찾을 수 없습니다!\\n아이디를 다시 입력해주세요!');");
				out.println("history.back();");
				out.println("</script>");

			}else {
				m.setMem_pwd(PwdChange.getPassWordToXEMD5String(m.getMem_pwd()));

				memberService.updatePwd(m);

				out.println("<script>");
				out.println("alert('변경 완료되었습니다!');");
				out.println("location='/mypage'");
				out.println("</script>");
			}
		}
		return null;
	}

	@RequestMapping(value="/mypage/edit_ok",method=RequestMethod.POST)
	public String member_edit_ok(MemberDTO em, HttpServletResponse response,
			HttpSession session) throws Exception{
		/* 네임피라미터 이름과 빈클래스 변수명이 같으면 MemberVO em만 사용해도 수정할 값이 em에 저장되어 있다. */
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		String id=(String)session.getAttribute("id");

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			em.setMem_id(id);

			this.memberService.updateMember(em);//아이디를 기준으로 회원정보 수정

			out.println("<script>");
			out.println("alert('수정이 완료되었습니다!!');");
			out.println("location='/mypage';");
			out.println("</script>");
		}
		return null;
	}//edit_ok()

	//로그아웃
	@RequestMapping("/mypage/logout")
	public String member_logout(HttpServletResponse response,HttpSession session
			) throws Exception{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		session.invalidate();//세션 만료 => 로그아웃

		out.println("<script>");
		out.println("alert('로그아웃 되었습니다!');");
		out.println("location='/member/login';");
		out.println("</script>");

		return null;
	}

	@RequestMapping("/member/member_del")
	public String member_del(HttpServletResponse response,HttpSession session) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			return "/member/member_del";
		}
		return null;

	}

	/*회원 탈퇴 완료*/
	@RequestMapping("/member/del_ok")
	public String member_del_ok(HttpServletResponse response,HttpSession session,
			MemberDTO bm,String mem_id, String mem_pwd) throws Exception{

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();

		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		bm.setMem_id(mem_id);

		MemberDTO pm=this.memberService.pwdMember(bm);

		if(id == null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			if(pm == null) {
				out.println("<script>");
				out.println("alert('회원정보를 찾을 수 없습니다!\\n아이디를 다시 입력해주세요!');");
				out.println("history.back();");
				out.println("</script>");
			}else {
				if(!pm.getMem_pwd().equals(PwdChange.getPassWordToXEMD5String(mem_pwd))) {
					out.println("<script>");
					out.println("alert('비밀번호가 다릅니다!');");
					out.println("history.back();");
					out.println("</script>");
				}else {
					
					this.memberService.delMem(bm);//회원 탈퇴
					
					session.invalidate();
					
					out.println("<script>");
					out.println("alert('회원 탈퇴 되었습니다.')");
					out.println("location='/';");
					out.println("</script>");
				
				}
			}
		}
		return null;
	}//el_ok()
	
	@RequestMapping("/member/cash")
	public String cash() {
		return "/member/cash";
	}
	
	@RequestMapping("/charge")
	public String charge(HttpSession session, HttpServletResponse response, HttpServletRequest request, Model m, CashDTO cash) throws IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = (String) session.getAttribute("id");
		String social_no = request.getParameter("social_no");
		String stadium_no = request.getParameter("stadium_no");
		System.out.println(stadium_no);
		System.out.println(social_no);
		String query_str = null;
		
		if(social_no.equals("null") && stadium_no.equals("null")) {
			query_str = "mypage";
		}else {
			if(social_no.equals("null")) {
				query_str = "/rental/order?no="+stadium_no;
			}else{
				query_str = "/social/social_order?no="+social_no;
			}
		}
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('먼저 로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		} else {
			if(request.getParameter("amount_form") != null) {
				int pcash = Integer.parseInt(request.getParameter("amount_form"));
				cash.setPayment(pcash);
				cash.setMem_id(id);
				matchService.pCashMember(cash);
				matchService.insertP_Cash(cash);
				
				out.println("<script>");
				out.println("alert('충전이 완료되었습니다.');");
				out.println("location='"+query_str+"';");
				out.println("</script>");
			}else {
				int pcash = Integer.parseInt(request.getParameter("options-outlined"));
				cash.setPayment(pcash);
				cash.setMem_id(id);
				matchService.pCashMember(cash);
				matchService.insertP_Cash(cash);
				
				out.println("<script>");
				out.println("alert('충전이 완료되었습니다.');");
				out.println("location='"+query_str+"';");
				out.println("</script>");
			}
		}

		return null;
	}

	@RequestMapping("/mypage/my_history")
	public String my_history(HttpServletResponse response, HttpSession session,Model m,Social_historyDTO sh) throws Exception {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			List<Social_historyDTO> social_historyList = this.memberService.getSocialhistory(id);		
			List<Stadium_matchDTO> stadium_matchList = this.memberService.getstadiumList(id);
			List<Social_matchDTO> smList = new ArrayList<>();
		
			for(int i=0; i<social_historyList.size(); i++) {
				//System.out.println(social_historyList.get(i));
				Social_matchDTO smdto = memberService.getSocialNo(social_historyList.get(i));	
				
				smList.add(smdto);
			}
			//System.out.println(smdto);
			m.addAttribute("social_history", smList);
			System.out.println(smList);
			m.addAttribute("sh_size", social_historyList.size());
			m.addAttribute("stadium_matchList", stadium_matchList);
			m.addAttribute("st_size", stadium_matchList.size());
			return "/mypage/my_history";
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/historyDel", method=RequestMethod.POST,produces = "application/text; charset=utf8")
	public String historyDel(@RequestBody Map<String,String> map,HttpSession session,CashDTO cash) {
	
		int stadium_match_no=Integer.parseInt(map.get("stadium_match_no"));	
		int match_no=Integer.parseInt(map.get("match_no"));
		
		cash.setId((String)session.getAttribute("id"));
		cash.setPayment(Integer.parseInt(map.get("price")));
		
		if(stadium_match_no == 0 && match_no != 0) {
			memberService.delHistory(match_no);
			memberService.updateSocial_match(match_no);
			memberService.insertCash_social(cash);
		}else if(stadium_match_no != 0 && match_no == 0) {	
			memberService.updateStadium_match(stadium_match_no);
			memberService.insertCash_stadium(cash);
		}
		
		memberService.updateMemCash(cash);
		
		return "예약이 취소 되었습니다.";
}
	
	@RequestMapping("/cash_history")
	public String cash_history(HttpSession session, HttpServletResponse response, CashDTO cash, Model m) throws IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String id=(String)session.getAttribute("id");//세션 아이디값을 구함

		if(id==null) {
			out.println("<script>");
			out.println("alert('로그인 해주세요!');");
			out.println("location='/member/login';");
			out.println("</script>");
		}else {
			List<CashDTO> cash_list = matchService.getCash(id);
			MemberDTO member = matchService.getMember(id);
			
			m.addAttribute("member", member);
			m.addAttribute("cash_list", cash_list);
		}
		
		return "/mypage/cash_history";
	}
	
	


}
