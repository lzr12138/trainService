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
		<table id="dg" title="车站列表" class="easyui-datagrid" style="width:99%;height:300px"
				url="<%=path %>/adminController/getStation.do"
				toolbar="#toolbar"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="name" width="10%">站名</th>
        			</tr>
    			</thead>
			</table>
	</div>
	<div id="toolbar">
  			站名:<input type="text" id="name1" name="name"/>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchstation()">查询</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:addStation()">新增</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:updateStation()">修改</a>&nbsp;&nbsp;&nbsp;
	</div>
	
	<div id="dlg" class="easyui-dialog" style="width:300px;height:150px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
	<form id="fm" action="<%=path %>/adminController/saveStation.do" method="post">
	  <table width="100%">
	  	<tr>
	  		<td align="center">
				车站名称:	<input type="text" id="name" name="name"  />
				<input type="hidden" id="id" name="id" value="" />
				<input type="hidden" id="status" name="status" value="" />
			</td>
		</tr>
	  </table>
	</form>
		<div id="dlg-buttons">
        	<a class="easyui-linkbutton" iconCls="icon-ok" onclick="savestation()">提交</a>
        	<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    	</div>
	</div>
	<script>
		function searchstation() {
		 	$('#dg').datagrid({
		        queryParams : {
		        	name:$("#name1").val(),
	 	        },
          	});
		}
		function addStation(){
			$('#dlg').dialog('open').dialog('setTitle','新增车站');
			$("#name").val('');
			$("#status").val('add');
			alert($("#status").val());
		}
		function updateStation(){
			var row = $('#dg').datagrid('getSelected');
			if(row==null){
				alert("请选择数据行");
				return;
			}
			$('#dlg').dialog('open').dialog('setTitle','修改车站');
			$("#name").val(row.name);
			$("#id").val(row.id);
			$("#status").val('update');
			alert($("#status").val());
		}
		function savestation(){
			$('#fm').submit();
		}
	</script>
	
</body>
</html>