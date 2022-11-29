package com.gongcha.dao;

import java.util.List;

import com.gongcha.dto.Black_listDTO;
import com.gongcha.dto.BoardDTO;
import com.gongcha.dto.StadiumDTO;
import com.gongcha.dto.Stadium_matchDTO;

public interface BoardDAO {

	List<BoardDTO> getRecruit(BoardDTO r);

	BoardDTO getCont(int recruit_no);

	List<BoardDTO> getMatch(String id);

	void insertRegi(BoardDTO p);

	BoardDTO getId(BoardDTO o);

	BoardDTO getRegi(int recruit_no);

	BoardDTO checkOver(int stadium_match_no);

	void edit(BoardDTO j);

	BoardDTO idCheck(BoardDTO i);

	List<BoardDTO> getStadium(String stadium_name);

	List<BoardDTO> getInfo(BoardDTO a);

	void delRecruit(BoardDTO de);
	
	List<BoardDTO> getRecruitList_region(String region);

	Stadium_matchDTO getStadium_time(BoardDTO i);

	List<BoardDTO> getBack_list(Black_listDTO b);

	void insertRegi(Black_listDTO b);

	Black_listDTO getBlack_lsit_cont(int no);

	Black_listDTO idCheck(Black_listDTO i);

	void edit(Black_listDTO j);

	void delBlack_list(Black_listDTO de);


}
