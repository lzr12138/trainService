<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>${user.username }个人首页</title>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>  
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>  
	<script src="<%=request.getContextPath()%>/js/artDialog-5.0.3/artDialog.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/default/easyui.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/themes/icon.css" type="text/css"></link>  
	<link rel="stylesheet" href="<%=request.getContextPath()%>/js/artDialog-5.0.3/skins/default.css"/>
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
  		<table width="100%" align="right">
  			<tr>
  				<td width="80%">请记住您的Id:&nbsp;&nbsp;&nbsp;<font style="color:red">"${user.id }"</font>&nbsp;&nbsp;&nbsp;,方便下次登录</td>
  				<td width="10%"><a href="<%=path %>/muserController/First.do?id=${user.id}">首页</a></td>
  				<td width="10%">
  					${user.username}
  					<a href="<%=path %>/muserController/zhuxiao.do">注销</a>
  				</td>
  			</tr>
  		</table>
  	</div>
  	<div id="first" align="center">
  			<table width="80%">
  				<tr><td align="right" colspan="2">钱包余额:${user.money }&nbsp;&nbsp;<a href="#" onclick="kejining()">充值</a></td></tr>
  				<tr height="50px"><td colsapn="2"><h1>${user.username }个人首页</h1></td></tr>
  				<tr height="10px">
  					<td align="right" width="90%">
  						<a href="<%=path %>/muserController/getChange.do?userid=${user.id}" >换座申请</a>&nbsp;&nbsp;
  						<a href="<%=path %>/muserController/editPost.do?publicUserId=${user.id}&&publicUser=${user.username}" >发帖</a>
  					</td>
  				</tr>
  				<input type="hidden" id="tempuserid" value="${user.id }">
  			</table>
  		</div>
  	<div id="second">
  		<div id="second1" align="center">
  			<table>
  				<tr><td><h3>你的帖子</h3></td></tr>
  			</table>
  		</div>
  		<div id="second2">
			<table id="dg1" class="easyui-datagrid" style="width:100%;height:400px"
				url="<%=path %>/postController/userPost.do?publicUserId=${user.id }"
        		toolbar="#toolbar1"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true" >
    			<thead>
        			<tr>
            			<th field="title" width="10%" data-options="formatter: detil">题目</th>
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
		<div id="toolbar1">
  			列车号:<input type="text" id="trainid1" name="trainid" />
  				类型：
  					<select class="easyui-combobox" id="type" name="type" style="width:20%;">
  							<option value=""></option>
							<option value="寻物启事">寻物启事</option>
							<option value="失物招领">失物招领</option>
							<option value="找人">找人</option>
							<option value="感谢信">感谢信</option>
							<option value="其他">其他</option>
					</select>
				</td>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchpost()">查询</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:remove()">删除此贴</a>
		</div>
  	</div>
  	<div id="third">
  		<div id="third1" align="center">
  			<table>
  				<tr><td><h3>购买记录</h3></td></tr>
  			</table>
  		</div>
  		<div id="third2">
			<table id="dg2" class="easyui-datagrid" style="width:100%;height:400px"
				url="<%=path %>/goodsController/userCost.do?userid=${user.id }"
        		toolbar="#toolbar2"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true" >
    			<thead>
        			<tr>
            			<th field="username" width="15%">购买人</th>
            			<th field="goodsname" width="20%" data-options="formatter: goodsdetil">商品名称</th>
            			<th field="trainid" width="20%">预定车次</th>
            			<th field="sum" width="15%">购买数量</th>
            			<th field="total" width="20%">总花费</th>
            			<th field="date" width="30%">购买时间</th>
        			</tr>
    			</thead>
			</table>
		</div>
		<div id="toolbar2">
  				名称:
  					<input type="text" id="goodsname" name="goodsname"/>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchgoods()">查询</a>&nbsp;&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:remove1()">删除此记录</a>
		</div>
  	</div>
  	<div id="four">
  		<div id="four1" align="center">
  			<table>
  				<tr><td><h3>出行记录</h3></td></tr>
  			</table>
  		</div>
  		<div id="four2">
			<table id="dg3" class="easyui-datagrid" style="width:100%;height:400px"
				url="<%=path %>/trainController/ticketList.do?userid=${user.id }"
        		toolbar="#toolbar3"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true" >
    			<thead>
        			<tr>
            			<th field="trainid" width="15%" data-options="formatter: traindetil">车次</th>
            			<th field="instationname" width="20%" data-options="formatter: sstationdetil">入站</th>
            			<th field="outstationname" width="15%" data-options="formatter: estationdetil">出站</th>
            			<th field="cellid" width="20%">车厢号</th>
            			<th field="chairid" width="20%">座位号</th>
            			<th field="date" width="30%">购买时间</th>
        			</tr>
    			</thead>
			</table>
		</div>
		<div id="toolbar3">
  			车次:
  			<input type="text" id="trainid2" name="trainid"/>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchtrain()">查询</a>&nbsp;&nbsp;&nbsp;
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:remove2()">删除此记录</a>
		</div>
  	</div>
  	<div>
  		<form id="temp" method="post"><input type="hidden" name="userid" value="${user.id }"/></form>
  	</div>
  	<div id="dlg1" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"
            closed="true" buttons="#dlg1-buttons">
   		<form id="fm1" method="post">
    		<table>
    			<div class="fitem">
              		<tr>
                		<td>充值金额：</td>
                		<td><input type="text" id="money" name="money" /></td>
              		</tr>
            	</div>
            	<input type="hidden" name="userid" value="${user.id }" />
    		</table>
    	</form>
    	<div id="dlg1-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="kejin()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
    	</div>
	</div>
  	<script type="text/javascript">
  		
  		function remove(){
  			var row = $('#dg1').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
  			$.messager.confirm('确认','您确定要删除吗？',function(r){
		          if (r){
		        	  var temp = document.getElementById("temp");
		        	  temp.action= "<%=path %>/postController/deletePost.do?id="+row.id;
		        	  temp.submit();
		          }
		       })
      	  	}
  		}
  		function searchpost() {
			 $('#dg1').datagrid({
			        queryParams : {
			        	trainid:$("#trainid1").val(),
			        	type:$("#type").val()
		 	        },
	           });
		}
  		
  		function remove1(){
  			var row = $('#dg2').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
  			$.messager.confirm('确认','您确定要删除吗？',function(r){
		          if (r){
		        	  var temp = document.getElementById("temp");
		        	  temp.action= "<%=path %>/muserController/deleteCost.do?id="+row.id;
		        	  temp.submit();
		          }
		       })
      	  	}
  		}
  		function searchgoods() {
			 $('#dg2').datagrid({
			        queryParams : {
			        	goodsname:$("#goodsname").val(),
		 	        },
	           });
		}
  		
  		function remove2(){
  			var row = $('#dg3').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
  			$.messager.confirm('确认','您确定要删除吗？',function(r){
		          if (r){
		        	  var temp = document.getElementById("temp");
		        	  temp.action= "<%=path %>/muserController/deleteTicket.do?id="+row.id;
		        	  temp.submit();
		          }
		       })
      	  	}
  		}
  		function searchtrain() {
			 $('#dg3').datagrid({
			        queryParams : {
			        	trainid:$("#trainid2").val(),
		 	        },
	           });
		}
  		
		function detil(value, row, index){
			return '<a href="<%=path %>/postController/PostDetail.do?postId='+ row.id +'&&userid=${user.id}">'+row.title+'</a>';
		}
		function goodsdetil(value, row, index){
			return '<a href="<%=path %>/goodsController/GoodsDetail.do?goodsId='+ row.goodsid +'&&userid=${user.id}">'+row.goodsname+'</a>';
		}
		function traindetil(value, row, index){
			return '<a href="<%=path %>/trainController/TrainDetail.do?trainId='+ row.trainid +'&&userid=${user.id}">'+row.trainid+'</a>';
		}
		function sstationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.instationid +'&&userid=${user.id}">'+row.instationname+'</a>';
		}
		function estationdetil(value, row, index){
			return '<a href="<%=path %>/trainController/StationDetail.do?stationId='+ row.outstationid +'&&userid=${user.id}">'+row.outstationname+'</a>';
		}
		function kejining(){
			$('#dlg1').dialog('open').dialog('setTitle','充值');
		}
		function kejin(){
			if($('#money').val()==''){
				alert("请输入充值金额");
				return false;
			}
			else if($('#money').val()>10000){
				alert("充值金额不得大于10000");
				return false;
			}
			$.messager.confirm('确认','您确定要充值吗？',function(r){
      			if (r){
    	  			var temp = document.getElementById("fm1");
    	  			temp.action= "<%=path %>/muserController/kejin.do";
    	  			temp.submit();
      			}
   			})
   		}
	</script>
</body>
</html>