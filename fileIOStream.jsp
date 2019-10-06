<%@ page import="java.io.FileInputStream"%>
<%@	page import="java.io.FileOutputStream"%>
<%@	page import="java.io.IOException"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=utf-8");

	String fileName = request.getParameter("fileName");
	String fileDatas = request.getParameter("fileDatas");

	FileOutputStream fos = null;
	String path = request.getRealPath("/");

	try{
		fos = new FileOutputStream(path + fileName + ".txt");

		byte[] buf = fileDatas.getBytes();

		fos.write(buf);
	}
	catch(Exception e){
		out.println(e);
		e.printStackTrace();
	}
	finally{
		if(fos != null)
			try{fos.close();}
			catch(IOException e){}
	}
%>
