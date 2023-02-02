package com.gongcha.dao;

import java.util.List;

import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_matchDTO;

public interface AdminDAO {

	List<MemberDTO> getMemerList();

	List<Social_matchDTO> getSocialList();

}
