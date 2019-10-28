<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
	<%
session=request.getSession();
Object obj=session.getAttribute("user");
if(obj==null){
	response.sendRedirect(request.getContextPath()+"/jsps/login.jsp");
}
%>
	<head>
		<meta charset="utf-8" />
		<title>酒会台管理系统  </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstraps1.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/table/bootstrap-table2.css">

		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />

		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/styles.css"/>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap-tab.css">
		<script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.js"></script>
		<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
		</script>
		<script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap-closable-tab.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/closable-tab-div.js"></script>
		<script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>

		<script src="${pageContext.request.contextPath}/static/assets/js/ace-elements.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/assets/js/ace.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
        <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/assets/jquery.nicescroll.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/common/dataFormater.js" type="text/javascript"></script>
        <style>.modal-backdrop{z-index:0;}</style>
	</head>
	<body>



