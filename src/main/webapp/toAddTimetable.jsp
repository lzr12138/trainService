<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title></title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locale/easyui-lang-zh_CN.js"></script>
	<style>
		#first
        {
        	margin-top: 10px;
            border: 1px solid #76A7E9;
            width: 100%;
        }
        #second
        {
        	margin-top: 10px;
            border: 1px solid #76A7E9;
            width: 100%;
        }
        </style>
</head>
<body>
	<div id="first">
		<table id="dg1" title="${trainid }列车时刻表" class="easyui-datagrid" style="width:99%;height:300px"
				url="<%=path %>/adminController/getTimetable.do?trainid=${trainid }"
				toolbar="#toolbar"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="trainid" width="10%">车次</th>
            			<th field="stationname" width="10%">车站名称</th>
            			<th field="intime" width="15%">入站时间</th>
            			<th field="outtime" width="15%">出站时间</th>
            			<th field="stoptime" width="30%">停车时间</th>
            			<th field="numfortrain" width="10%">到站次序</th>
        			</tr>
    			</thead>
			</table>
	</div>
	<div id="toolbar">
			<a class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:deleteTimetable()">删除</a>
			<form id="fm" action="<%=path %>/adminController/deleteTimetable.do" method="post">
				<input type="hidden" id="id" name="id" />
				<input type="hidden" id="trainid" name="trainid" value="${trainid }" />
			</form>
	</div>
	
	<div id="second">
	<form action="<%=path %>/adminController/insertTimeTable.do" method="post">
	  <table width="100%">
	  	<tr>
	  		<td width="50%">
				车次:${trainid }
				<input type="hidden" id="trainid" name="trainid" value="${trainid }" />
			</td>
			<td>
				车站名称:<select class="easyui-combobox" id="stationid" name="stationid">
							<option value=""></option>
							<c:forEach items="${stationlist }" var="stationlist">
								<option value="${stationlist.id }">${stationlist.name }</option>
							</c:forEach>
						</select>
			</td>
		</tr>
		<tr>
			<td>入站时间:<input type="time" id="intime" name="intime" /></td>
			<td>出战时间:<input type="time" id="outtime" name="outtime" /></td>
		</tr>
		<tr>
			<td>停留时间:<input type="time" id="outtime" name="stoptime" /></td>
			<td>到达次序:<input type="number" id="numfortrain" name="numfortrain" /></td>
		</tr>
		<tr>
			<td align="right"><input type="submit" value="提交" /></td>
			<td align="left"><input type="reset" value="重置" /></td>
		</tr>
	  </table>
	</form>
	</div>
	<script>
		function deleteTimetable(){
			var row = $('#dg1').datagrid('getSelected');
			if(row==null){
				alert("未选择数据行");
				return;
			}
			$('#id').val(row.id);
			$('#fm').submit();
		}
	</script>
</body>
</html>