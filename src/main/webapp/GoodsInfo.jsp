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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/locale/easyui-lang-zh_CN.js"></script>
	<title>车上小卖部</title>
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
  				<input type="hidden" id = "themoney" value="${user.money }" />
  			</tr>
  		</table>
  	</div>
	<div id="first">
  		<div id="first1" align="center">
  			<table>
  				<tr><td><h3>车上小卖部</h3></a></td></tr>
  			</table>
  		</div>
  		<center>
			<table id="dg" title="所有商品" class="easyui-datagrid" style="width:100%;height:600px"
				url="<%=path %>/goodsController/allGoodsList.do"
        		toolbar="#toolbar"
        		pagination="true" 
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
		</center>
  	</div>
  	<div id="toolbar">
  				名称:
  					<input type="text" id="name" name="name"/>
  				类型：
  					<select class="easyui-combobox" id="type" name="type" style="width:20%;">
  							<option value=""></option>
							<option value="熟食">熟食</option>
							<option value="饮品">饮品</option>
							<option value="面包">面包</option>
							<option value="雪糕">雪糕</option>
							<option value="盒饭">盒饭</option>
					</select>
				</td>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:search1()">查询</a>&nbsp;&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" onclick="buying()">购买选中商品</a>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
   		<form id="fm" method="post">
    		<table>
    			<div class="fitem">
              		<tr>
                		<td>购买数量：</td>
                		<td><input type="number" id="sum" name="sum" required="required" /></td>
              		</tr>
              		<tr>
                		<td>所在列车：</td>
                		<td>
                			<select id="ticketid" name="ticketid">
                				<c:forEach items="${ticketlist }" var="ticketlist">
                					<option value="${ticketlist.id }">${ticketlist.trainid }&nbsp;&nbsp;${ticketlist.date }</option>
                				</c:forEach>
                			</select>
                		</td>
              		</tr>
            	</div>
            	<input type="hidden" name="username" value="${user.username }" />
            	<input type="hidden" name="userid" value="${user.id }" />
            	<input type="hidden" id="date" name="date" value="<%=date %>" />
    		</table>
    	</form>
    	<div id="dlg-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="buy()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    	</div>
	</div>
  	<script type="text/javascript">
  	
  		function buying(){
  			var row = $('#dg').datagrid('getSelected');
  			if(row==null){
				alert("未选中数据行");
				return false;
			}
  			var money = $('#themoney').val();
  			if(money ==0){
  				alert("你没钱了！！！！");
  				return false;
  			}
  			if(row.sum!=0){
				$('#dlg').dialog('open').dialog('setTitle','购买');
			}
  			else alert("该商品库存为0，暂时不能购买。");
		}

		function buy(){
			var row = $('#dg').datagrid('getSelected');
			
			var money = $('#themoney').val();
			var total = $('#sum').val() * row.price;
			if(money<total){
				alert("你的钱不够了！");
				return false;
			}
			if($('#sum').val()==''){
				alert("请输入购买数量");
				return false;
			}
			if($('#ticketid').val()==null){
				alert("请选择出行信息");
				return false;
			}
			if($('#sum').val()<=0){
				alert("请选择出行信息");
				return false;
			}
			if($('#sum').val()<=row.sum){
				$.messager.confirm('确认','您确定要购买吗？',function(r){
          			if (r){
        	  			var temp = document.getElementById("fm");
        	  			temp.action= "<%=path %>/goodsController/buyGoods.do?goodsid="+row.id;
        	  			temp.submit();
          			}
       			})
			}
			else alert("您输入的购买数量高于库存，请重新输入。");
	   }
		
		function search1() {
			 $('#dg').datagrid({
			        queryParams : {
			        	name:$("#name").val(),
			        	type:$("#type").val()
		 	        },
	           });
		}

		function goodsdetil(value, row, index){
			return '<a href="<%=path %>/goodsController/GoodsDetail.do?goodsId='+ row.id +'&&userid=${user.id}">'+row.name+'</a>';
		}
	</script>
</body>
</html>