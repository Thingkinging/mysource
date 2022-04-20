<%@page import="java.util.ArrayList"%>
<%@page import="studyTogether.record.groupStudyRecordDBBean"%>
<%@page import="studyTogether.record.groupStudyRecordBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gsr" class="studyTogether.record.groupStudyRecordBean"></jsp:useBean>
<jsp:setProperty property="*" name="gsrd"/>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">
	    function check() {
			if ((".main_article").length > 0) {
				(".main_article").show();
			}else if ((".main_article").length > 0) {
				(".main_article").show();
			}
		}
    </script>
    <style>
        *{margin: 0; padding: 0;}
        body{font-family: sans-serif;}
        li{list-style: none;}
        a{text-decoration: none;}
        img{border: 0;}
    </style>
    <style>
        #main_header{
            /* 중앙 정렬 */
            width: 960px; margin: 0 auto;
            /* 절대 좌표 */
            height: 160px;
            position: relative;
        }
        #main_header > #title{
            position: absolute;
            left: 20px; top: 60px;
        }
        #main_header > #main_gnb{
            position: absolute;
            right: 0; top: 0;
        }
        </style>
    <style>
        #main_gnb > ul{overflow: hidden;}
        #main_gnb > ul > li{float: left;}
        #main_gnb > ul > li > a{
            display: block;
            padding: 2px 10px;
            border: 1px solid black;
        }
        </style>
    <style>
        #content{
            width: 960px; margin: 0 auto;
            overflow: hidden;
        }
        #content > #main_section{
            width: 400px;
            float: left;
        }
        #content > #main_aside{
            width: 200px;
            float: right;
        }
    </style>
    <style>
        #main_section{
            margin-bottom: 10px;
            padding: 20px;
            border: 1px solid black;
            visibility: hidden;
        }
    </style>
    <style>
        .item{
            overflow: hidden;
            padding: 10px;
            border: 1px solid black;
            margin: 10px;
        }
        .description{
            float: left;
            margin-left: 10px;
        }
    </style>
    <style>
        #main_footer{
            width: 960px; margin: 0 auto;
            margin-bottom: 10px;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>
<%
	groupStudyRecordDBBean gsrd = groupStudyRecordDBBean.getInstance();
	ArrayList<groupStudyRecordBean> list = gsrd.listRecord(1);
	
	String id = request.getParameter("id");
	
%>

    <header id="main_header">
        <div id="title">
            <h1>스터디 참여목록</h1>
        </div>
        <nav id="main_gnb">
            <ul>
                <li><a href="#"><%=gsr.getPnum() %></a></li>
                <li><a href="#">로그아웃</a></li>
            </ul>
        </nav>
    </header>
    <div id="content">
    	<input type="button" onclick='document.getElementById("main_section").style.visibility = "visible" ' value="스터디 확인"
    		style="width: 90px; height: 30px; float: center;">
 		</div>
	    <%
			for(int i = 0; i < list.size(); i++){
				gsr = list.get(i);
   		 %>
    <div id="content">
        <section id="main_section">
     			<article class="main_article">
               <h1><a href="#"><%=gsr.getB_title() %></a></h1>
              	<p><%=gsr.getB_goal() %>, <%=gsr.getB_studyDate()%></p>
           </article> 
        </section>
            <%
				}
            %>
            
        <aside id="main_aside">
            <div class="tab_item">
                <ul>
                    <li class="item">
                        <a href="#">
                            <div class="description">
                                <strong>공지사항</strong>
                            </div>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <div class="description">
                                <strong>QnA</strong>
                            </div>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <div class="description">
                                <strong>고객센터</strong>
                            </div>
                        </a>
                    </li>
                    <li class="item">
                        <a href="#">
                            <div class="description">
                                <strong>내요옹~~</strong>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
    </div>
    <footer id="main_footer">
        <h3>바르고 고운말을 사용합시다.</h3>
    </footer>
</body>
</html>