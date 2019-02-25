package kr.pe.stdio.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.pe.stdio.entities.Buy;

public interface BuyDao {
	ArrayList<Buy> selectAll();
	int selectSequenceNo (Buy buy);
	int selectSequenceHanf (Buy buy);
	int selectNo (Buy buy);
	int insertRow (Buy buy);
	Buy selectRow (int seq);
	ArrayList<Buy> selectSearch (Buy buy);
	ArrayList<Buy> selectBuySearchRollup (Buy buy);
	ArrayList<Buy> selectBuySearchRollupMM (Buy buy);
	int updateRow (Buy buy);
	int deleteRow (int seq);
}
