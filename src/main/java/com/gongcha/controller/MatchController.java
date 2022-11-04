package com.gongcha.controller;

import java.io.IOException;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;
import com.gongcha.service.MatchService;
import com.google.gson.Gson;

@Controller
public class MatchController {

	@Autowired
	private MatchService matchservice;

	@RequestMapping("/")
	public String index(HttpServletResponse response, Model m, HttpServletRequest request, Social_matchDTO sm) throws Exception {

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

	@RequestMapping(value = "/filter", method = RequestMethod.POST)
	public String filter(@RequestBody Map<String, String> map, HttpServletResponse response, Social_matchDTO sm, Model m)throws Exception {

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
		
		return "filtered";
	}

	@RequestMapping(value = "/social")
	public String social(HttpServletResponse response, @RequestParam("match_no") String match_no, Model m) {

		Social_matchDTO sm_dto = matchservice.get_sm_dto(match_no);
		StadiumDTO stadium = matchservice.getStadium(sm_dto.getStadium_name());
		List<String> etcs = new ArrayList<String>();

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
		
		m.addAttribute("dayofweek", dayofweek);
		m.addAttribute("sm_dto", sm_dto);
		m.addAttribute("stadium", stadium);
		m.addAttribute("etcs", etcs);

		return "/social/social";
	}

	@RequestMapping("/rental")
	public String rental(Model m) throws Exception {

		List<StadiumDTO> stadium_list = matchservice.getStadiumList();

		List<Stadium_matchDTO> sm_list = matchservice.get_sm_list();

		m.addAttribute("stadium_match", sm_list);

		m.addAttribute("stadium", stadium_list);

		date(m);
		
		return "/rental/rental";
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
	public String order(HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");

		return "/rental/order";
	}

	@RequestMapping("/rental/detail")
	public String detail(@RequestParam("stadium") String stadium, HttpServletRequest request, Model m,
			@ModelAttribute StadiumDTO stadiumDTO) throws Exception {

		date(m);
		
		// 스타디움 정보
		stadiumDTO = this.matchservice.getStadium(stadium);
		System.out.println(stadium);
		System.out.println(stadiumDTO);

		m.addAttribute("stadium", stadiumDTO);
		m.addAttribute("stadium_name", stadium);

		return "/rental/detail";
	}

	public static void date(Model m) throws Exception {
		//		날짜 관련

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
