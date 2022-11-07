package com.gongcha.dto;

import lombok.Data;

@Data
public class Stadium_matchDTO {
	private int stadium_match_no;
	private String match_date;
	private int available;
	private String stadium_name;
	private String mem_id;
	private int price;
	private String start_time;
	private String end_time;
	
	//필터상세설정에 필요한 변수
	private String region;
	private String selectdate;
	private String stadium;
	
	//조인 쿼리
	private StadiumDTO stadiumDTO;
	
}
