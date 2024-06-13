package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import guestbook.VO.GuestVo;

public class GuestbookOracle implements GuestbookDao {
    private String dbuser;
    private String dbpass;

    // 생성자
    public GuestbookOracle(String dbuser, String dbpass) {
        super();
        this.dbuser = dbuser;
        this.dbpass = dbpass;
    }

    // 데이터베이스 접속 정보 -> 컨텍스트 파라미터로부터 받아옴
    // Connection 공통 메서드
    private Connection getConnection() throws SQLException {
        Connection conn = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
            conn = DriverManager.getConnection(dburl, dbuser, dbpass);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        return conn;
    }

    @Override
    public List<GuestVo> getList() { // SELECT
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        List<GuestVo> list = new ArrayList<>();
        try {
            conn = getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT * FROM guestbook ORDER BY reg_date DESC";
            rs = stmt.executeQuery(sql); 
            while (rs.next()) {
                Long no = rs.getLong("no");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String content = rs.getString("content");
                Date regDate = rs.getDate("reg_date");

                GuestVo vo = new GuestVo(no, name, password, content, regDate);
                list.add(vo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // SQLException 발생 시 빈 리스트를 반환하거나 예외를 다시 던지는 등의 적절한 처리
        } finally {
            // 자원 해제
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    // method for get ResultSet with id parameter
    private ResultSet executeQuery(PreparedStatement pstmt, Long id) throws SQLException {
        pstmt.setLong(1, id);
        return pstmt.executeQuery();
    }

    @Override
	public GuestVo get(Long id) {
		GuestVo vo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = """
					SELECT no, name, password, content, reg_date
					FROM guestbook
					WHERE no = ?
					""";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Long no = rs.getLong("no");
				String name = rs.getString("name");
				String password = rs.getString("password");
				String content = rs.getString("content");
				Date regDate = rs.getDate("reg_date");
				
				vo = new GuestVo(no, name, password, content, regDate);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

    @Override
	public boolean insert(GuestVo vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertCount = 0;
		try {
			conn = getConnection();
			String sql = "INSERT INTO guestbook (name, password, content) VALUES (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getPassword());
			pstmt.setString(3, vo.getContent());
			
			insertCount = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return insertCount == 1;
	}

    @Override
    public boolean delete(Long id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int deletedCount = 0;
        try {
            conn = getConnection();
            String sql = "DELETE FROM guestbook WHERE no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setLong(1, id);

            deletedCount = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                System.err.println("ERROR:" + e.getMessage());
            }
        }
        return 1 == deletedCount;
    }
}