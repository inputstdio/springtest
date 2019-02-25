package kr.pe.stdio.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.pe.stdio.entities.Member;

public interface MemberDao {
	int selectCheck (String input_email);
	int insertRow (Member member);
	ArrayList<Member> selectAll ();
	Member selectOne(String email);
	int updateRow(Member member);
	int deleteOne(String email);
	int updateLevelAll(HashMap data);
}
