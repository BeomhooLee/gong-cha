package com.gongcha.dto;

import lombok.Data;

@Data
public class ReplyDTO {
	
	private int reply_no;
	private String mem_id;
	private String reply_content;
	private int recruit_no;
	private int reply_class;
	private int reply_order;
	private int reply_group;
	private String regi_date;
}
