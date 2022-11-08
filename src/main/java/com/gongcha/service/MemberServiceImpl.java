package com.gongcha.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gongcha.dao.MemberDAO;
import com.gongcha.dto.MemberDTO;
import com.gongcha.dto.Social_historyDTO;
import com.gongcha.dto.Social_matchDTO;
import com.gongcha.dto.Stadium_matchDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDao;
	
	@Override
	public MemberDTO idCheck(String id) {
		
		return memberDao.idCheck(id);
	}

	@Override
	public void insertMember(MemberDTO d) {
		memberDao.insertMember(d);
	}

	@Override
	public MemberDTO loginCheck(String mem_id) {
		return memberDao.loginCheck(mem_id);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDao.getMember(id);
	}
	
	@Override
	public MemberDTO pwdMember(MemberDTO m) {
		return memberDao.pwdMember(m);
	}

	@Override
	public void updateMember(MemberDTO em) {
		memberDao.updateMember(em);
	}

	@Override
	public void updatePwd(MemberDTO m) {
		memberDao.updatePwd(m);
	}

	@Override
	public void delMem(MemberDTO bm) {
		memberDao.delMem(bm);
	}

	@Override
	public MemberDTO find_id(MemberDTO e) {
		return memberDao.find_id(e);
	}

	@Override
	public MemberDTO find_pwd(MemberDTO t) {
		return memberDao.find_pwd(t);
	}

	@Override
	public List<Social_historyDTO> getSocialhistory(String id) {
		return memberDao.getSocialhistory(id);
	}

	@Override
	public List<Stadium_matchDTO> getstadiumList(String id) {
		return memberDao.getstadiumList(id);
	}

	@Override
	public Social_matchDTO getSocialNo(Social_historyDTO social_historyDTO) {
		return memberDao.getSocialNo(social_historyDTO);
	}

}
