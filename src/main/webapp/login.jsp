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
	<title>登陆</title>
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
        	margin-top: 12%;
        	margin-left: 10%;
            width: 80%;
        }
    </style>
</head>
<body>

	<div id="top">
		<table width="50px" align="right">
  			<tr><td><a href="#" onclick="register()">注册</a></td></tr>
  		</table>
  	</div>
  	<div id="first">
  		<center>
  			<h2>登录界面</h2>
  			<form id="fm" action="<%=path %>/muserController/login.do" method="post">
  				<table width="300px">
              		<tr>
                		<td><label>ID:</label></td>
                		<td><input type="text" id="id" name="id" required="required"/></td>
              		</tr>
              		<tr>
                		<td><label>密码:</label></td>
                		<td><input type="password" id="userpsw" name="userpsw" required="required"/></td>
              		</tr>
              		<tr>
                		<td><label>权限:</label></td>
                		<td>
                			<select name="root">
                				<option value="U" selected>普通用户</option>
                				<option value="A">管理员</option>
                			</select>
                		</td>
              		</tr>
              		<tr>
                		<td><a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="login()">登陆</a></td>
        				<td><input type="reset" /></a></td>
              		</tr>
    			</table>
  			</form>
  		</center>
  	</div>
  	<div id="dlg1" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg1-buttons">
   		<form id="fm1" action="<%=path %>/muserController/register.do" method="post">
    	<table>
              <tr>
                <td><label>用户名:</label></td>
                <td><input id="username" name="username" required="true" /></td>
              </tr>
              <tr>
                <td><label>密码:</label></td>
                <td><input type="password" id="userpsw2" name="userpsw" required="true" /></td>
              </tr>
              <tr>
                <td><label>再次输入密码:</label></td>
                <td><input type="password" id="userpsw1" name="userpsw1" required="true" /></td>
              </tr>
              <tr>
                <td><label>性别:</label></td>
                <td>
                	<select id="sex" name="sex" required="true" >
                		<option value=""></option>
                		<option value="男">男</option>
                		<option value="女">女</option>
                	</select>
                </td>
              </tr>
              <tr>
                <td><label>邮箱:</label></td>
                <td><input type="email" id="email" name="email" /></td>
              </tr>
              <tr>
                <td><label>年龄:</label></td>
                <td><input id="age" name="age" /></td>
              </tr>
    	</table>
    	</form>
    	<div id="dlg1-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="registering()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg1').dialog('close')">取消</a>
    	</div>
	</div>
  	<script>
  		function login(){
  			if($('#id').val()==""){
  				alert("请填写ID");
  				return;
  			}
  			else if($('#userpsw').val()==""){
  				alert("请输入密码");
  				return;
  			}
  			else{
  			  $('#fm').submit();
  			}
		}
		function register(){
	        $('#dlg1').dialog('open').dialog('setTitle','注册');
	        $('#dlg1').window('center');
	        $('#fm1').form('clear');
		}
		function registering(){
			if($('#username').val()==""){
  				alert("请填写用户名");
  				return false;
  			}
  			else if($('#userpsw2').val()==""){
  				alert("请填写密码");
  				return false;
  			}
  			else if($('#userpsw1').val()==""){
  				alert("请填写密码");
  				return false;
  			}
  			else if($('#sex').val()==null){
  				alert("请填写性别");
  				return false;
  			}
			var emailStr=$('#email').val();
			var emailPat=/^(.+)@(.+)$/;
			var matchArray=emailStr.match(emailPat);
			if (matchArray==null) {
			alert("电子邮件地址必须包括 ( @ 和 . )")
			return false;
			}
			var userpsw = $('#userpsw2').val();
			var userpsw1 = $('#userpsw1').val();
			alert("1"+userpsw+"2"+userpsw1);
			if(userpsw==userpsw1){
				$('#fm1').submit();
			}
			else {
				alert("两次密码输入不一致！");
				$('#userpsw2').val('');
				$('#userpsw1').val('');
			}
		}
	</script>
</body>
</html>