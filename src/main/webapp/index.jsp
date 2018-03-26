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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
  <body>
  	<div id="top">
  		<table width="100%" align="right" >
  			<tr>
  				<td width="90%">请记住您的Id:&nbsp;&nbsp;&nbsp;<font style="color:red">"${user.id }"</font>&nbsp;&nbsp;&nbsp;,方便下次登录</td>
  				<td width="10%">
  					<a href="<%=path %>/muserController/UserDetail.do?id=${user.id}">${user.username}</a>
  					<a href="<%=path %>/muserController/zhuxiao.do">注销</a>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<div id="first" align="center">
  			<table>
  				<tr height="50px"><td><h1>火车服务系统</h1></td></tr>
  			</table>
  		</div>
  	<div id="second">
  		<div id="second1" align="center">
  			<table>
  				<tr><td><a href="<%=path %>/postController/allPost.do?userid=${user.id}"><h3>列车贴吧</h3></a></td></tr>
  			</table>
  		</div>
  		<div id="second2">
			<table id="dg1" title="最新内容" class="easyui-datagrid" style="width:99%"
				url="<%=path %>/postController/allPostforFirst.do"
        		pagination="false" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="title" width="10%" data-options="formatter: postdetil">题目</th>
            			<th field="trainid" width="10%">列车号</th>
            			<th field="type" width="10%">类型</th>
            			<th field="date" width="15%">时间</th>
            			<th field="publicUser" width="15%">发布者</th>
            			<th field="content" width="30%">大致内容</th>
            			<th field="clicknum" width="10%">点击数</th>
        			</tr>
    			</thead>
			</table>
		</div>
		<div id="second3" align="right">
			<a href="<%=path %>/postController/allPost.do?userid=${user.id}" >更多</a>
		</div>
  	</div>
  	<div id="third">
  		<div id="third1" align="center">
  			<table>
  				<tr><td><a href="<%=path %>/goodsController/allGoods.do?userid=${user.id}"><h3>车上小卖部</h3></a></td></tr>
  			</table>
  		</div>
  		<div id="third2">
			<table id="dg2" title="最火商品" class="easyui-datagrid" style="width:99%"
				url="<%=path %>/goodsController/allGoodsforFirst.do"
				
        		pagination="false" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="name" width="15%" data-options="formatter: goodsdetil">名称</th>
            			<th field="type" width="10%">类型</th>
            			<th field="price" width="15%">单价</th>
            			<th field="sum" width="20%">数量</th>
            			<th field="detail" width="30%">描述</th>
            			<th field="salenum" width="10%">销量</th>
        			</tr>
    			</thead>
			</table>
		</div>
		<div id="third3" align="right">
			<a href="<%=path %>/goodsController/allGoods.do?userid=${user.id}" >更多</a>
		</div>
  	</div>
  	<div id="four">
  		<div id="four1" align="center">
  			<table>
  				<tr><td><a href="<%=path %>/trainController/allTrain.do?userid=${user.id}"><h3>列车信息</h3></a></td></tr>
  			</table>
  		</div>
  		<center>
			<table id="dg3" title="列车信息" class="easyui-datagrid" style="width:99%"
				url="<%=path %>/trainController/allTrainforFirst.do"
        		pagination="false" 
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
		<div id="four3" align="right">
			<a href="<%=path %>/trainController/allTrain.do?userid=${user.id}" >更多</a>
		</div>
  	</div>
	<script type="text/javascript">
	
		function postdetil(value, row, index){
			return '<a href="<%=path %>/postController/PostDetail.do?postId='+ row.id +'&&userid=${user.id}">'+row.title+'</a>';
		}
		function goodsdetil(value, row, index){
			return '<a href="<%=path %>/goodsController/GoodsDetail.do?goodsId='+ row.id +'&&userid=${user.id}">'+row.name+'</a>';
		}
		function traindetil(value, row, index){
			return '<a href="<%=path %>/trainController/TrainDetail.do?trainId='+ row.id +'&&userid=${user.id}">'+row.id+'</a>';
		}
		function sstationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.startstation +'&&userid=${user.id}">'+row.startstationname+'</a>';
		}
		function estationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.endstation +'&&userid=${user.id}">'+row.endstationname+'</a>';
		}
	</script>
  </body>
</html>
