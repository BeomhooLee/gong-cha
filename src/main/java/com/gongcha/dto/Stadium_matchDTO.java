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
	
	private String selectdate;
	private String stadium;
}
