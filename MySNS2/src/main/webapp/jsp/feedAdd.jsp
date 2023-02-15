<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<%@ page import="dao.*"%>
<%@ page import="java.util.*"%>
<%@ page import="util.*"%>

<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//String uid = null, ucon = null, ufname = null;
	String jsonstr = null, ufname = null;
	byte[] ufile =null; 
	

	ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
	List items = sfu.parseRequest(request); 
	Iterator iter = items.iterator(); //반복자 객체 생성 
	
	while(iter.hasNext()){
		
		FileItem item = (FileItem)iter.next(); 
		String name = item.getFieldName(); 
		
		if(item.isFormField()) {
			String value = item.getString("utf-8");
			//if(name.equals("id")) uid = value;
			//else if(name.equals("content")) ucon = value; 
			if(name.equals("jsonstr")) jsonstr = value; 
		}
		
		else {
			if(name.equals("image")){
				ufname = item.getName(); 
				ufile = item.get(); 
				String root = application.getRealPath(java.io.File.separator);
				FileUtil.saveImage(root,ufname, ufile); 
			}
		}
	}
	FeedDAO dao = new FeedDAO();  
	
	//if(dao.insert(uid, ucon, ufname)){
		//response.sendRedirect("./main.jsp");
		if(dao.insert(jsonstr)){
		out.print("OK"); 
	}
	
	else{
		//out.print("작성 글의 업로드 중 오류가 발생하였습니다."); 
		out.print("ER");
	}
 
%>