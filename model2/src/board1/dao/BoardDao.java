package board1.dao;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import board1.model.Board;

public class BoardDao {
	
	private static BoardDao instance = new BoardDao();
	
	private BoardDao() {
	}
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	public int selectTotal(String searchType, String searchTxt) {
		int total = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board1 brd, member m where brd.m_no=m.m_no and del_yn='n'";
		String sql2 = "";
		if(searchType.equals("all")) {
			sql2 = "and (subject like '%" + searchTxt + "%' or content like '%" + searchTxt + "%') ";
		}else {
			sql2 = "and " + searchType + " like '%" + searchTxt + "%' ";
		}
		if(!searchTxt.equals("")) {
			sql += sql2;
		}
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(rs,pstmt,conn);
		}
		return total;
	}
	
	public void updateHit(int no) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board1 set readcount=readcount+1 where no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(pstmt,conn);
		}
	}
	
	public List<Board> selectList(int startRow, int endRow, String searchType, String searchTxt) {
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql2 ="";
		if(searchType.equals("all")) {
			sql2 = "and (subject like '%" + searchTxt + "%' or content like '%" + searchTxt + "%') ";
		}else {
			sql2 = "and " + searchType + " like '%" + searchTxt + "%' ";
		}
		if(searchTxt.equals("")){
			sql2 = "";
		}
		String sql = "select * from (select rowNum rn, a.* from (select brd.*, m_nick, (select count(*) from recommend rcmd where rcmd.brd_no = brd.no) recommend from board1 brd, member m where brd.m_no=m.m_no and del_yn='n' " + sql2 + "order by no desc) a) where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board brd = new Board();
				brd.setNo(rs.getInt("no"));
				brd.setSubject(rs.getString("subject"));
				brd.setContent(rs.getString("content"));
				brd.setReadcount(rs.getInt("readcount"));
				brd.setRecommend(rs.getInt("recommend"));
				brd.setIp(rs.getString("ip"));
				brd.setReg_date(rs.getString("reg_date"));
				brd.setUp_date(rs.getString("up_date"));
				brd.setDel_yn(rs.getString("del_yn"));
				brd.setM_no(rs.getInt("m_no"));
				brd.setM_nick(rs.getString("m_nick"));
				list.add(brd);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(rs,pstmt,conn);
		}		
		return list;
	}
	
	public Board insert(Board brd) {
		int result = 0, number = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "insert into Board1 values(?,?,?,0,?,sysdate,null,'n',?)";
		String sql1 = "select nvl(max(no),0)+1 from Board1";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			if (rs.next())
				number = rs.getInt(1);
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, brd.getSubject());
			pstmt.setString(3, brd.getContent());
			pstmt.setString(4, brd.getIp());
			pstmt.setInt(5, brd.getM_no());
			result = pstmt.executeUpdate();
			
			if(result > 0) {
				brd.setNo(number);
			} else {
				brd.setNo(0);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(rs,pstmt,conn);
		}
		return brd;
	}
	
	public Board select(int no) {
		Board brd = new Board();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = 
				"select brd.*, m.m_nick, (select count(*) from recommend rcmd where rcmd.brd_no = brd.no) recommend from Board1 brd, member m where brd.no=? and brd.m_no=m.m_no";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				brd.setNo(rs.getInt("no"));
				brd.setSubject(rs.getString("subject"));
				brd.setContent(rs.getString("content"));
				brd.setReadcount(rs.getInt("readcount"));
				brd.setRecommend(rs.getInt("recommend"));
				brd.setIp(rs.getString("ip"));
				brd.setReg_date(rs.getString("reg_date"));
				brd.setUp_date(rs.getString("up_date"));
				brd.setM_no(rs.getInt("m_no"));
				brd.setM_nick(rs.getString("m_nick"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(rs,pstmt,conn);
		}
		return brd;
	}
	
	public int update(Board brd) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Board1 set subject=?,content=?,up_date=sysdate where no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, brd.getSubject());
			pstmt.setString(2, brd.getContent());
			pstmt.setInt(3, brd.getNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(pstmt, conn);
		}
		return result;
	}

	public int delete(int no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Board1 set del_yn='y' where no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(pstmt, conn);
		}
		return result;
	}
	
	public Board pwdCheck(int no) {
		Board brd = new Board();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select m.m_passwd from Board1 brd, member m where brd.m_no = m.m_no and no=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				brd.setM_passwd(rs.getString("m_passwd"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			dbClose(rs, pstmt, conn);
		}
		return brd;
	}
	
	public int selectRecommend(int no, String m_no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from recommend where brd_no = ? and m_no = ?";
		try{
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.setString(2, m_no);
			rs = pstmt.executeQuery();
			if(rs.next()){
				result = 1;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			dbClose(rs, pstmt, conn);
		}
		return result;
	}
	
	public int recoCheck(int no, String m_no) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql2 = "select * from recommend where brd_no = ? and m_no = ?";
		String sql = "insert into recommend values(?,?,sysdate)";
		String sql3 = "delete from recommend where brd_no = ? and m_no = ?";	
		conn = getConnection();
			try {
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, no);
				pstmt.setString(2, m_no);
				rs = pstmt.executeQuery();
				if(rs.next()){
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql3);
					pstmt.setInt(1, no);
					pstmt.setString(2, m_no);
					result = pstmt.executeUpdate();
					if(result > 0){
						result = 1;
					}else{
						result = -1;
					}
				}else{
					rs.close();
					pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, no);
					pstmt.setString(2, m_no);
					result = pstmt.executeUpdate();
					if(result > 0){
						result = 0;
					}else{
						result = -1;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				dbClose(rs, pstmt, conn);
			}
		return result; 
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// dbClose(pstmt,conn)

	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} // dbClose(rs,pstmt,conn)
	}

}
