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
		//out.print("ȸ�� ������ ã�� �� �����ϴ�."); 
		out.print("NA");
	}
// 	if(dao.delete(uid)){
// 		//out.print("ȸ�� Ż�� �Ϸ�Ǿ����ϴ�."); 
// 		String str = "<p align = center>";
// 		str += "<br>ȸ�� Ż�� �Ϸ�Ǿ����ϴ�.<br>"; 
// 		str += "�׵��� �̿����ּż� ����帳�ϴ�.</p>";
// 		out.print(str); 
// 		session.removeAttribute("id");
// 	}
	
// 	else {
		
// 		//out.print("ȸ�� Ż�� ó�� �� ������ �߻��Ͽ����ϴ�."); 
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
		out.print("ȸ��Ż�� �Ϸ�Ǿ����ϴ�."); 
	}
	
	else {
		out.print("ȸ�� Ż�� �� ������ �߻��Ͽ����ϴ�."); 
	}
	stmt.close(); conn.close();   */

%>