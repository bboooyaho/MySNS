<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	session.invalidate(); 
	
	String str = "<p align=center><br>로그아웃을 완료하였습니다. <br><br>";
	str += "<a href = '../html/login.html'><button> 로그인하기 </button></a></p>";
	out.print(str); 


%>