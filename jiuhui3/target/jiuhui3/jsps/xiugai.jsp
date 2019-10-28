<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/9/10
  Time: 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form role="form" class="from-horizontal" action="${pageContext.request.contextPath }/userController/update">
    <div class="from-group">
        <h4> <label for="id" class="col-sm-1 control-label">ID</label></h4>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="id" name="id" value="${user.id}">
        </div>
    </div>
    <div class="col-sm-10">
        <p></p>
    </div>
    <div class="col-sm-12">
        <p></p>
    </div>
    <div class="from-group">
        <h4> <label for="password" class="col-sm-1 control-label">密码</label></h4>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="password" name="password" placeholder="请输入密码">
        </div>
    </div>
    <div class="col-sm-8">
        <p></p>
    </div>
    <div class="col-sm-8">
        <p></p>
    </div>
    <div class="col-sm-8">
        <p></p>
    </div>
    <div class="col-sm-8">
        <p></p>
    </div>
    <div class="col-sm-3">
        <input type="submit" class="btn btn-primary" value="修改">
    </div>
</form>
</body>
</html>
