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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locale/easyui-lang-zh_CN.js"></script>
	<title>发帖</title>
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
  	  <form action="<%=path %>/postController/publicPost.do" method="post">
  		<table width="100%">
  			<tr><td colspan="3">发帖人：${user.username }</td></tr>
  			<tr>
  				<td width="5%"><h3>题目</h3></td>
  				<td width="20%"><input type="text" name="title" required="required"/></td>
  				<td width="5%"><h3>列车号</h3></td>
  				<td width="20%"><input type="text" name="trainid" required="required"/></td>
  				<td width="20%">类型：
  					<select class="easyui-combobox" name="type" style="width:60%;">
							<option value="寻物启事">寻物启事</option>
							<option value="失物招领">失物招领</option>
							<option value="找人">找人</option>
							<option value="感谢信">感谢信</option>
							<option value="其他">其他</option>
					</select>
				</td>
  			</tr>
  			<tr>
  				<td colspan="5" align="center">
  					<textarea name="content" cols="180" rows="20" required></textarea>
  				</td>
  			</tr>
  			<tr>
  				<td colspan="3" align="center">
  					<input type="submit" value="提交" />
  				</td>
  			</tr>
  			<input type="hidden" name="publicUserId" value="${user.id}" />
  			<input type="hidden" name="publicUser" value="${user.username}" />
  			<input type="hidden" name="date" value="<%=date %>" />
  		</table>
  	  </form>
  	</div>

</body>
</html>