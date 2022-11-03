package com.gongcha.service;

import com.gongcha.dto.MemberDTO;

public interface MemberService {

	MemberDTO idCheck(String id);

	void insertMember(MemberDTO d);

	MemberDTO loginCheck(String mem_id);

	MemberDTO getMember(String id);
	
	MemberDTO pwdMember(MemberDTO m);

	void updateMember(MemberDTO em);

	void updatePwd(MemberDTO m);

	void delMem(MemberDTO bm);

	MemberDTO find_id(MemberDTO e);

	MemberDTO find_pwd(MemberDTO t);

	
}
