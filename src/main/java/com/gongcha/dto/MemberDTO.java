package com.gongcha.dto;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String mem_id;
	private String mem_pwd;
	private String mem_name;
	private String email_id;
	private String email_domain;
	private String mem_birth;
	private int mem_gender;
	private String phone01;
	private String phone02;
	private String postcode;
	private String roadAddress;
	private String jibunAddress;
	private String extraAddress;
	private String bank_code;
	private String bank_num;
	private String bank_owner;
	private int cash;
	
	
}
