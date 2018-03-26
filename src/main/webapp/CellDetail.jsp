<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import ="java.util.Date" %>
<%@ page import ="java.text.SimpleDateFormat" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String date= format.format(new Date());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>${cell.betrainid }第${cell.numfortrain }车厢</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locale/easyui-lang-zh_CN.js"></script>
	<style type="text/css">        
        #top
        {
            margin-left: 3px;
            padding: 7px;
            border-collapse: collapse;
            background-color: #F2F8FD;
            border: 1px solid #76A7E9;
            width: 97%;
            float: left;
            display: block;
            overflow: visible;
            position: fixed;
            top: 0px;
            _position: absolute;
            background-position: right;
            z-index:9999
        }
        #first
        {
        	margin-top: 50px;
        	margin-left: 10%;
            border: 1px solid #76A7E9;
            width: 80%;
        }
        #second
        {
        	margin-left: 10%;
        	margin-top: 10px;
            border: 1px solid #76A7E9;
            width: 80%;
        }
        #third
        {
        	margin-left: 10%;
        	margin-top: 10px;
            border: 1px solid #76A7E9;
            width: 80%;
        }
    </style>
</head>
</head>
<body>
	<div id="top">
  		<table width="100%" align="right">
  			<tr>
  				<td width="80%">请记住您的Id:&nbsp;&nbsp;&nbsp;<font style="color:red">"${user.id }"</font>&nbsp;&nbsp;&nbsp;,方便下次登录</td>
  				<td width="10%"><a href="<%=path %>/muserController/First.do?id=${user.id}">首页</a></td>
  				<td width="10%">
  					<a href="<%=path %>/muserController/UserDetail.do?id=${user.id}">${user.username}</a>
  					<a href="<%=path %>/muserController/zhuxiao.do">注销</a>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<div id="first">
  		<table width="100%">
  			<tr><td colspan="2"><center><h1>${cell.betrainid }第${cell.numfortrain }车厢</h1></center></td></tr>
		</table>
	</div>
	<div id="third">
		<h5>车票信息</h5>
		<table width="100%">
			<tr height="50px">
				<td align="center">出发站</td>
				<td align="center">到达站</td>
				<td align="center">车厢号</td>
				<td align="center">座位号</td>
				<td align="center">日期</td>
			</tr>
			<tr height="50px">
				<td align="center">${ticket.instationname }</td>
				<td align="center">${ticket.outstationname }</td>
				<td align="center">${ticket.cellid }</td>
				<td align="center">${ticket.chairid }</td>
				<td align="center">${ticket.date }</td>
			</tr>
		</table>
	</div>
	<div id="second">
		<h5>座位总数:${cell.chairnum }</h5>
		<center>
		<table width="70%">
		<tr>
			<c:forEach items="${chairlist}" var="chairlist" varStatus="status">
				<td width="20%" height="80px"><a href="<%=path %>/trainController/chairDetail.do?chairid=${chairlist.id }&&userid=${user.id}&&ticketid=${ticket.id}">${chairlist.numforcell }号位</a><br><br>已登记${chairlist.record }人</td>
				<c:if test="${status.count % 5 == 0}">
					</tr>
					<tr>
				</c:if>
   			</c:forEach>
   		</tr>
		</table>
		</center>
	</div>

</body>
</html>