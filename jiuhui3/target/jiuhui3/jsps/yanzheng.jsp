<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/9/11
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstraps1.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/table/bootstrap-table.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/styles.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/css/bootstrap-tab.css">
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>

    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
    </script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/bootstrap-closable-tab.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/static/bootstrap-3.3.7-dist/js/closable-tab-div.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/common/dataFormater.js" type="text/javascript"></script>
</head>
<body>
<table id="pid"></table>
</body>
<script>
    $(function(){
        $("#pid").bootstrapTable({
            url:"${pageContext.request.contextPath}/userController/getlist",
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
                    field:"activitiesName",
                    title:"计划名称"
                },
                {
                    field:"numActivities",
                    title:"计划桌数"
                },
                {
                    field:"startTime",
                    title:"开始时间",
                    formatter:function (value,rows,index) {
                        var dd=new Date(value)
                        return dateFormats(dd);
                    }
                },
                {
                    field:"endTime",
                    title:"结束时间",
                    formatter:function (value,rows,index) {
                        var dd=new Date(value)
                        return dateFormats(dd);
                    }
                },
                {
                    field:"timestamp",
                    title:"录入时间",
                    formatter:function (value,rows,index) {
                        var dd=new Date(value)
                        return dateFormats(dd);
                    }
                },
                {
                    title:"操作",
                    formatter:function(value,rows,index) {
                        return "<a class='btn btn-primary btn-lg' role='button' href='javascript:guo(" + rows.id + ")'>通过</a>"
                    }
                },
                {

                    title:"操作",
                    formatter:function(value,rows,index) {
                        return "<a class='btn btn-primary btn-lg' role='button' href='javascript:buguo(" + rows.id + ")'>不通过</a>"
                    }
                }
            ]
        })
    })





    function guo(id) {
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/userController/uptong',
            data:{"id":id},
            dataType:'json',
            success:function(data){

                alert("成功")
                location.reload();
            },
            error:function(msg){
                alert("error")
            }

        })
    }
    function buguo(id) {
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/userController/upbutong',
            data:{"id":id},
            dataType:'json',
            success:function(data){

                alert("成功")
                location.reload();
            },
            error:function(msg){
                alert("error")
            }

        })
    }
</script>
</html>
