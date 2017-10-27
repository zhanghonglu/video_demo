<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>设置视频开放时间</title>
</head>
<body>
<jsp:useBean id="set_time" class="bean.datebase.time_db" scope="session"/>


<form action="input_date.jsp" method="post">
仅有视频编号01的测试页面,时间按照格式修改，删除格式两个字<br>
视频编号：<input type="text"   name="video_no"  value="01" size="10"><br>
开放时间：<input type="date"   name="start_time" value="格式2016-10-16 21:19:02" size="30"><br>
截止时间：<input type="date"  name="last_time"value="格式2016-10-16 21:19:02"  size="30"><br>
<a href="1.1/demo.jsp">测试视频页面</a>
<input type="submit" value="确认">
<%
String video_no=request.getParameter("video_no");
String start_time=request.getParameter("start_time");
String last_time=request.getParameter("last_time");

if(video_no==null||start_time==null||last_time==null)
	;
else
{
	if(set_time.change(video_no, start_time,last_time))
		out.print("设置为"+start_time+"——"+last_time+"可访问");
	else
		out.print("设置失败！");
}

%>
</form>
</body>
</html>