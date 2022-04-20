<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@page import="studyTogether.record.groupBoardDBBean"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="board" class="studyTogether.record.groupStudyRecordBean" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="board"/>
<script src="d/space_jquery/js"></script>
<script>
var now = new Date();
var year = now.getFullYear();
var month = now.getMonth()+1;	// ì
var date = now.getDate();	// ì¼
var today = year +""+ month +""+ date;
	  
	$(function() {
		$("#save_data").click(function() {
			alert("succeess");
		        $.ajax({
		            url: "input_process.jsp",
		            type: "post",
		            data: { 
							content:$('#content').val(),
							tod : today,
			                success : function(data){
			                }
						  }
		        });
		});
	});
	
    
</script>
<%
	request.setCharacterEncoding("UTF-8");
%>
</head>
<body>
<%

	Calendar cal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMdd");
	String tod = sdf.format(cal.getTime());
	String nowTime = sdf.format(cal.getTime());
	
%>
<%
	String content = request.getParameter("content");
	String groupmember = request.getParameter("groupmember");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="js/jquery.js"></script>
    <script>
    </script>
    <style>
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
        	margin: 5px; padding: 0;
        	float:left;
            width: 1000px;
            height : 40px;
            text-align: center;
            border: 1px solid black;
        }
        .confirm_wrap{
            width: 600px;
            text-align: center;
            border: 1px solid black;
            }

           .confirm_wrap .in{
            display: block;
            }
        .box{
        	margin: 5px; padding: 5px;
	        float:left;
            width: 450px;
            height : 80px;
            text-align: center;
            border: 1px solid black;
        }

    </style>
</head>
<body>
	
 	<form action="input_process.jsp" method="post">
    <div style="width : 1080px;">
    	<div>
            <table class ="title" >
                <tr >
                    <td>
                        <h1 style="margin-bottom: 0">그룹</h1>
                    </td>
                </tr>
            </table>
    	</div>
        <div>
            <table class ="date" >
                <tr >
                    <td>
                        <h1>Today - </h1>
                        <h4><%= nowTime %></h4>
                    </td>
                </tr>
            </table>
        </div>
      
    <div class ="confirm_wrap" id ="confirm">
        <div class = "in">
            <table class = "box"> 
            <tr>
                <td style="width: 1080px;"><h1>오늘 공부한 내용</h1></td>
            </tr>
            <tr>
                <td>
                    <textarea style="width: 980px; resize:vertical; overflow: scroll;" cols = '150' rows = '10' name='content' >
                    </textarea>
                </td>
            </tr>
            <tr>
                <td style="float: left; margin: 5px;">
                	<input type ="text" value ="<%=groupmember %>" name = "groupmember">
					<input type ="text" value ="<%=tod %>" name ="tod"><br><br>
					<div style="float: left;">
                		<input type="submit" value="기록하기">
						<input type="button" value ="그룹 페이지" onclick="location.href='groupframe.jsp';javascript:form.action='groupframe.jsp'">
					</div>
                </td>
            </tr>
            </table>
        </div>
    </div>
    </div>
    </form>
</body>
</html>

</body>
</html>










