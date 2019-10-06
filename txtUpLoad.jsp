<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="java.nio.channels.FileChannel"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=utf-8");

	String filePath = "/";

	String fileName = request.getParameter("fileName");
	String _txtFilePathName = filePath+fileName;
	String fileDatas = request.getParameter("fileDatas");

	File _txtFile = null;
	FileOutputStream _fos = null;
	FileInputStream  _xfis = null;
	FileOutputStream _xfos = null;

	try{
		if(new File(_txtFilePathName).exists()){
			String _backupPath = filePath+"backup";
			File _backupDir = new File(_backupPath);
			if(!_backupDir.isDirectory()){
				_backupDir.mkdir();
			}

			String _fExt = _txtFilePathName.substring(_txtFilePathName.lastIndexOf(".")).trim();
			Date now = new Date();
			String backup = new SimpleDateFormat("yyyyMMddHHmmssSSS").format (now);
			_xfis = new FileInputStream(_txtFilePathName);
			_xfos = new FileOutputStream(_backupPath+"/"+fileName.replace(_fExt,"."+backup+_fExt));

			FileChannel _fcin =  _xfis.getChannel();
			FileChannel _fcout = _xfos.getChannel();

			long size = _fcin.size();
			_fcin.transferTo(0, size, _fcout);

			_fcout.close();
			_fcin.close();

			_xfos.close();
			_xfis.close();

		}
		_txtFile = new File(_txtFilePathName);
		_fos = new FileOutputStream(_txtFile);
		_fos.write(fileDatas.getBytes("UTF-8"));

	}
	catch(Exception e){
		e.printStackTrace();
		}
	finally{
		try{
			_fos.close();
		}
		catch(Exception ef) {
			ef.printStackTrace();
		}
	}
%>
