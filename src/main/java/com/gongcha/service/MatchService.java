package com.gongcha.service;

import java.util.List;

import com.gongcha.dto.BoardDTO;
import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;

public interface MatchService {

	public List<Stadium_matchDTO> get_sm_list() throws Exception;
	
	public Social_matchDTO get_sm_dto(String match_no);

	public List<StadiumDTO> getStadiumList();

	public List<Social_matchDTO> getSocial_list(Social_matchDTO sm);

	public int getTotalCount(Social_matchDTO sm);

	public StadiumDTO getStadium(String stadium_name);

	public List<String> getEtcs(String stadium_name);
	
	public List<Social_matchDTO> getJoin_list(Social_matchDTO sm);

	public List<Stadium_matchDTO> getStadium_matchList(Stadium_matchDTO sm);

	public List<Stadium_matchDTO> getStadiumMatch(String stadium);

	public Stadium_matchDTO getStadiummatchList(int no);

	public List<CashDTO> getCash(String id);

	public List<StadiumDTO> getStadiumList_region(String region);

	public List<Stadium_matchDTO> getStadium_matchList_date(String date);

	public MemberDTO getMember(String id);

	public void insertStadium_Match(CashDTO cash);
	
	public void insertSocial_Match(CashDTO cash);

	public void pCashMember(CashDTO cash);
	
	public void mCashMember(CashDTO cash);

	public void insertM_Cash(CashDTO cash);

	public void insertP_Cash(CashDTO cash);

	public void insert_social_history(Social_matchDTO sm);

	public List<BoardDTO> search(StadiumDTO s);

}
