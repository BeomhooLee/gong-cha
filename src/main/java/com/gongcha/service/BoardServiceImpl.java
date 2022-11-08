package com.gongcha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gongcha.dao.BoardDAO;
import com.gongcha.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	

	@Override
	public List<BoardDTO> getRecruit(BoardDTO r) {
		return boardDao.getRecruit(r);
	}

	@Override
	public BoardDTO getCont(int recruit_no) {
		return boardDao.getCont(recruit_no);
	}

	@Override
	public List<BoardDTO> getMatch(String id) {
		return boardDao.getMatch(id);
	}

	@Override
	public void insertRegi(BoardDTO p) {
		boardDao.insertRegi(p);
	}

	@Override
	public BoardDTO getId(BoardDTO o) {
		return boardDao.getId(o);
	}

	@Override
	public BoardDTO getRegi(int recruit_no) {
		return boardDao.getRegi(recruit_no);
	}

	@Override
	public BoardDTO checkOver(int stadium_match_no) {
		return boardDao.checkOver(stadium_match_no);
	}

	@Override
	public void edit(BoardDTO j) {
		boardDao.edit(j);
	}

	@Override
	public BoardDTO idCheck(BoardDTO i) {
		return boardDao.idCheck(i);
	}

	@Override
	public List<BoardDTO> getStadium(String stadium_name) {
		return boardDao.getStadium(stadium_name);
	}

	@Override
	public List<BoardDTO> getInfo(BoardDTO a) {
		return boardDao.getInfo(a);
	}

	@Override
	public void delRecruit(BoardDTO de) {
		boardDao.delRecruit(de);
	}

	@Override
	public List<BoardDTO> getRecruitList_region(String region) {
		return boardDao.getRecruitList_region(region);
	}



}


