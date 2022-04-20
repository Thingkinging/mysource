<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class ="studyTogether.record.groupStudyRecordBean"/>
<jsp:setProperty name ="gsr" property = "*"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
    <script>
    	function join() {
   			confirm('가입하시겠습니까?')
		}
    </script>
    <style>
        *{margin: 5px; padding: 5px;}
        li{list-style: none;}
        body{width: 1025px}
        a{text-decoration: none;}
        .title{
            width: 1000px;
            height : 50px;
            text-align: center;
            border: 1px solid black;
            margin-bottom: 10px;
            float: left;
        }
        .date{
        	float:left;
            width: 440px;
            height : 50px;
            text-align: center;
            border: 1px solid black;
        }
        .description{
            float: right;
			height : 50px;
            width : 440px;
            border: 1px solid black;
            text-align: center;
        }
        .box{
	        float:left;
            width: 430px;
            height : 80px;
            text-align: center;
            border: 1px solid black;
        }
    </style>
</head>
<body>
	<%-- GROUPING --%>
	<%
		groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
		ArrayList<groupStudyRecordBean> list = gsrd.listRecord(1);
	%>
	
	<%	
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String nowTime = sdf.format(cal.getTime());
		
	%>
    	<div class ="title" >
      		  <h1>제목</h1>
    	</div>
    	<div class ="title" >
       		 <h1>목표</h1>
    	</div>
        <div>
        	<form action="write.jsp" method = "post" name = "form">
        	<table class="box">
        		<tr>
        			<td class ="date" colspan="3">
			       		 <h2>Today -<%=nowTime %></h2>
        			</td>
        		</tr>
	<% 
		for(int i =0; i<list.size();i++){
			gsr = list.get(i);
			
	%>
        		
        		<tr>
        			<td class ="date">
		        		<b style="float: left;"><%=gsr.getGroupmember() %></b>&emsp;&emsp;
		        		<input type ="hidden" name ="pnum" value = "<%=gsr.getPnum() %>"/>
		        		<input type ="hidden" name ="groupmember" value = "<%=gsr.getGroupmember() %>"/>
		        		<div style="float: right;">
		        			<input type="submit" value="기록">
		        			 <button onclick="location.href='edit.jsp';javascript:form.action='edit.jsp'">확인</button>
		        			<!-- input type = "submit" onclick="location.href='input2.jsp';javascript:form.action='input2.jsp'" value = "기록"> -->
		        			 <!-- <button onclick="location.href='output.jsp';javascript:form.action='output.jsp'">확인</button> --> 
		        			 <!-- <button onclick="location.href='output.jsp';javascript:form.action='output.jsp'">확인</button> --> 
		        		</div>
        			</td>
        		</tr>
<% 		
	}	
%>        		
        	</table>
        	</form>
        </div>
        
        
		 <div>
		 	<table class="description">
		 		<tr>
		 			<td class="description">
				 		<h2>그룹 이름</h2>
		 			</td>
		 		</tr>
		 		
	 <% 
		for(int i =0; i<list.size();i++){
			gsr = list.get(i);
			
	%>
		 		<tr>
		 			<td class ="date">
		        		<b style="float: left;">이름</b>&emsp;&emsp;
		        		<div style="float: right;">
		        			<b>언어 / 분야</b>
		        		</div>
        			</td>
		 		</tr>
	<% 		
	}	
	%>
	
	</table>
	</div>
              <input type="submit" value="가입하기" onclick="join()">
              <button onclick="location.href='myFile.jsp';javascript:form.action='myFile.jsp'">마이 페이지</button>
	 <%--
		for(int i =0; i<list.size();i++){
			gsr = list.get(i);
			
	--%>
		 		<!-- <tr>
		 			<td class ="date">
		        		<b style="float: left;">이름</b>&emsp;&emsp;
		        		<div style="float: right;">
		        			<b>언어 / 분야</b>
		        		</div>
        			</td>
		 		</tr> -->
	<%-- 		
	}	
	--%> 	 	 	 		
		 	</table>
	 	</div>
   		
    <!--   <div style="width: 600px">
        <div style="float:left; ">
          <input type = "text" style="width:100px; text-align: center;" value = "이름" >
        </div>
        <div style="margin-left: 485px" id="check">
	        <button onClick='location.href="write.jsp"'>기록하기</button>
			<button onClick='location.href="check.jsp"'>확인하기</button>
        </div>
        </div>
      </div>-->
</body>
</html>