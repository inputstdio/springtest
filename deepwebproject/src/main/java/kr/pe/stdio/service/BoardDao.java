package kr.pe.stdio.service;

import java.util.ArrayList;

import kr.pe.stdio.entities.Board;
import kr.pe.stdio.entities.BoardPaging;

public interface BoardDao {
	int insertRow (Board board);
	int insertReplyRow (Board board);
	int selectMaxSeq ();
	int selectRowCount(String search);
	ArrayList<Board> selectPage(BoardPaging boardPaging);
	ArrayList<Board> selectAll(String search);
	Board selectBoard (int b_seq);
	void updateHit (int b_seq);
	int deleteRow (int b_seq);
	int updateRow(Board board);
}
