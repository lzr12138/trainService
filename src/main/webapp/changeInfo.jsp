<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locale/easyui-lang-zh_CN.js"></script>
	<title>换座申请</title>
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
        	margin-top: 50px;
        	margin-left: 10%;
            border: 1px solid #76A7E9;
            width: 80%;
        }
    </style>
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
  		<h3>换座申请</h3>
  		<table  width="100%">
  			<tr height="50px">
  				<td align="center" width="7%">申请人</td>
  				<td align="center" width="5%">车次</td>
  				<td align="center" width="5%">上车站</td>
  				<td align="center" width="5%">下车站</td>
  				<td align="center" width="10%">时间</td>
  				<td align="center" width="5%">车厢号</td>
  				<td align="center" width="5%">座位号</td>
  				<td align="center" width="40%">理由</td>
  				<td align="center" width="5%">回应</td>
  				<td align="center" width="10%">操作</td>
  			</tr>
  			<c:forEach	items="${bechangelist}" var="bechangelist">
  				<tr height="50px">
  					<td align="center">${bechangelist.changeuserid }</td>
  					<td align="center">${bechangelist.changeticket.trainid }</td>
  					<td align="center">${bechangelist.changeticket.instationname }</td>
  					<td align="center">${bechangelist.changeticket.outstationname }</td>
  					<td align="center">${bechangelist.changeticket.date }</td>
  					<td align="center">${bechangelist.changeticket.cellid }</td>
  					<td align="center">${bechangelist.changeticket.chairid }</td>
  					<td align="center">${bechangelist.reason }</td>
  					<td align="center">
  						<c:if test="${bechangelist.react eq null}">未反馈 </c:if>
  						<c:if test="${bechangelist.react eq 'F'}">拒绝</c:if>
            			<c:if test="${bechangelist.react eq 'T'}">同意</c:if>
  					</td>
  					<td align="center">
  						<a href="<%=path %>/muserController/React.do?userid=${user.id}&&react=T&&id=${bechangelist.id}">同意</a>&nbsp;
  						<a href="<%=path %>/muserController/React.do?userid=${user.id}&&react=F&&id=${bechangelist.id}">反对</a>
  					</td>
  				</tr>
  				<tr height="50px">
  					<td colspan='2' align="center">你的车票</td>
  					<td align="center">${bechangelist.bechangeticket.instationname }</td>
  					<td align="center">${bechangelist.bechangeticket.outstationname }</td>
  					<td></td>
  					<td align="center">${bechangelist.bechangeticket.cellid }</td>
  					<td align="center">${bechangelist.bechangeticket.chairid }</td>
  					<td colspan="3"><td>
  				</tr>
  			</c:forEach>
  		</table>
  	</div>
  	<div id="second">
  		<h3>你的申请</h3>
  		<table width="100%">
  			<tr height="50px">
  				<td align="center" width="7%">被申请人</td>
  				<td align="center" width="5%">车次</td>
  				<td align="center" width="5%">上车站</td>
  				<td align="center" width="5%">下车站</td>
  				<td align="center" width="10%">时间</td>
  				<td align="center" width="5%">车厢号</td>
  				<td align="center" width="5%">座位号</td>
  				<td align="center" width="40%">理由</td>
  				<td align="center" width="5%">回应</td>
  			</tr>
  			<c:forEach	items="${changelist}" var="changelist">
  				<tr height="50px">
  					<td align="center">${changelist.bechangeuserid }</td>
  					<td align="center">${changelist.bechangeticket.trainid }</td>
  					<td align="center">${changelist.bechangeticket.instationname }</td>
  					<td align="center">${changelist.bechangeticket.outstationname }</td>
  					<td align="center">${changelist.bechangeticket.date }</td>
  					<td align="center">${changelist.bechangeticket.cellid }</td>
  					<td align="center">${changelist.bechangeticket.chairid }</td>
  					<td align="center">${changelist.reason }</td>
  					<td align="center">
  						<c:if test="${changelist.react eq null}" >未反馈 </c:if>
  						<c:if test="${changelist.react eq 'F'}">拒绝</c:if>
            			<c:if test="${changelist.react eq 'T'}">同意</c:if>
  					</td>
  				</tr>
  				<tr height="50px">
  					<td align="center" colspan='2'>你的车票</td>
  					<td align="center">${changelist.changeticket.instationname }</td>
  					<td align="center">${changelist.changeticket.outstationname }</td>
  					<td></td>
  					<td align="center">${changelist.changeticket.cellid }</td>
  					<td align="center">${changelist.changeticket.chairid }</td>
  					<td colspan="2"><td>
  				</tr>
  			</c:forEach>
  		</table>
  	</div>
  	<script type="text/javascript">
		
	</script>
</body>
</html>