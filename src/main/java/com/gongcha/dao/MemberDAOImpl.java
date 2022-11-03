package com.gongcha.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gongcha.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO idCheck(String id) {
		return sqlSession.selectOne("id_check", id);
	}//아이디 중복검색

	@Override
	public void insertMember(MemberDTO d) {
		sqlSession.insert("member_in", d);
	}//회원가입

	@Override
	public MemberDTO loginCheck(String mem_id) {
		return sqlSession.selectOne("login_check", mem_id);
	}//로그인 인증

	@Override
	public MemberDTO getMember(String id) {
		return sqlSession.selectOne("get_mem",id);
	}//회원정보 가져오기

	@Override
	public MemberDTO pwdMember(MemberDTO m) {
		return sqlSession.selectOne("find_id",m);
	}//비밀번호 변경에서 회원 아이디 검색
	
	@Override
	public void updateMember(MemberDTO em) {
		sqlSession.update("edit_ok",em);
	}//회원정보 수정완료

	@Override
	public void updatePwd(MemberDTO m) {
		sqlSession.update("pwd_change",m);
	}//비밀번호 변경

	@Override
	public void delMem(MemberDTO bm) {
		sqlSession.delete("del_mem",bm);
	}//회원 탈퇴

	@Override
	public MemberDTO find_id(MemberDTO e) {
		return sqlSession.selectOne("f_id",e);
	}//아이디 찾기

	@Override
	public MemberDTO find_pwd(MemberDTO t) {
		return sqlSession.selectOne("f_pwd",t);
	}//비밀번호 찾기

}
