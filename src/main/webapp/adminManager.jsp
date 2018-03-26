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
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
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
  					管理员
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
  				<tr><td><h3>所有帖子</h3></td></tr>
  			</table>
  		</div>
  		<div id="second2">
			<table id="dg1" title="所有帖子" class="easyui-datagrid" style="width:99%;height:300px"
				url="<%=path %>/postController/allPostlist.do"
				toolbar="#toolbar1"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="title" width="10%">题目</th>
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
			<a class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:deletepost()">删除</a>
		</div>
  	</div>
  	<div id="third">
  		<div id="third1" align="center">
  			<table>
  				<tr><td><h3>车上小卖部</h3></td></tr>
  			</table>
  		</div>
  		<div id="third2">
			<table id="dg2" title="所有商品" class="easyui-datagrid" style="width:99%;height:300px"
				url="<%=path %>/goodsController/allGoodsList.do"
				toolbar="#toolbar2"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="name" width="15%">名称</th>
            			<th field="type" width="10%">类型</th>
            			<th field="price" width="15%">单价</th>
            			<th field="sum" width="20%">数量</th>
            			<th field="detail" width="30%">描述</th>
            			<th field="salenum" width="10%">销量</th>
        			</tr>
    			</thead>
			</table>
		</div>
		<div id="toolbar2">
  				名称:
  					<input type="text" id="goodsname" name="goodsname"/>
  				类型：
  					<select class="easyui-combobox" id="goodstype" name="goodstype" style="width:20%;">
  							<option value=""></option>
							<option value="熟食">熟食</option>
							<option value="饮品">饮品</option>
							<option value="面包">面包</option>
							<option value="雪糕">雪糕</option>
							<option value="盒饭">盒饭</option>
					</select>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchgoods()">查询</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="addGoods()">新增</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="updateGoods()">修改</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:deletegoods()">删除</a>
		</div>
  	</div>
  	<div id="four">
  		<div id="four1" align="center">
  			<table>
  				<tr><td><h3>列车信息</h3></td></tr>
  			</table>
  		</div>
  		<center>
			<table id="dg3" title="列车信息" class="easyui-datagrid" style="width:100%;height:300px"
				url="<%=path %>/trainController/allTrainlist.do"
				toolbar="#toolbar3"
        		pagination="true" 
        		rownumbers="true" fitColumns="true" singleSelect="true">
    			<thead>
        			<tr>
            			<th field="id" width="15%" data-options="formatter: traindetil">车次</th>
            			<th field="startstationname" width="10%">始发站</th>
            			<th field="endstationname" width="10%">终点站</th>
            			<th field="starttime" width="20%">始发时间</th>
            			<th field="endtime" width="20%">到达时间</th>
            			<th field="runtime" width="25%">运行时间</th>
        			</tr>
    			</thead>
			</table>
		</center>
  	</div>
  	<div id="toolbar3">
  			车次:
  			<input type="text" id="trainid2" name="trainid"/>
			<a class="easyui-linkbutton" iconCls="icon-search" onclick="javascript:searchtrain()">查询</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:addtrain()">新增</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:addtimetable()">添加列车时刻表</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-add" onclick="javascript:editStation()">编辑车站</a>&nbsp;&nbsp;&nbsp;
			<a class="easyui-linkbutton" iconCls="icon-remove" onclick="javascript:deletetrain()">删除</a>
	</div>
	<div id="dlg1" class="easyui-dialog" style="width:500px;height:300px;padding:10px 20px"
            closed="true" buttons="#dlg1-buttons">
   		<form id="fm" action="<%=path %>/adminController/saveGoods.do"  method="post">
    		<table>
    				<tr><td>商品名称:</td><td><input type="text" id="name" name="name" /></td></tr>
    				<tr>
    					<td>类型:</td>
    					<td>
    						<select class="easyui-combobox" id="type" name="type" style="width:40%">
								<option value="熟食">熟食</option>
								<option value="饮品">饮品</option>
								<option value="面包">面包</option>
								<option value="雪糕">雪糕</option>
								<option value="盒饭">盒饭</option>
							</select>
						</td>
					</tr>
					<tr><td>单价:</td><td><input type="number" id="price" name="price"/></td></tr>
					<tr><td>数量:</td><td><input type="number" id="sum" name="sum"/></td></tr>
					<tr><td>描述:</td><td><textarea id="detail" name="detail" cols="50" rows="2"></textarea></td></tr>
					<input type="hidden" id="status" name="status"/>
					<input type="hidden" id="salenum" name="salenum" value="0"/>
					<input type="hidden" id="id" name="id"/>
					<input type="hidden" id="userid" name="userid" value="${user.id }"/>
    		</table>
    	</form>
    	<div id="dlg1-buttons">
        	<a class="easyui-linkbutton" iconCls="icon-ok" onclick="savegoods()">提交</a>
        	<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
    	</div>
    </div>
    
    
    
    
    
    
    
    <div id="dlg2" class="easyui-dialog" style="width:600px;height:350px;padding:10px 20px"
            closed="true" buttons="#dlg2-buttons">
   		<form id="fm1" action="<%=path %>/adminController/saveTrain.do"  method="post">
    		<table>
    				<tr><td>车次:</td><td><input type="text" id="addtrainid" name="id" /></td></tr>
    				<tr>
    					<td>始发站:</td>
    					<td>
    						<select class="easyui-combobox" id="startstation" name="startstation" style="width:40%">
    							<c:forEach items="${stationlist }" var="stationlist">
    								<option value="${stationlist.id }">${stationlist.name }</option>
    							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
    					<td>终点站:</td>
    					<td>
    						<select class="easyui-combobox" id="endstation" name="endstation" style="width:40%">
    							<c:forEach items="${stationlist }" var="stationlist">
    								<option value="${stationlist.id }">${stationlist.name }</option>
    							</c:forEach>
							</select>
						</td>
					</tr>
					<tr><td>出发时间:</td><td><input type="time" id="starttime" name="starttime"/></td></tr>
					<tr><td>到达时间:</td><td><input type="time" id="endtime" name="endtime"/></td></tr>
					<tr><td>运行时间:</td><td><input type="number" id="hour" style="width:25%" />时
											 <input type="number" id="min" style="width:25%" />分
										 </td>
					</tr>
					<tr><td>车厢数:</td><td><input type="number" id="cellnum" name="cellnum"/></td></tr>
					<tr><td>车厢座位数:</td><td><input type="number" id="chairnum" name="chairnum"/></td></tr>
					<input type="hidden" id="userid" name="userid" value="${user.id }"/>
					<input type="hidden" id="runtime" name="runtime"/>
    		</table>
    	</form>
    	<div id="dlg2-buttons">
        	<a class="easyui-linkbutton" iconCls="icon-ok" onclick="savetrain()">提交</a>
        	<a class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg2').dialog('close')">取消</a>
    	</div>
    </div>
    
	<div>
  		<form id="temp" method="post"><input type="hidden" name="userid" value="${user.id }"/></form>
  	</div>
	<script type="text/javascript">
		function traindetil(value, row, index){
			return '<a href="<%=path %>/trainController/TrainDetail.do?trainId='+ row.id +'&&userid=${user.id}">'+row.id+'</a>';
		}
		function searchpost() {
			 $('#dg1').datagrid({
			        queryParams : {
			        	trainid:$("#trainid1").val(),
			        	type:$("#type").val()
		 	        },
	           });
		}
		
		function deletepost(){
			var row = $('#dg1').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
  				$.messager.confirm('确认','您确定要删除吗？',function(r){
		          if (r){
		        	  	var temp = document.getElementById("temp");
		        	  	temp.action= "<%=path %>/adminController/deletePost.do?postid="+row.id;
		        	  	temp.submit();
		        	  }
		       })
      	  	}
  		}
		
		function searchgoods() {
			 $('#dg2').datagrid({
			        queryParams : {
			        	name:$("#goodsname").val(),
			        	type:$("#goodstype").val()
		 	        },
	           });
		}
		function deletegoods(){
			var row = $('#dg2').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
  				$.messager.confirm('确认','您确定要删除吗？',function(r){
		          	if (r){
		        	  	var temp = document.getElementById("temp");
		        	  	temp.action= "<%=path %>/adminController/deleteGoods.do?goodsid="+row.id;
		        	  	temp.submit();
		        	 }
		       })
      	  	}
  		}
		function addGoods(){
			$('#dlg1').dialog('open').dialog('setTitle','新增商品');
			$('#dlg1').window('center');
			$('#name').val('');
			$('#type').combobox("setValue",'');
			$('#price').val('');
			$('#sum').val('');
			$('#detail').val('');
			$('#status').val('add');
		}
		function updateGoods(){
			var row = $('#dg2').datagrid('getSelected');
			if(row==null){
				alert("未选择数据行");
				return false;
			}
			$('#dlg1').dialog('open').dialog('setTitle','修改商品');
			$('#dlg1').window('center');
			$('#id').val(row.id);
			$('#name').val(row.name);
			$('#type').combobox("setValue",row.type);
			$('#price').val(row.price);
			$('#sum').val(row.sum);
			$('#detail').val(row.detail);
			$('#salenum').val(row.salenum);
			$('#status').val('update');
		}
		function savegoods(){
			if($('#name').val()==""){
				alert("请输入商品名称");
				return false;
			}
			else if($('#price').val()==""){
				alert("请输入商品单价");
				return false;
			}
			else if($('#sum').val()==""){
				alert("请输入商品数量");
				return false;
			}
			else if($('#detail').val()==""){
				alert("请输入商品描述");
				return false;
			}
			else if(!(check($('#sum').val(),$('#price').val()))){
				alert("请正确填写商品数量与商品单价");
				return false;
			}
			$('#fm').submit();
		}
		
		function searchtrain() {
			 $('#dg3').datagrid({
			        queryParams : {
			        	trainid:$("#trainid2").val(),
		 	        },
	           });
		}
		function deletetrain(){
			var row = $('#dg3').datagrid('getSelected');
      	  	if(row==null){
      		  	alert("未选中数据行");
      	  	}else{
				$.messager.confirm('确认','您确定要删除吗？',function(r){
		          	if (r){
		        	  		var temp = document.getElementById("temp");
		        	  		temp.action= "<%=path %>/adminController/deleteTrain.do?trainid="+row.id;
		        	  		temp.submit();
		          	}
		       	})
      	  	}
		}
		function addtrain(){
			$('#dlg2').dialog('open').dialog('setTitle','新增列车');
		}
		function savetrain(){
			if($('#addtrainid').val()==""){
				alert("请输入列车ID");
				return false;
			}
			else if($('#startstation').combobox("getValue")==null){
				alert("请选择始发站");
				return false;
			}
			else if($('#endstation').combobox("getValue")==null){
				alert("请选择终点站");
				return false;
			}
			else if($('#starttime').val()==""){
				alert("请输入开车时间");
				return false;
			}
			else if($('#endtime').val()==""){
				alert("请输入到站时间");
				return false;
			}
			else if(!check($('#cellnum').val(),1)){
				alert("车厢数输入不合理");
				return false;
			}
			else if(!check($('#chairnum').val(),1)){
				alert("座位数输入不合理");
				return false;
			}
			var min = $('#min').val();
			var hour = $('#hour').val();
			var runtime = hour+":"+min;
			$('#runtime').val(runtime);
			$('#fm1').submit();
		}
		function addtimetable(){
			var row = $('#dg3').datagrid("getSelected");
			if(row==null){
				alert("未选中数据行");
				return;
			}
			layer.ready(function(){ 
			  	layer.open({
			    	type: 2,
			    	title: "添加列车时刻表",
			    	maxmin: true,
			    	area: ['800px', '500px'],
			  		content: '<%=path %>/adminController/addTimetable.do?trainid='+row.id,
			  	});
			});
		}
		
		function editStation(){
			layer.ready(function(){ 
			  	layer.open({
			    	type: 2,
			    	title: "编辑车站",
			    	maxmin: true,
			    	area: ['800px', '500px'],
			  		content: '<%=path %>/adminController/editStation.do',
			  	});
			});
		}
		
		function check(sum,price){
			var reg = /^[0-9]+$/;
			var reg1 = /^[0-9]+(.[0-9]{2})?$/;
			if(reg.test(sum)&&reg1.test(price)){
				return true;
			}
			else return false;
		}
	</script>
  </body>
</html>
