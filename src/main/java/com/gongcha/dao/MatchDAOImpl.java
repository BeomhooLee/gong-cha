package com.gongcha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gongcha.dto.CashDTO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;

@Repository
public class MatchDAOImpl implements MatchDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Stadium_matchDTO> get_sm_list() throws Exception {
		
		return sqlSession.selectList("match.get_sm_list");
	}

	@Override
	public List<StadiumDTO> getStadiumList() {
		
		return sqlSession.selectList("match.getStadiumList");
	}

	@Override
	public List<Social_matchDTO> getSocial_list(Social_matchDTO sm) {
		return sqlSession.selectList("match.getSocial_list",sm);
	}

	@Override
	public int getTotalCount(Social_matchDTO sm) {
		return sqlSession.selectOne("match.social_count",sm);
	}

	@Override
	public Social_matchDTO get_sm_dto(String match_no) {
		return sqlSession.selectOne("getSocialDTO",match_no);
	}

	@Override
	public StadiumDTO getStadium(String stadium_name) {
		return sqlSession.selectOne("getStadium", stadium_name);
	}

	@Override
	public List<String> getEtcs(String stadium_name) {
		return sqlSession.selectList("getEtcs", stadium_name);
	}
	
	@Override
	public List<Social_matchDTO> getJoin_list(Social_matchDTO sm) {
		return sqlSession.selectList("match.socialjoin_list",sm);
	}

	@Override
	public List<Stadium_matchDTO> getJoin_list_stm(Stadium_matchDTO stm) {
		return sqlSession.selectList("match.stadiumMatchJoin_list",stm);
	}

	@Override
	public List<Stadium_matchDTO> getStadium_matchList(Stadium_matchDTO sm) {
		return sqlSession.selectList("match.stadium_matchList",sm);
	}

	@Override
	public List<Stadium_matchDTO> getStadiumMatch(String st) {
		return sqlSession.selectList("match.getStadiumMatch", st);
	}

	@Override
	public Stadium_matchDTO getStadiummatchList(int no) {
		return sqlSession.selectOne("match.getSMList",no);
	}

	@Override
	public CashDTO getCash(String id) {
		return this.sqlSession.selectOne("match.getcash", id);
	}

	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("match.getmember",id);
	}

	@Override
	public void insertStadium_Match(CashDTO cash) {
		sqlSession.update("match.edit_sm",cash);
	}

	@Override
	public void updateMember(CashDTO cash) {
		sqlSession.update("match.edit_mem",cash);
	}

	@Override
	public void insertM_Cash(CashDTO cash) {
		sqlSession.insert("match.insert_mcash",cash);
	}

}
