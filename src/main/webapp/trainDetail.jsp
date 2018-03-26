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
	<title>${train.id }详情</title>
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
        #third
        {
        	margin-left: 10%;
        	margin-top: 10px;
            border: 1px solid #76A7E9;
            width: 80%;
        }
    </style>
</head>
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
  		<table width="100%">
  			<tr><td colspan="6"><center><h1>${train.id }次列车</h1></center></td></tr>
			<tr height="50px">
				<td align="center" >始发站</td>
				<td align="center" >出发时间</td>
				<td align="center" >终点站</td>
				<td align="center" >到达时间</td>
				<td align="center" >运行时间</td>
				<td align="center" >车厢数</td>
			</tr>
			<tr height="50px">
				<td align="center" >${startstation.name }</td>
				<td align="center" >${train.starttime }</td>
				<td align="center" >${endstation.name }</td>
				<td align="center" >${train.endtime }</td>
				<td align="center" >${train.runtime }</td>
				<td align="center" >${train.cellnum }</td>
			</tr>
			<%-- <tr><td align="center" >运行时间:${train.runtime }</td><td><a href="#" onclick="eaitTicket()">添加出行信息</a></td></tr> --%>
		</table>
	</div>
	<div id="second">
	<h5>列车时刻表</h5>
  		<table width="100%">
  			<tr height="50px">
  				<td align="center" >站名</td>
  				<td align="center" >入站时间</td>
  				<td align="center" >出战时间</td>
  				<td align="center" >停车时间</td>
  			</tr>
			<tr height="50px">
				<td align="center" ><a href="<%=path %>/trainController/StationDetail.do?stationId=${startstation.id }&&userid=${user.id}">${startstation.name }</a></td>
				<td align="center" >始发</td>
				<td align="center" >${train.starttime }</td>
				<td align="center" >---</td>
			</tr>
			<c:forEach	items="${stationlist }" var="stationlist">
				<tr height="50px">
					<td align="center" ><a href="<%=path %>/trainController/StationDetail.do?stationId=${stationlist.stationid }&&userid=${user.id}">${stationlist.stationname }</a></td>
					<td align="center" >${stationlist.intime }</td>
					<td align="center" >${stationlist.outtime }</td>
					<td align="center" >${stationlist.stoptime }分</td></tr>
			</c:forEach>
			<tr height="50px">
				<td align="center" ><a href="<%=path %>/trainController/StationDetail.do?stationId=${endstation.id }&&userid=${user.id}">${endstation.name }</a></td>
				<td align="center" >${train.endtime }</td>
				<td align="center" >终点</td>
				<td align="center" >---</td>
			</tr>
		</table>
	</div>
	<div id="third">
		<h5>您在此次列车的未完成出行</h5><a href="#" onclick="eaitTicket()">添加出行信息</a></td>
		<table width="100%">
			<tr height="50px">
				<td align="center">出发站</td>
				<td align="center">到达站</td>
				<td align="center">车厢号</td>
				<td align="center">座位号</td>
				<td align="center">日期</td>
				<td align="center">操作</td>
			</tr>
			<c:forEach items="${ticketlist}" var="ticketlist">
				<tr height="50px">
					<td align="center">${ticketlist.instationname }</td>
					<td align="center">${ticketlist.outstationname }</td>
					<td align="center">${ticketlist.cellid }</td>
					<td align="center">${ticketlist.chairid }</td>
					<td align="center">${ticketlist.date }</td>
					<td align="center"><a href="#" onclick="trainDetail('${ticketlist.id}')">查看详情</a></td>
				</tr>
			</c:forEach>
		
		</table>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:300px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
   		<form id="fm" action="<%=path %>/trainController/publicTicket.do"  method="post">
    		<table>
    			<div class="fitem">
    				<tr><td>车次:</td><td>${train.id }</td></tr>
    				<tr><td>出行人:</td><td>${user.username }</td></tr>
    				<tr>
    					<td>出发站:</td>
    					<td>
    						<select name="instationid" >
    							<option value="${startstation.id }">${startstation.name }</option>
    							<c:forEach  var="stationlist"  items="${stationlist}">
             						<option  value="${stationlist.stationid}">${stationlist.stationname}</option>
             					</c:forEach>
             					<option value="${endstation.id }">${endstation.name }</option>
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<td>到达站:</td>
    					<td>
    						<select name="outstationid" >
    							<option value="${startstation.id }">${startstation.name }</option>
    							<c:forEach  var="stationlist"  items="${stationlist}">
             						<option  value="${stationlist.stationid}">${stationlist.stationname}</option>
             					</c:forEach>
             					<option value="${endstation.id }">${endstation.name }</option>
    						</select>
    					</td>
    				</tr>
    				<tr><td>出行日期:</td><td><input type="date" name="date" /></td></tr>
    				<tr><td>车厢号:</td><td><input type="text" name="cellid"/></td></tr>
    				<tr><td>座位号:</td><td><input type="text" name="chairid"/></td></tr>
    				<input type="hidden" name="userid" value="${user.id }"/>
    				<input type="hidden" name="trainid" value="${train.id }"/>
              	</div>
    		</table>
    	</form>
    	<div id="dlg-buttons">
        	<a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="publicTicket()">提交</a>
        	<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    	</div>
    	<div>
    		<form id="fm1" action="<%=path %>/trainController/CellForTrain.do" method="post">
    			<input type="hidden" name="userid" value="${user.id } "/>
    			<input type="hidden" name="trainid" value="${train.id } "/>
    			<input type="hidden" id="ticketid" name="ticketid" />
    		</form>
    	</div>
	</div>
	<script type="text/javascript">
		function eaitTicket(){
			$('#dlg').dialog('open').dialog('setTitle','输入出行信息');
		}
		function publicTicket(){
			$('#fm').submit();
		}
		function trainDetail(ticketid){
			document.getElementById('ticketid').value = ticketid ;
			$('#fm1').submit();
		}
	</script>

</body>
</html>