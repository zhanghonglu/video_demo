<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>������Ƶ����ʱ��</title>
</head>
<body>
<jsp:useBean id="set_time" class="bean.datebase.time_db" scope="session"/>


<form action="input_date.jsp" method="post">
������Ƶ���01�Ĳ���ҳ��,ʱ�䰴�ո�ʽ�޸ģ�ɾ����ʽ������<br>
��Ƶ��ţ�<input type="text"   name="video_no"  value="01" size="10"><br>
����ʱ�䣺<input type="date"   name="start_time" value="��ʽ2016-10-16 21:19:02" size="30"><br>
��ֹʱ�䣺<input type="date"  name="last_time"value="��ʽ2016-10-16 21:19:02"  size="30"><br>
<a href="1.1/demo.jsp">������Ƶҳ��</a>
<input type="submit" value="ȷ��">
<%
String video_no=request.getParameter("video_no");
String start_time=request.getParameter("start_time");
String last_time=request.getParameter("last_time");

if(video_no==null||start_time==null||last_time==null)
	;
else
{
	if(set_time.change(video_no, start_time,last_time))
		out.print("����Ϊ"+start_time+"����"+last_time+"�ɷ���");
	else
		out.print("����ʧ�ܣ�");
}

%>
</form>
</body>
</html>