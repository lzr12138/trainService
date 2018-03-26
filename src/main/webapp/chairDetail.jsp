<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
  			<tr><td colspan="2"><center><h1>${cell.betrainid }第${cell.numfortrain }车厢${chair.numforcell }号座</h1></center></td></tr>
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
		<h5>其他登记人:${record }</h5>
		<center>
		<table width="70%" border=1>
			<tr height="50px">
				<td align="center">用户</td>
				<td align="center">出发站</td>
				<td align="center">到达站</td>
				<td align="center">操作</td>
			</tr>
			<c:forEach items="${ticketlist}" var="ticketlist">
			<tr height="50px">
				<td align="center">${ticketlist.userid }</td>
				<td align="center">${ticketlist.instationname }</td>
				<td align="center">${ticketlist.outstationname }</td>
				<td align="center"><a href="#" onclick="changeing(this)">申请换座</a></td>
   			</tr>
   			<form action="<%=path %>/trainController/setRequest.do" method="post">
					<tr style="display:none">
						<td  width="80%" colspan="2">理由：<br>
							<textarea name="reason" cols="100" rows="2"></textarea>
							<input type="hidden" name="bechangeuserid" value="${ticketlist.userid}">
							<input type="hidden" name="bechangeticketid" value="${ticketlist.id }">
							<input type="hidden" name="changeticketid" value="${ticket.id }">
            				<input type="hidden" name="changeuserid" value="${user.id }" />
            				<input type="hidden" name="date" value="<%=date %>" />
            				<input type="hidden" name="chairid" value="${chair.id }" />
						</td>
						<td width="10%">
							<input type="submit" value="提交" />
						</td>
					</tr>
				</form>
   			</c:forEach>
		</table>
		</center>
	</div>
	<script type="text/javascript">
		function changeing(nowEle){
			var nextEle = nowEle.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling;
			if(nextEle.style.display=='none'){
				nextEle.style.display='block';
			}
			else {nextEle.style.display='none';}
		}
	</script>
</body>
</html>