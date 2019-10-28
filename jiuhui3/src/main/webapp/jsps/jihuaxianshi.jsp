<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/10/11
  Time: 9:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<button class="btn btn-primary" id="on">倒出</button>
<table id="jihua"></table>
</body>
<script type="text/javascript">
    $(function(){
        $("#jihua").bootstrapTable({
            url:"${pageContext.request.contextPath}/userController/tongji",
            pagination:true,
            sidePagination:'client',
            pageNumber:1,
            pageSize:3,
            pageList:[3,5,10],
            //strictSearch:true,
            columns:[
                {
                    field:"areaName",
                    title:"省份"
                },
                {
                    field:"numActivities",
                    title:"计划桌数"
                },
                {
                    field:"numActual",
                    title:"实际桌数"
                },
                {
                    field:"newClient",
                    title:"新客户"
                },
                {
                    field:"oldClient",
                    title:"旧客户"
                },
                {
                    field:"yxClient",
                    title:"意向客户"
                },
                {
                    field:"money",
                    title:"钱"
                }
            ]
        })
    })


    $(function(){
        $("#on").click(function(){

                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/daochu1/dao2',
                    dataType:'json',
                    success:function(data){
                        alert("成功")
                    },
                    error:function(msg){
                        alert("error")
                    }
                })
        })
    })
</script>
</html>
