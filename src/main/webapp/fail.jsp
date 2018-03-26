<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>  
<html>  
  
    <head>  
        <title>404错误页面</title>  
        <meta charset="utf-8">  
        <meta http-equiv="pragma" content="no-cache">  
        <meta http-equiv="cache-control" content="no-cache">  
        <meta http-equiv="expires" content="0">  
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
        <meta http-equiv="description" content="This is my page">  
        <link rel="stylesheet" href="css/bootstrap.min.css" />  
        <style>  
            body{background: url(img/404.jpg);background-size: cover;}  
            .error{width: 100px;margin: 0 auto;}  
            #count b{font-size: 65px;color:#BF3333;}  
        </style>  
    </head>  
  
    <body>  
        <div class="error">  
            <span id = "count"><b> 5 </b></span>  
            <a class="btn btn-warning" href="index.jsp">点击返回</a>  
        </div>  
        <script type="text/javascript" src="js/jquery.js" ></script>  
        <script type="text/javascript">  
            $(function() {  
                var count = 5;  
                setTimeout(function() {  
                    count--;  
                    if (count <= 0) window.location.href = "index.jsp";  
                    $("#count").html("<b>" + count + "</b>");  
                }, 1000);   
            });  
        </script>  
    </body>  
  
</html>  