package kr.pe.stdio.dbtest;

import java.sql.*;

import kr.pe.stdio.entities.Member;

public class DBpoolConnectTestMain {
	public static void main(String[] args) {
		DBConnectionManager db = DBConnectionManager.getInstance();
		Connection cn = null;			// db 연결을 받아옴
		PreparedStatement ps = null;	// query 문을 보내는 역할을 함
		ResultSet rs = null;			// select 문의 결과 값을 받아옴

		String sql = "SELECT * FROM member";
		try {
			cn = db.getConnection();
			ps = (PreparedStatement) cn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				String[] field_names = {"email"};
				for (String str : field_names) {
					System.out.print(rs.getString(str) + "\t");
				}
				System.out.println("");
			}
			rs.close();
			ps.close();
			cn.close();
		} catch (Exception e) {
			System.out.println("error:" + e.getMessage());
		}
	}
}