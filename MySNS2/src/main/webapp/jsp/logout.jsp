<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	session.invalidate(); 
	
	String str = "<p align=center><br>�α׾ƿ��� �Ϸ��Ͽ����ϴ�. <br><br>";
	str += "<a href = '../html/login.html'><button> �α����ϱ� </button></a></p>";
	out.print(str); 


%>