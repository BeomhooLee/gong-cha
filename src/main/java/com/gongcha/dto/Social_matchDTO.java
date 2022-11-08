package com.gongcha.dto;

import lombok.Data;

@Data
public class Social_matchDTO {
	private int match_no;
	private int price;
	private String match_date;
	private String versus_num;
	private String match_type;
	private String stadium_name;
	private int gender;
	private String shoes;
	private int player_num;
	private String match_time;
	private String match_level;
	private int current_count;
	private String manager;
	private String start_time;
	private String end_time;
	
	//필터상세설정에 필요한 변수
	private String skill;
	private String type;
	private String vs;	
	private String region;
	private String date;
	private String member;
	
	//조인 쿼리
	private StadiumDTO stadiumDTO;
}
