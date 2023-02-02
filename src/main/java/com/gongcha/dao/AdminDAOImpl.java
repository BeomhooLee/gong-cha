package com.gongcha.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_matchDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MemberDTO> getMemerList() {
		return sqlSession.selectList("memberAll");
	}

	@Override
	public List<Social_matchDTO> getSocialList() {
		return sqlSession.selectList("socialAll");
	}
}
