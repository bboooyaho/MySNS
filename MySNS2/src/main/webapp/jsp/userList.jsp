<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.util.*" %>
<%@ page import = "dao.*" %>
<%-- <% --%>
// 	ArrayList<UserObj> list = (new UserDAO()).getList(); 
	
// 	String str = "<table align=center border=0>";
// 	str += "<tr><td colspan=3>가입자 리스트</td></tr>";
	
// 	for(UserObj user : list){
// 		str += "<tr><td colspan=3><hr></td></tr>"; 
// 		str += "<tr>" + "<td>" + user.getId() +"</td>"
// 			+ "<td>" + user.getName() +"</td>"
// 			+ "<td>nbsp;(" + user.getTs() +")</td>"
// 			+ "</tr>" ;
			
// 	}
// 	str += "</table>" ; 
// 	out.print(str); 
<%-- 	%>   --%>

<% 
	out.print((new UserDAO()).getList()); 
%>	
		
