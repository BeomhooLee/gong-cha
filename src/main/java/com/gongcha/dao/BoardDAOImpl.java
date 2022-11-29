package com.gongcha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gongcha.dto.Black_listDTO;
import com.gongcha.dto.BoardDTO;
import com.gongcha.dto.Stadium_matchDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<BoardDTO> getRecruit(BoardDTO r) {
		return sqlSession.selectList("get_list",r);
	}

	@Override
	public BoardDTO getCont(int recruit_no) {
		return sqlSession.selectOne("get_cont",recruit_no);
	}

	@Override
	public List<BoardDTO> getMatch(String id) {
		return sqlSession.selectList("get_match",id);
	}

	@Override
	public void insertRegi(BoardDTO p) {
		sqlSession.insert("insert_regi",p);
	}

	@Override
	public BoardDTO getId(BoardDTO o) {
		return sqlSession.selectOne("get_id",o);
	}

	@Override
	public BoardDTO getRegi(int recruit_no) {
		return sqlSession.selectOne("get_regi",recruit_no);
	}

	@Override
	public BoardDTO checkOver(int stadium_match_no) {
		return sqlSession.selectOne("check_over",stadium_match_no);
	}

	@Override
	public void edit(BoardDTO j) {
		sqlSession.update("edit",j);
	}

	@Override
	public BoardDTO idCheck(BoardDTO i) {
		return sqlSession.selectOne("id_ck",i);
	}

	@Override
	public List<BoardDTO> getStadium(String stadium_name) {
		return sqlSession.selectList("get_stadium",stadium_name);
	}

	@Override
	public List<BoardDTO> getInfo(BoardDTO a) {
		return sqlSession.selectList("get_info",a);
	}

	@Override
	public void delRecruit(BoardDTO de) {
		sqlSession.delete("del_recruit",de);
	}

	@Override
	public List<BoardDTO> getRecruitList_region(String region) {
		return sqlSession.selectList("getRecruitList_region", region);
	}
	
	public Stadium_matchDTO getStadium_time(BoardDTO i) {
		return sqlSession.selectOne("get_stadiumtime", i);

	}

	@Override
	public List<BoardDTO> getBack_list(Black_listDTO b) {
		return sqlSession.selectList("get_black", b);
	}

	@Override
	public void insertRegi(Black_listDTO b) {
		sqlSession.insert("black_in", b);
	}

	@Override
	public Black_listDTO getBlack_lsit_cont(int no) {
		return sqlSession.selectOne("getBlack_cont",no);
	}

	@Override
	public Black_listDTO idCheck(Black_listDTO i) {
		return sqlSession.selectOne("get_black_id", i);
	}

	@Override
	public void edit(Black_listDTO j) {
		sqlSession.update("edit_black", j);
	}

	@Override
	public void delBlack_list(Black_listDTO de) {
		sqlSession.delete("del_black", de);
	}


}
