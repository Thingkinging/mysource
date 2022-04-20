<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new registration</title>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%
	response.setCharacterEncoding("UTF-8");

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMdd");
	String tod = sdf.format(cal.getTime());
%>
<%
	String content = request.getParameter("content");
	String groupmember = request.getParameter("groupmember");
%>


<form method="post" action = input_process.jsp>
	<textarea cols = '150' rows = '20' name='content' id='content'></textarea>
	<input type ="text" value ="<%=groupmember %>" name = "groupmember">
	<input type ="text" value ="<%=tod %>" name ="tod">
	<input type="submit" value="기록하기">
	<input type="button" value ="그룹 페이지" onclick="javascript:window.location='groupframe.jsp'">
</form>
</body>
</html>