package com.gongcha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gongcha.dao.MatchDAO;
import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;

@Service
public class MatchServiceImpl implements MatchService {
	
	@Autowired
	private MatchDAO matchDAO;

	@Override
	public List<Stadium_matchDTO> get_sm_list() throws Exception {
		
		return matchDAO.get_sm_list();
	}

	@Override
	public List<StadiumDTO> getStadiumList() {
		
		return matchDAO.getStadiumList();
	}

	@Override
	public List<Social_matchDTO> getSocial_list(Social_matchDTO sm) {
		return matchDAO.getSocial_list(sm);
	}

	@Override
	public int getTotalCount(Social_matchDTO sm) {
		return matchDAO.getTotalCount(sm);
	}

	@Override
	public Social_matchDTO get_sm_dto(String match_no) {
		return matchDAO.get_sm_dto(match_no);
	}

	@Override
	public StadiumDTO getStadium(String stadium_name) {
		return matchDAO.getStadium(stadium_name);
	}

	@Override
	public List<String> getEtcs(String stadium_name) {
		return matchDAO.getEtcs(stadium_name);
	}

	@Override
	public List<Social_matchDTO> getJoin_list(Social_matchDTO sm) {
		return matchDAO.getJoin_list(sm);
	}

	@Override
	public List<Stadium_matchDTO> getJoin_list_stm(Stadium_matchDTO stm) {
		return matchDAO.getJoin_list_stm(stm);
	}
	
	@Override
	public List<Stadium_matchDTO> getStadium_matchList(Stadium_matchDTO sm) {
		return this.matchDAO.getStadium_matchList(sm);
	}

	@Override
	public List<Stadium_matchDTO> getStadiumMatch(String stadium) {
		return this.matchDAO.getStadiumMatch(stadium);
	}

	@Override
	public Stadium_matchDTO getStadiummatchList(int no) {
		return this.matchDAO.getStadiummatchList(no);
	}

	@Override
	public CashDTO getCash(String id) {
		return this.matchDAO.getCash(id);
	}

	@Override
	public MemberDTO getMember(String id) {
		return matchDAO.getMember(id);
	}

	@Override
	public void insertStadium_Match(CashDTO cash) {
		matchDAO.insertStadium_Match(cash);
	}

	@Override
	public void updateMember(CashDTO cash) {
		matchDAO.updateMember(cash);
	}

	@Override
	public void insertM_Cash(CashDTO cash) {
		matchDAO.insertM_Cash(cash);
	}

}
