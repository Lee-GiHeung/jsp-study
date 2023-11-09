package com.momo.dao;

import java.sql.SQLException;

import com.momo.common.DBConnPool;
import com.momo.dto.MemberDto;

public class MemberDao extends DBConnPool{
	public MemberDto login(String id, String pw) {
		MemberDto memberDto = new MemberDto();
		String sql = "select *\r\n"
					+ "from member\r\n"
					+ "where id = ?\r\n"
					+ "and pass = ?";
			
		// 입력받은 사용자 정보가 DB로 부터 조회
		try {
			pstmt = con.prepareStatement(sql);
			// 파라미터 실행
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
				
			// 쿼리 실행
			rs = pstmt.executeQuery();
			
			// 아이디는 중복되지 않기때문에 if
			if(rs.next()) {
				// 로그인 성공
				memberDto.setId(rs.getString(1));
				memberDto.setName(rs.getString(2));
				memberDto.setRegidate(rs.getString(4));
				
				// 사용자 정보를 dto에 담아서 반환
				return memberDto;
				
			} else {
				// 로그인 실패
				return null;
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
			return null;
		}
				
	}
	
}
