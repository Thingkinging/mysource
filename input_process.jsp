<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id = "gsr" class = "studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<%
	response.setCharacterEncoding("UTF-8");
%>

<%	
	String tod = request.getParameter("tod");
	String content = request.getParameter("content");
	String groupmember = request.getParameter("groupmember");
	out.print(tod);
	out.print(content);
	out.print(groupmember);
	
	gsr.setTod(tod);
	gsr.setContent(content);
	gsr.setGroupmember(groupmember);
	groupStudyRecordDBBean gsrdb = groupStudyRecordDBBean.getInstance();
%>

<% 
	int re = gsrdb.insertRecord(gsr,1);
	if(re == 1){
	response.sendRedirect("groupframe.jsp");
	}
%>