<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.UserDAO"%>
<%-- <%@ page import = "java.sql.*" %>
<%@ page import = "util.ConnectionPool" %>  --%>

<%
	request.setCharacterEncoding("utf-8"); 
	String uid = request.getParameter("id"); 
	
	//String sql = "DELETE FROM user WHERE id = ?";
	//sql += "('" + uid + "','" + upass + "','" + uname + "')"; 

	UserDAO dao = new UserDAO(); 
	boolean code = dao.delete(uid); 
	if(code) {
		out.print("OK"); 
 		session.removeAttribute("id");
		return; 
	}
	
	else {
		//out.print("회원 정보를 찾을 수 없습니다."); 
		out.print("NA");
	}
// 	if(dao.delete(uid)){
// 		//out.print("회원 탈퇴가 완료되었습니다."); 
// 		String str = "<p align = center>";
// 		str += "<br>회원 탈퇴가 완료되었습니다.<br>"; 
// 		str += "그동안 이용해주셔서 감사드립니다.</p>";
// 		out.print(str); 
// 		session.removeAttribute("id");
// 	}
	
// 	else {
		
// 		//out.print("회원 탈퇴 처리 중 오류가 발생하였습니다."); 
// 	}
	
	
	/* Class.forName("com.mysql.jdbc.Driver"); 
	Connection conn = ConnectionPool.get(); 
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysns?serverTimezone=UTC", "root", "1111");
	Statement stmt = conn.createStatement(); 
	PreparedStatement stmt = conn.prepareStatement(sql); 
	stmt.setString(1,uid);
 	int count = stmt.executeUpdate(sql);
	int count = stmt.executeUpdate();
	 */
	
	
 	/* if(count == 1){
		out.print("회원탈퇴가 완료되었습니다."); 
	}
	
	else {
		out.print("회원 탈퇴 중 오류가 발생하였습니다."); 
	}
	stmt.close(); conn.close();   */

%>