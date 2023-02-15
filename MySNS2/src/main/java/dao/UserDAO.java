package dao;

import java.sql.*;
import javax.naming.NamingException;
import java.util.*; 
import util.ConnectionPool;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class UserDAO {
	
	public boolean insert(String uid, String jsonstr) throws NamingException, SQLException 
	
	{	
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null; 
		
		try {
			String sql = "INSERT INTO user(id, jsonstr) VALUES(?,?)"; 
			stmt = conn.prepareStatement(sql); 
			stmt.setString(1,uid);
			stmt.setString(2, jsonstr); 
//			stmt.setString(2,upass);
//			stmt.setString(3,uname);
			
			int count = stmt.executeUpdate();
			return (count==1)? true : false; 
			} finally {
				if(stmt != null) stmt.close(); 
				if(conn != null) conn.close(); 
		}
	}
	
	public boolean exists(String uid) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null; 
		ResultSet rs = null;
		try {
			String sql = "SELECT id FROM user WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			rs = stmt.executeQuery();
			return rs.next(); 
		
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public boolean delete(String uid) throws NamingException, SQLException {
		
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null; 
		
		try {
			String sql = "DELETE FROM user WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			int count = stmt.executeUpdate();
			return (count > 0)? true : false; 
			
			
			
			} finally {
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	public int login(String uid, String upass) throws NamingException, SQLException, ParseException {
		Connection conn = ConnectionPool.get();   
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try { 
			String sql = "SELECT jsonstr FROM user WHERE id =?";  
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);
			
			rs = stmt.executeQuery();
			if(!rs.next()) return 1; 
			String jsonstr = rs.getString("jsonstr");
			 JSONObject obj = (JSONObject)(new JSONParser()).parse(jsonstr); 
			 String pass = obj.get("password").toString();
			 if(!upass.equals(pass)) return 2; 
			
			//if(!upass.equals(rs.getString("password"))) return 2; 
			return 0; 
			
		} finally {
			if(rs != null) rs.close(); 
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
		}
	}
	
	//ArrayList<UserObj>
	public String getList() throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			//String sql = "SELECT id, name, ts FROM user ORDER BY ts DESC";
			String sql = "SELECT jsonstr FROM user";    
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery(); 
			
			String str = "[";
			int cnt = 0;
			while(rs.next()) {
				if(cnt++ >0) str += ","; 
				str += rs.getString("jsonstr");
			}
			return str +"]"; 
			
//			JSONArray users = new JSONArray(); //ArrayList<UserObj> => JSONArray 
//			while(rs.next()) {
//				JSONObject obj =new JSONObject();
//				obj.put("id", rs.getString("id"));
//				obj.put("name", rs.getString("name"));
//				obj.put("ts", rs.getString("ts"));
//				users.add(obj); 
//			}	
//				users.add(new UserObj(
//						
//						rs.getString("id"), 
//						rs.getString("name"), 
//						rs.getString("ts"))); 
			
			//return users.toJSONString();  
//			return users; 

			} finally {
				if(rs != null) rs.close(); 
				if(stmt != null) stmt.close();
				if(conn != null) conn.close();
		}
	}
	
	//uid값과 동일한 아이디를 지닌 사용자 정보를 user테이블로부터 추출하여 반환한다. 
	public String get(String uid) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		ResultSet rs = null; 
		try {
			String sql = "SELECT jsonstr FROM user WHERE id =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, uid);
			rs =stmt.executeQuery();
			return rs.next() ? rs.getString("jsonstr") : "{}"; 
		} finally {
			if(rs != null) rs.close(); 
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
	
		}
	}
	
	public boolean update(String uid,String jsonstr) throws NamingException, SQLException {
		Connection conn = ConnectionPool.get();
		PreparedStatement stmt = null;
		try { 
			String sql = "UPDATE user SET jsonstr = ? WHERE id =?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, jsonstr);
			stmt.setString(2, uid);
			
			int count = stmt.executeUpdate();
			return(count == 1)? true :false;
		} finally {
			if (stmt != null) stmt.close(); 
			if (conn != null) conn.close();
		}
	}
}
