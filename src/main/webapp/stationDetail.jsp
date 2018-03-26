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
	<title>${station.name }</title>
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
         #four
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
  			<tr><td colspan="2"><center><h1>${station.name }</h1></center></td></tr>
		</table>
	</div>
	<div id="second">
	<h5>本站始发列车时刻表</h5>
  		<table width="100%">
			<tr>
				<td width="20%" align="center">车次</td>
				<td width="20%" align="center">终点站</td>
				<td width="20%" align="center">发车时间</td>
				<td width="20%" align="center">到站时间</td>
				<td width="20%" align="center">运行时间</td>
			</tr>
			<c:forEach	items="${start }" var="start">
				<tr>
				<td width="20%" align="center">${start.id }</td>
				<td width="20%" align="center">${start.endstationname }</td>
				<td width="20%" align="center">${start.starttime }</td>
				<td width="20%" align="center">${start.endtime }</td>
				<td width="20%" align="center">${start.runtime }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="third">
	<h5>本站终点列车时刻表</h5>
  		<table width="100%">
			<tr>
				<td width="20%" align="center">车次</td>
				<td width="20%" align="center">始发站</td>
				<td width="20%" align="center">发车时间</td>
				<td width="20%" align="center">到站时间</td>
				<td width="20%" align="center">运行时间</td>
			</tr>
			<c:forEach	items="${end }" var="end">
				<tr>
				<td width="20%" align="center">${end.id }</td>
				<td width="20%" align="center">${end.startstationname }</td>
				<td width="20%" align="center">${end.starttime }</td>
				<td width="20%" align="center">${end.endtime }</td>
				<td width="20%" align="center">${end.runtime }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="four">
	<h5>本站经过列车时刻表</h5>
  		<table width="100%">
			<tr>
				<td width="10%" align="center">车次</td>
				<td width="10%" align="center">始发站</td>
				<td width="10%" align="center">终点站</td>
				<td width="10%" align="center">发车时间</td>
				<td width="10%" align="center">到站时间</td>
				<td width="10%" align="center">运行时间</td>
				<td width="10%" align="center">进站时间</td>
				<td width="10%" align="center">出站时间</td>
				<td width="10%" align="center">停留时间</td>
			</tr>
			<c:forEach	items="${trainlist }" var="trainlist">
				<tr>
				<td width="10%" align="center">${trainlist.train.id }</td>
				<td width="10%" align="center">${trainlist.train.startstationname }</td>
				<td width="10%" align="center">${trainlist.train.endstationname }</td>
				<td width="10%" align="center">${trainlist.train.starttime }</td>
				<td width="10%" align="center">${trainlist.train.endtime }</td>
				<td width="10%" align="center">${trainlist.train.runtime }</td>
				<td width="10%" align="center">${trainlist.intime }</td>
				<td width="10%" align="center">${trainlist.outtime}</td>
				<td width="10%" align="center">${trainlist.stoptime }</td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>