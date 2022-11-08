package com.gongcha.service;

import java.util.List;

import com.gongcha.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> getRecruit(BoardDTO r);

	BoardDTO getCont(int recruit_no);

	void insertRegi(BoardDTO p);

	BoardDTO getId(BoardDTO o);

	BoardDTO getRegi(int recruit_no);

	BoardDTO checkOver(int stadium_match_no);

	void edit(BoardDTO j);

	BoardDTO idCheck(BoardDTO i);

	List<BoardDTO> getMatch(String id);

	List<BoardDTO> getStadium(String stdium_name);

	List<BoardDTO> getInfo(BoardDTO a);

	void delRecruit(BoardDTO de);

	List<BoardDTO> getRecruitList_region(String region);
	
}
