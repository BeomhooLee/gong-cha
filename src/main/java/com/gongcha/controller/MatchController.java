package com.gongcha.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_historyDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;
import com.gongcha.service.MatchService;
import com.gongcha.service.MemberService;
import com.google.gson.Gson;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchservice;
	
	@Autowired
	private MemberService memberservice;

	@RequestMapping("/")
	public String index(Model m, Social_matchDTO sm) throws Exception {

		date(m);
		
		LocalDate now = LocalDate.now(); // YYYY-MM-DD
		String st_now = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); // String으로
		
		sm.setDate(st_now);

		// 소셜매치 리스트 뽑기
		List<Social_matchDTO> social_matchList = matchservice.getJoin_list(sm);
		// System.out.println("그냥"+social_matchList);

		m.addAttribute("social_match", social_matchList);

		return "index";
	}
	
	@RequestMapping("/rental")
	public String rental(Model m, Stadium_matchDTO stm) throws Exception {

		date(m);
		
		LocalDate now = LocalDate.now(); // YYYY-MM-DD
		String st_now = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); // String으로
		
		List<Stadium_matchDTO> stm_list = matchservice.getStadium_matchList_date(st_now);
		List<StadiumDTO> stadium = matchservice.getStadiumList();
		
		m.addAttribute("stadium_match",stm_list);
		m.addAttribute("stadium", stadium);
		
		return "/rental/rental";
	}

	@RequestMapping(value = "/social_filter", method = RequestMethod.POST)
	public String social_filter(@RequestBody Map<String, String> map, HttpServletResponse response, Social_matchDTO sm, Model m)throws Exception {

		date(m);
		
		String level = map.get("level");
		String type = map.get("type");
		String vs = map.get("vs");
		String city = map.get("city");
		String selectedDate = map.get("selectedDate");

		sm.setSkill(level);
		sm.setType(type);
		sm.setVs(vs);
		sm.setRegion("%" + city + "%");
		sm.setDate(selectedDate);

		List<Social_matchDTO> joinsocial_list = matchservice.getJoin_list(sm);
		
		m.addAttribute("sm_list", joinsocial_list);
		
		return "social_filtered";
	}
	
	@RequestMapping(value = "/stadium_filter", method = RequestMethod.POST)
	public String filter(@RequestBody Map<String, String> map, HttpServletResponse response, Stadium_matchDTO stm, Model m)throws Exception {

		date(m);
	
		String region = "%"+map.get("region")+"%";
		String selectedDate = map.get("selectedDate");
		if(region.equals("%전체%")) {
			List<StadiumDTO> stadium = matchservice.getStadiumList();
			m.addAttribute("stadium", stadium);
		}else {
			List<StadiumDTO> stadium_region_list = matchservice.getStadiumList_region(region);
			m.addAttribute("stadium", stadium_region_list);
		}
		
		List<Stadium_matchDTO> stm_list = matchservice.getStadium_matchList_date(selectedDate);
		
		
		m.addAttribute("stm_list", stm_list);
		
		return "/rental/stadium_filtered";
	}

	@RequestMapping(value = "/social")
	public String social(HttpSession session, HttpServletResponse response, HttpServletRequest request, @RequestParam("match_no") String match_no, Model m) {
		
		Social_matchDTO sm_dto = matchservice.get_sm_dto(match_no);
		StadiumDTO stadium = matchservice.getStadium(sm_dto.getStadium_name());
		List<String> etcs = new ArrayList<String>();

		String id = (String) session.getAttribute("id");
		
		etcs.add(stadium.getEtc1());
		etcs.add(stadium.getEtc2());
		etcs.add(stadium.getEtc3());
		etcs.add(stadium.getEtc4());
		etcs.add(stadium.getEtc5());
		etcs.add(stadium.getEtc6());
		etcs.add(stadium.getEtc7());
		etcs.add(stadium.getEtc8());
		etcs.add(stadium.getEtc9());
		etcs.add(stadium.getEtc10());

		boolean null_exit = true;
		while (null_exit) {
			null_exit = etcs.remove(null);
		}
		
		String match_date = sm_dto.getMatch_date().substring(0, 10);
		
		int year = Integer.parseInt(match_date.substring(0,4)); // 년도
		int month = Integer.parseInt(match_date.substring(5,7)); // 달
		int date = Integer.parseInt(match_date.substring(8,10)); // 일
		
		
		LocalDate localdate = LocalDate.of(year, month, date);

		DayOfWeek dayOfWeek = localdate.getDayOfWeek();

		String dayofweek = dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN);
		
		List<Social_historyDTO> history_list = memberservice.getSocialhistory(id);
		List<Integer> history_match_no = new ArrayList<Integer>();
		
		for (Social_historyDTO history : history_list) {
			history_match_no.add(history.getMatch_no());
		}
		
		boolean contains = history_match_no.contains(Integer.parseInt(match_no));
		
		m.addAttribute("contains", contains);
		m.addAttribute("dayofweek", dayofweek);
		m.addAttribute("sm_dto", sm_dto);
		m.addAttribute("stadium", stadium);
		m.addAttribute("etcs", etcs);

		return "/social/social";
	}


	@ResponseBody
	@RequestMapping(value = "/slick", method = RequestMethod.POST)
	public void test(@RequestBody Map<String, String> map, HttpServletResponse response)
			throws IOException, ParseException {

		String last_date = map.get("last_date");
		String dayofweek = map.get("dayofweek");

		String plused_date = LocalDate.parse(last_date).plusDays(1).toString();

		Date simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(plused_date); // 가공을 거치기 위한 포멧 생성

		String formatted_date = new SimpleDateFormat("dd").format(simpleDateFormat); // 더해진 날짜에서 날짜만 뽑음
		int int_formatted_date = Integer.parseInt(formatted_date);

		String formatted_month = new SimpleDateFormat("MM").format(simpleDateFormat); // 더해진 날짜에서 월만 뽑음
		int int_formatted_month = Integer.parseInt(formatted_month);

		String formatted_year = new SimpleDateFormat("yyyy").format(simpleDateFormat); // 더해진 날짜에서 년도만 뽑음
		int int_formatted_year = Integer.parseInt(formatted_year);

		LocalDate localdate = LocalDate.of(int_formatted_year, int_formatted_month, int_formatted_date);

		DayOfWeek dayOfWeek = localdate.getDayOfWeek();

		dayofweek = dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN);

		Map<String, Object> resp_map = new HashMap<String, Object>();

		Gson gson = new Gson();

		resp_map.put("plused_date", plused_date);
		resp_map.put("last_date", int_formatted_date);
		resp_map.put("dayofweek", dayofweek);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		gson.toJson(resp_map, response.getWriter());

	}

	@RequestMapping("/rental/order")
	public String order(HttpSession session,HttpServletResponse response, HttpServletRequest request,
			Stadium_matchDTO sm, Model m,@RequestParam("no") int no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = (String) session.getAttribute("id");

		if (id == null) {
			out.println("<script>");
			out.println("alert('먼저 로그인 해주세요!');");
			out.println("location='/login';");
			out.println("</script>");
		} else {
			sm = this.matchservice.getStadiummatchList(no);
			MemberDTO member = this.matchservice.getMember(id);

			m.addAttribute("s", sm);
			m.addAttribute("m", member);
					
			return "/rental/order";
		}

		return null;
	}
	
	@RequestMapping("/social/social_order")
	public String social_order(HttpSession session,HttpServletResponse response, HttpServletRequest request,
			Social_matchDTO sm, Model m,@RequestParam("no") String no) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = (String) session.getAttribute("id");

		if (id == null) {
			out.println("<script>");
			out.println("alert('먼저 로그인 해주세요!');");
			out.println("location='/login';");
			out.println("</script>");
		} else {
			sm = matchservice.get_sm_dto(no);
			MemberDTO member = this.matchservice.getMember(id);

			m.addAttribute("s", sm);
			m.addAttribute("m", member);
					
			return "/social/social_order";
		}

		return null;
	}

	@GetMapping("/rental/detail")
	public String detail(HttpSession session,@RequestParam("stadium") String stadium, HttpServletResponse response, 
			HttpServletRequest request, Model m, @ModelAttribute StadiumDTO stadiumDTO) throws Exception {

		response.setContentType("text/html;charset=UTF-8");

			date(m);

			// 스타디움 정보
			stadiumDTO = this.matchservice.getStadium(stadium);
			List<String> etcs = new ArrayList<String>();

			etcs.add(stadiumDTO.getEtc1());
			etcs.add(stadiumDTO.getEtc2());
			etcs.add(stadiumDTO.getEtc3());
			etcs.add(stadiumDTO.getEtc4());
			etcs.add(stadiumDTO.getEtc5());
			etcs.add(stadiumDTO.getEtc6());
			etcs.add(stadiumDTO.getEtc7());
			etcs.add(stadiumDTO.getEtc8());
			etcs.add(stadiumDTO.getEtc9());
			etcs.add(stadiumDTO.getEtc10());

			boolean flag = true;
			while (flag) {
				flag = etcs.remove(null);
			}

			List<Stadium_matchDTO> list = this.matchservice.getStadiumMatch(stadium);

			m.addAttribute("etcs", etcs);
			m.addAttribute("stadium", stadiumDTO);
			m.addAttribute("sm_list", list);

		return "/rental/detail";
	}

	@RequestMapping(value = "detailDate", method = RequestMethod.POST)
	public String detailDate(HttpServletRequest request, Stadium_matchDTO sm, @RequestBody Map<String, String> map,
			Model m) {

		String stadium = map.get("stadium");
		String selectedDate = map.get("selectedDate");
		sm.setSelectdate(selectedDate);
		sm.setStadium(stadium);
		// System.out.println(stadium);
		// System.out.println(selectedDate);

		List<Stadium_matchDTO> sm_list = this.matchservice.getStadium_matchList(sm);
		// System.out.println(sm_list);

		m.addAttribute("s_list", sm_list);

		return "/rental/detailDate";
	}
	
	@RequestMapping("/order_ok")
	public void order_ok(HttpServletRequest request, HttpServletResponse response,HttpSession session, CashDTO cash, MemberDTO member, Social_matchDTO sm) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = (String)session.getAttribute("id");
		
		int payment = Integer.parseInt(request.getParameter("payment"));
		int member_cash= Integer.parseInt(request.getParameter("membercash"));
		String stadium_no= request.getParameter("stadium_no");
		String social_no= request.getParameter("social_no");
		cash.setMem_id(id);
		cash.setPayment(payment);
	
		if(member_cash < payment) {
			out.println("<script>");
			out.println("alert('캐쉬 충전이 필요합니다.');");
			out.println("location='/member/cash';");
			out.println("</script>");
		}else {

			if(social_no == null) {
				int stadium_no_int = Integer.parseInt(stadium_no);
				cash.setStadium_match_no(stadium_no_int);
				this.matchservice.insertStadium_Match(cash);
				this.matchservice.mCashMember(cash);
				this.matchservice.insertM_Cash(cash);
				
				out.println("<script>");
				out.println("alert('구장예약이 완료되었습니다.');");
				out.println("location='/mypage/my_history';");
				out.println("</script>");
			}else {
				int social_no_int = Integer.parseInt(social_no);
				cash.setSocial_match_no(social_no_int);
				sm.setMatch_no(social_no_int);
				sm.setMember(id);
				this.matchservice.insert_social_history(sm);
				this.matchservice.insertSocial_Match(cash);
				this.matchservice.mCashMember(cash);
				this.matchservice.insertM_Cash(cash);
				
				out.println("<script>");
				out.println("alert('소셜매치 예약이 완료되었습니다.');");
				out.println("location='/mypage/my_history';");
				out.println("</script>");
			}
			
		}
	}

	public static void date(Model m) throws Exception {
		// 날짜 관련

		LocalDate now = LocalDate.now(); // YYYY-MM-DD
		String st_now = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")); // String으로

		int year = now.getYear(); // 년도
		int month = now.getMonthValue(); // 달
		int date = now.getDayOfMonth(); // 일

		// 처음 나타날 가로 달력

		List<String> dates = new ArrayList<>(); // 처음 띄울 8개 날짜 모임
		dates.add(st_now);

		List<String> dayofweek_list = new ArrayList<String>(); // 위 8개 날짜에 맞는 요일들
		LocalDate localdate = LocalDate.of(year, month, date);

		DayOfWeek dayOfWeek = localdate.getDayOfWeek();

		String dayofweek = dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN);
		dayofweek_list.add(dayofweek); // 오늘 요일 추가

		for (int i = 0; i < 7; i++) {

			String plused_date = LocalDate.parse(st_now).plusDays(1).toString(); // 하루 더해줌
			st_now = plused_date;
			Date simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd").parse(plused_date); // 가공을 거치기 위한 포멧 생성

			String formatted_date = new SimpleDateFormat("dd").format(simpleDateFormat); // 더해진 날짜에서 날짜만 뽑음
			int int_formatted_date = Integer.parseInt(formatted_date);

			String formatted_month = new SimpleDateFormat("MM").format(simpleDateFormat); // 더해진 날짜에서 월만 뽑음
			int int_formatted_month = Integer.parseInt(formatted_month);

			String formatted_year = new SimpleDateFormat("yyyy").format(simpleDateFormat); // 더해진 날짜에서 년도만 뽑음
			int int_formatted_year = Integer.parseInt(formatted_year);

			dates.add(st_now); // 리스트에 추가

			localdate = LocalDate.of(int_formatted_year, int_formatted_month, int_formatted_date);
			dayOfWeek = localdate.getDayOfWeek();
			dayofweek = dayOfWeek.getDisplayName(TextStyle.NARROW, Locale.KOREAN);
			dayofweek_list.add(dayofweek);
		}

		m.addAttribute("today", dates.get(0)); // 오늘
		m.addAttribute("last_date", st_now); // 마지막 달력 날짜
		m.addAttribute("dates", dates); // 날짜들
		m.addAttribute("dayofweek_list", dayofweek_list); // 요일들
	}
}
