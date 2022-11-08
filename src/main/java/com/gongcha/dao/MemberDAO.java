package com.gongcha.dao;

import java.util.List;

import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_historyDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.Stadium_matchDTO;

public interface MemberDAO {

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

	List<Social_historyDTO> getSocialhistory(String id);

	List<Stadium_matchDTO> getstadiumList(String id);

	Social_matchDTO getSocialNo(Social_historyDTO social_historyDTO);

	void delHistory(int match_no);

	void updateSocial_match(int match_no);

	void updateStadium_match(int stadium_match_no);

	void insertCash_social(CashDTO cash);

	void insertCash_stadium(CashDTO cash);

	void updateMemCash(CashDTO cash);
}
