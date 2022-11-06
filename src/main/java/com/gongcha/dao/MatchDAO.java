package com.gongcha.dao;

import java.util.List;

import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;

public interface MatchDAO {
	
	public List<Stadium_matchDTO> get_sm_list() throws Exception;

	public List<StadiumDTO> getStadiumList();

	public List<Social_matchDTO> getSocial_list(Social_matchDTO sm);

	public int getTotalCount(Social_matchDTO sm);

	public Social_matchDTO get_sm_dto(String match_no);

	public StadiumDTO getStadium(String stadium_name);

	public List<String> getEtcs(String stadium_name);

	public List<Social_matchDTO> getJoin_list(Social_matchDTO sm);

	public List<Stadium_matchDTO> getStadium_matchList(Stadium_matchDTO sm);

	public List<Stadium_matchDTO> getStadiumMatch(String stadium);

}
