<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset= GBK">
    <meta name="renderer" content="webkit">
    <title>test</title>
    <style>
        body{margin:0;text-align: center;}
        video{max-width: 1200px;width: 100%;}
    </style>

</head>
<body>

<jsp:useBean id="time" class = "bean.datebase.time_db" scope="session"></jsp:useBean>
<%!String last_time;
String start_time;
%>
<% 
ResultSet rs=time.getStmt().executeQuery("SELECT * FROM time ");
if(rs.next())
{
last_time=rs.getString("last_time");
start_time=rs.getString("start_time");  
} %>

Deadline:<%= last_time %>
<%
Date date= new Date();
Date start=time.get_last(start_time);
Date last_date = time.get_last(last_time);
session.setAttribute("last_date", last_date);
if(date.after(last_date)||start.after(date))
	response.sendRedirect("miss.html");
%>

<!--<script src="https://open.ys7.com/sdk/js/1.1/ezuikit.js"> </script>-->
<script src="./ezuikit.js"></script>
<script type="text/javascript">
 var last_date="<%=session.getAttribute("last_date")%>"; //取出seesion中的结束时间
 //alert("刷新")	
 var now = new Date();
 
 
function go() {
	var now = new Date();
	var a=(Date.parse(last_date)-Date.parse(now))/1000-50394;
	//alert(a);
    if(a<0) {
    	window.location.reload();   
    	//alert("111");
    }
}
setInterval('go()', 50);//每50ms判断一次是否到达截止时间
</script>
<video id="myPlayer" poster="" controls playsInline webkit-playsinline autoplay>
    <source src="rtmp://rtmp.open.ys7.com/openlive/f01018a141094b7fa138b9d0b856507b" type="" />
    <source src="http://hls.open.ys7.com/openlive/f01018a141094b7fa138b9d0b856507b.m3u8" type="application/x-mpegURL" />

</video>

<script>
    var player = new EZUIPlayer('myPlayer');
    player.on('error', function(){
        console.log('error');
    });
    player.on('play', function(){
        console.log('play');
    });
    player.on('pause', function(){
        console.log('pause');
    });

</script> 

</body>
</html>