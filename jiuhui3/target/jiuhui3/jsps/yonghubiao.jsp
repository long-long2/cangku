<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/10/21
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"  href="${pageContext.request.contextPath}/static/css/imageUpload.css"/>

    <script src="${pageContext.request.contextPath}/static/js/uploadImg1.js"></script>
</head>
<body>
<table id="tianjia7"></table>
</body>
<script type="text/javascript">
    $(function(){
        $("#tianjia7").bootstrapTable({
            url:"${pageContext.request.contextPath}/shu/findall",
            pagination:true,
            sidePagination:'client',
            pageNumber:1,
            pageSize:3,
            pageList:[3,5,10],
            sortName:"cid",
            sortOrder:"desc",
            //strictSearch:true,

            columns:[
                {
                    field:"id",
                    title:"编号"
                },
                {
                    field:"username",
                    title:"名称"
                },
                {
                    field:"usercode",
                    title:"code信息"

                },

                {
                    field:"level",
                    title:"级别"
                },
                {
                    title:"操作"

                }
            ]
        })
    })
</script>
</html>
