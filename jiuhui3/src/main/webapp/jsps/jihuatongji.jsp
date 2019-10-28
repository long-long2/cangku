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
<div id="main" style="width: 600px;height:400px;"></div>
<script>
    // 绘制图表。
    echarts.init(document.getElementById('main')).setOption({
        tooltip:{
            trigger:'item',
            formatter: "{a} <br/>{b}: {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data:(function () {
                var data=[];
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/userController/tongji",
                    dataType:"json",
                    async:false,
                    success:function (result) {
                        for (var j=0;j<result.length;j++){
                            data.push({
                               "name":result[j].areaName
                            })
                        }
                    }
                })
                return data;
            })(),
        },
        series: {
            type: 'pie',
            data: (function () {
                var datas=[];
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/userController/tongji",
                    dataType:"json",
                    async:false,
                    success:function (result1) {
                        for (var i=0;i<result1.length;i++){
                            datas.push({
                                "value":result1[i].money,"name":result1[i].areaName
                            })
                        }
                    }
                })
                return datas;
            })()
        }
    });
</script>
</body>
</html>
