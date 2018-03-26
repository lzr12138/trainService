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
	<title>${goods.name }详细信息</title>
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
  				<input type="hidden" id="themoney" value="${user.money }" />
  			</tr>
  		</table>
  	</div>
  	<div id="first">
  		<table width="100%" align="center">
  			<tr><td colspan="2" align="right"><h5><a href="#" onclick="buying()">购买</a></h5></td></tr>
  			<tr><td colspan="2"><center><h5>${goods.name }</h5></center></td></tr>
  			<tr><td align="center">类型:${goods.type }</td><td align="center">单价:${goods.price }</td></tr>
			<tr><td align="center">库存:${goods.sum }</td><td align="center">销量:${goods.salenum }</td></tr>
			<tr><td align="center" colspan="2"><br><br><br>商品描述</td></tr>
			<tr><td colspan="2">${goods.detail }</td></tr>
			<tr><td align="right" colspan="2"><a href="#" onclick="comment()" >发表评论</a></td></tr>
			<input type="hidden" id="goodssum" value="${goods.sum }" />
			<input type="hidden" id="getgoodsid" value="${goods.id }" />
			<input type="hidden" id="price" value="${goods.price }" />
		</table>
	</div>
	<div id="second">
		<table width="100%">
			<c:forEach items="${commentlist}" var="commentlist">
				<tr><td width="90%">${commentlist.content }</td></tr>
				<tr height="20px"><td align="right" colspan="2">${commentlist.comment_user}&nbsp;&nbsp;发表于&nbsp;&nbsp;${commentlist.comment_date }</td></tr>
   			</c:forEach>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
   		<form id="fm" action="<%=path %>/goodsController/publicComment.do"  method="post">
    		<table>
    			<div class="fitem">
              		<tr>
                		<td>评论内容：</td>
              		</tr>
              		<tr>
                		<td><textarea name="content" cols="50" rows="10" required="required"></textarea></td>
              		</tr>
            	</div>
            	<input type="hidden" name="goods_id" value="${goods.id }" />
            	<input type="hidden" name="comment_user" value="${user.username }" />
            	<input type="hidden" name="userid" value="${user.id }" />
            	<input type="hidden" name="comment_date" value="<%=date %>" />
    		</table>
    	</form>
    	<div id="dlg-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="publicComment()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    	</div>
	</div>
	<div id="dlg1" class="easyui-dialog" style="width:400px;height:180px;padding:10px 20px"
            closed="true" buttons="#dlg1-buttons">
   		<form id="fm1" method="post">
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
    	<div id="dlg1-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="buy()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
    	</div>
	</div>
	<script>
	
		function buying(){
			var sum = $('#goodssum').val();
			var money = $('#themoney').val();
  			if(money ==0){
  				alert("你没钱了！！！！");
  				return false;
  			}
			if(sum!=0){
				$('#dlg1').dialog('open').dialog('setTitle','购买');
			}
			else alert("该商品库存为0，暂时不能购买。");
		}

		function buy(){
			var sum = parseInt($('#goodssum').val());
			var row = $('#getgoodsid').val();
			var money = $('#themoney').val();
			var price = $('#price').val();
			var total = $('#sum').val() * price;
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
			alert(sum);
			alert($('#sum').val());
			alert($('#sum').val()<=sum);
			if($('#sum').val()<=sum){
				$.messager.confirm('确认','您确定要购买吗？',function(r){
      				if (r){
    	  				var temp = document.getElementById("fm1");
    	  				temp.action= "<%=path %>/goodsController/buyGoodsOnDetail.do?goodsid="+row;
    	  				temp.submit();
      				}
   				})
			}
			else alert("您输入的购买数量高于库存，请重新输入。");
   		}
	
		function comment(){
			$('#dlg').dialog('open').dialog('setTitle','发表评论');
		}
		function publicComment(){
			$('#fm').submit();
		}
	</script>
</body>
</html>

</body>
</html>