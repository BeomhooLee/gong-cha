package com.gongcha.dto;

import lombok.Data;

@Data
public class BoardDTO {
	
	//recruit 테이블
	private int recruit_no;
	private String stadium_name;
	private String title;
	private String recruit_content;
	private String mem_id;
	private int stadium_match_no;
	private String regdate;
	private int match_level;
	
	//stadium_match join
	private String match_date;
	private int price;
	private String start_time;
	private String end_time;
	
}
