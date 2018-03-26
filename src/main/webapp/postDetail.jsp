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
	<title>${post.title }</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
  			</tr>
  		</table>
  	</div>
  	<div id="first">
  		<h5>点击数:${post.clicknum }</h5>
  		<table width="100%">
  			<tr><center><h1>${post.title }</h1></center></tr>
			<tr height="20px"><td align="right" >${post.type }</td></tr>
			<tr><td>${post.content }</td></tr>
			<tr height="20px"><td align="right" >${post.publicUser}&nbsp;&nbsp;发表于&nbsp;&nbsp;${post.date }</td></tr>
			<tr><td><a href="#" onclick="comment()" >发表评论</a></td></tr>
		</table>
	</div>
	<div id="second">
		<table width="100%">
			<c:forEach items="${commentlist}" var="commentlist">
			<tr><td width="90%">${commentlist.comment.content }</td><td width="10%"><a href="#" onclick="reply(this)">回复</a></td></tr>
			<form action="<%=path %>/postController/publicReply.do" method="post">
				<tr style="display:none">
					<td width="90%">
						<textarea name="content" cols="100" rows="2"></textarea>
						<input type="hidden" name="comment_id" value="${commentlist.comment.id }">
						<input type="hidden" name="reply_username" value="${user.username }">
						<input type="hidden" name="be_reply_username" value="${commentlist.comment.comment_user }">
						<input type="hidden" id="postid" name="postid" value="${post.id }"/>
            			<input type="hidden" id="userid" name="userid" value="${user.id }" />
					</td>
					<td width="10%">
						<input type="submit" value="提交" />
					</td>
				</tr>
			</form>
			<tr height="20px"><td align="right" colspan="2">${commentlist.comment.comment_user}&nbsp;&nbsp;发表于&nbsp;&nbsp;${commentlist.comment.comment_date }</td></tr>
				<c:forEach items="${commentlist.reply}" var="reply">
					<tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reply.reply_username}回复：${reply.be_reply_username }</td></tr>
   					<tr><td width="90%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reply.content }</td>
						<td width="10%"><a href="#" onclick="reply(this)">回复</a></td>
					</tr>
					<form action="<%=path %>/postController/publicReply.do" method="post">
					<tr style="display:none">
						<td width="90%">
							<textarea name="content" cols="100" rows="2"></textarea>
							<input type="hidden" name="comment_id" value="${commentlist.comment.id }">
							<input type="hidden" name="reply_username" value="${user.username }">
							<input type="hidden" name="be_reply_username" value="${reply.reply_username }">
							<input type="hidden" id="postid" name="postid" value="${post.id }"/>
            				<input type="hidden" id="userid" name="userid" value="${user.id }" />
						</td>
						<td width="10%">
							<input type="submit" value="提交" />
						</td>
					</tr>
				</form>
						
   				</c:forEach>
   			</c:forEach>
		</table>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
   		<form id="fm" action="<%=path %>/postController/publicComment.do"  method="post">
    		<table>
    			<div class="fitem">
              		<tr>
                		<td>评论内容：</td>
              		</tr>
              		<tr>
                		<td><textarea name="content" cols="50" rows="10"></textarea></td>
              		</tr>
            	</div>
            	<input type="hidden" name="post_id" value="${post.id }" />
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
	<script>
		function comment(){
			$('#dlg').dialog('open').dialog('setTitle','发表评论');
		}
		function publicComment(){
			$('#fm').submit();
		}
		function reply(nowEle){
			var nextEle = nowEle.parentNode.parentNode.nextSibling.nextSibling.nextSibling.nextSibling;
			if(nextEle.style.display=='none'){
				nextEle.style.display='block';
			}
			else {nextEle.style.display='none';}
		}
		function publicReply(){
			$('#fm1').submit();
		}
	</script>
</body>
</html>