<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.*"%>
<%-- <%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %> 
 --%>

<%
	request.setCharacterEncoding("utf-8"); 
	String uid = request.getParameter("id"); 
	String jsonstr = request.getParameter("jsonstr"); 
// 	String upass = request.getParameter("ps"); 
// 	String uname = request.getParameter("name"); 
	
	
	UserDAO dao = new UserDAO();  
	if(dao.exists(uid)){
		out.print("EX"); 
		//return; 
		}
	else if(dao.insert(uid, jsonstr)){
		//out.print("회원 가입이 완료되었습니다."); 
		session.setAttribute("id", uid);
		out.print("OK"); 
		
	}
	else {
		//out.print("회원 가입 처리 중 오류가 발생하였습니다."); 
		out.print("ER");
	}
/* 	String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
	//sql += "('" + uid + "','" + upass + "','" + uname + "')"; 

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = ConnectionPool.get();   
//	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
//	Statement stmt = conn.createStatement(); 
	PreparedStatement stmt = conn.prepareStatement(sql); 
	stmt.setString(1,uid);
	stmt.setString(2,upass);
	stmt.setString(3,uname);
	
	//int count = stmt.executeUpdate(sql);
	int count = stmt.executeUpdate();
	if(count == 1){
		out.print("회원가입이 완료되었습니다."); 
	}
	
	else {
		out.print("회원 가입 중 오류가 발생항였습니다."); 
	}
	stmt.close(); conn.close(); 
 */
 
%>