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
	<title>列车信息</title>
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
  		<div id="first1" align="center">
  			<table>
  				<tr><td><h3>列车信息</h3></a></td></tr>
  			</table>
  		</div>
  		<center>
			<table id="dg" title="所有列车" class="easyui-datagrid" style="width:100%;height:600px"
				toolbar="#toolbar"
				url="<%=path %>/trainController/allTrainlist.do"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="id" width="15%" data-options="formatter: traindetil">车次</th>
            			<th field="startstation" width="10%" data-options="formatter: sstationdetil" >始发站</th>
            			<th field="endstation" width="10%" data-options="formatter: estationdetil" >终点站</th>
            			<th field="starttime" width="20%">始发时间</th>
            			<th field="endtime" width="20%">到达时间</th>
            			<th field="runtime" width="25%">运行时间</th>
        			</tr>
    			</thead>
			</table>
		</center>
  	</div>
  	<div id="toolbar">
  				车次:
  					<input type="text" id="trainid" name="trainid"/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:search1()">查询</a>&nbsp;&nbsp;&nbsp;
	</div>
  	<script type="text/javascript">
		function traindetil(value, row, index){
			return '<a href="<%=path %>/trainController/TrainDetail.do?trainId='+ row.id +'&&userid=${user.id}">'+row.id+'</a>';
		}
		function sstationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.startstation +'&&userid=${user.id}">'+row.startstationname+'</a>';
		}
		function estationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.endstation +'&&userid=${user.id}">'+row.endstationname+'</a>';
		}
		
		function search1() {
			 $('#dg').datagrid({
			        queryParams : {
			        	trainid:$("#trainid").val(),
		 	        },
	           });
		}
	</script>
</body>
</html>