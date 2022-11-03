package com.gongcha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gongcha.dto.BoardDTO;

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


}
