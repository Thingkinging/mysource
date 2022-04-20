<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>
<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id = "gsr" class = "studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<body>
<%
	response.setCharacterEncoding("UTF-8");
%>

	<form>
<%
	int pnum = gsr.getPnum();
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	gsr = gsrd.getRecord(pnum);
%>
	<textarea cols = '150' rows = '20' name='text' id='text' style='resize:vertical;'>
		<%=gsr.getContent() %>
	</textarea>
	
	<button>수정</button>
	<input type="button" value ="나가기" onclick="javascript:window.location='groupframe.jsp'">
	</form>
</body>
</html>


