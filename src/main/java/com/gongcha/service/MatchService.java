package com.gongcha.service;

import java.util.List;

import com.gongcha.dto.CashDTO;
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

	public List<Stadium_matchDTO> getJoin_list_stm(Stadium_matchDTO stm);
	
	public List<Stadium_matchDTO> getStadium_matchList(Stadium_matchDTO sm);

	public List<Stadium_matchDTO> getStadiumMatch(String stadium);

	public Stadium_matchDTO getStadiummatchList(int no);

	public CashDTO getCash(String id);

}
