<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="dao.*"%>
<%
	out.print((new FeedDAO()).getList());  
%>




<%-- <%@ page import = "java.sql.*" %> --%>
<%-- <%@ page import ="java.util.*" %> --%>

<!--  	String uid = (String ) session.getAttribute("id");  -->
<!--  	 	if(uid == null) { -->
<!--  		response.sendRedirect("../html/login.html"); -->
<!--  		return;  -->
<!--  	} -->
<!--  	 	session.setAttribute("id", uid);  -->

<!--  	ArrayList<FeedObj> feeds = (new FeedDAO()).getList();  -->
<!--  	//ResultSet rs = (new FeedDAO()).getList();   -->
<!--  	//String sql = "SELECT * FROM feed ORDER BY ts DESC";  -->

<!--  	 Connection conn = ConnectionPool.get();  -->
<!--  	PreparedStatement stmt = conn.prepareStatement(sql);  -->
<!--  	ResultSet rs = stmt.executeQuery();	  -->

<!--  	String str = "<table align=center >"; -->
<!--  	str += "<tr height = 40><td><b>작성글 리스트</b></td>" -->
<!--  		+ "<td align=right>" -->
<!--  		+ "<a href='../html/feedAdd.html'><button> 글쓰기 </button></a>"  -->
<!--  		+ "</td></tr>";  -->




<!--  	for(FeedObj feed : feeds){ -->
<!--  		String img = feed.getImages(), imgstr = "";  -->
<!--   		if(img != null) { -->
<!--  			imgstr = "<img src ='../images/" +img + "'width=240>";  -->
<!--  		} -->

<!--  		str += "<tr><td colspan=2><hr></td></tr>";  -->
<!--  		str += "<tr>"  -->
<!--  			+ "<td><small>" + feed.getId() +"</small></td>" -->
<!--  			+ "<td><small>&nbsp;(" + feed.getTs() +")</small></td>"  -->
<!--  			+ "</tr>" -->
<!--  			+ "<tr><td colspan=2>" + imgstr + "</td></tr>"  -->
<!-- 			+ "<tr><td colspan = 2>" + feed.getContent() +"</td>"  -->
<!--  			+ "</tr>" ;  -->
<!--  		out.print(imgstr); -->

<!--  	} -->
<!--  	str += "</table>" ; -->

<!--  	out.print(str);  -->
<!--  	stmt.close(); conn.close();  -->



