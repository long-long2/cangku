<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/9/13
  Time: 9:17
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
<table id="shangbao"></table>


<%-- 修改计划模态框--%>
<div class="modal fade" id="bt2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;                    </button>
                <h4 class="modal-title" id="myModalLabel">修改</h4>
            </div>

            <form id="biao" class="form-horizontal" role="form" >
                <input type="text" style="display:none" class="form-control" name="id" id="id">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="activitiesName" class="col-sm-2 control-label">计划名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="activitiesName" id="activitiesName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numActivities" class="col-sm-2 control-label">计划桌数</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="numActivities" id="numActivities">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="startTime" class="col-sm-2 control-label">开始时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="startTime" id="startTime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="endTime"  class="col-sm-2 control-label">结束时间</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="endTime" id="endTime">
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" id="ti" data-dismiss="modal">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%-- 修改计划模态框--%>



<div class="modal fade" id="tupian" tabindex="-1" role="dialog" aria-labelledby="myModalLabe3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabe3">上传图片</h4>
            </div>
            <div class="modal-body">
                <!-- 上传照片开始 -->
                <div style="width: 100%; height: 60vh; position: relative;">
                    <form id="upBox">
                        <input type="hidden" name="itemId" />
                        <div id="inputBox">
                            <input name="files" style="width: 110%;" type="file" title="上传图片" id="file" multiple accept="*" />点击选择附件
                        </div>
                        <div id="imgBox"></div>
                        <a id="btn">上传</a>
                    </form>
                </div>
                <!-- 上传照片结束 -->

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交更改</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>






<div class="modal fade" id="bt3" tabindex="-1" role="dialog" aria-labelledby="myModalLabe2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;                    </button>
                <h4 class="modal-title" id="myModalLabe2">添加</h4>
            </div>

            <form id="biao1" class="form-horizontal" role="form" >
                <input type="text" style="display:none" class="form-control" name="id" id="id1">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="activitiesName1" class="col-sm-3 control-label">计划名称</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="activitiesName" id="activitiesName1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="numActual" class="col-sm-3 control-label">实际召开桌数</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="numActual" id="numActual">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="newClient" class="col-sm-3 control-label">新客户</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="newClient" id="newClient">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="oldClient"  class="col-sm-3 control-label">旧客户</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="oldClient" id="oldClient">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="yxClient"  class="col-sm-3 control-label">客户意向</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="yxClient" id="yxClient">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="money"  class="col-sm-3 control-label">保费</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" name="money" id="money">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="lastname" class="col-sm-3 control-label">活动时间</label>
                        <div class="col-sm-5">
                            <input type="datetime-local" class="form-control" id="createtime" name="createtime" id="lastname">
                        </div>
                        <div class="col-sm-4">
                            <span class="help-block"></span>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" id="ti1" data-dismiss="modal">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $("#shangbao").bootstrapTable({
            url:"${pageContext.request.contextPath}/userController/getlist3",
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
                        if (rows.available==3) {
                            return "<a  href='javascript:updata(" + rows.id + ")'>修改计划</a>"
                        }
                        if (rows.available==2) {
                            return "<a  href='javascript:shangbao(" + rows.id + ")'>上报计划</a>"
                        }
                    }
                }
            ]
        })
    })

    function updata(id) {

        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/userController/findbyid',
            data:{"id":id},
            dataType:'json',
            success:function(data){
                $("input[name=id]").val(data.id);
                $("input[name=activitiesName]").val(data.activitiesName);
                $("input[name=numActivities]").val(data.numActivities);
                $("input[name=startTime]").val(data.startTime);
                $("input[name=endTime]").val(data.endTime);
                $("#bt2").modal('show');
                $("#ti").click(function(){
                    $.ajax({
                        type:'post',
                        url:'${pageContext.request.contextPath}/userController/upshangbao',
                        data:$("#biao").serialize(),
                        dataType:'json',
                        success:function(data){
                            alert("成功")
                            location.reload();
                        },

                    })
                });

            },
            error:function(msg){
                alert("error")
            }

        })
    }


    function shangbao(id) {
        $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/userController/findbyid',
            data:{"id":id},
            dataType:'json',
            success:function(data){
                $("input[name=id]").val(data.id);
                $("input[name=activitiesName]").val(data.activitiesName);
                $("#bt3").modal('show');
                $("#ti1").click(function(){

                    var activitiesName1=$("#activitiesName1");//input


                    if(!activitiesName1.val()){
                        isErroy(activitiesName1,"计划名称不能为空");
                        return false;
                    }
                    isOk(activitiesName1,"计划名正确");

                    var yxClient=$("#yxClient");//input


                    if(!yxClient.val()){
                        isErroy(yxClient,"客户意向不能为空");
                        return false;
                    }
                    isOk(yxClient,"客户意向正确");


                    //桌数校验
                    var numActual=$("#numActual");


                    var reg=/^[0-9]{1,}$/;


                    var num=numActual.val();

                    if(!reg.test(num)){

                        isErroy(numActual,"请输入正确数字");
                        return false;
                    }


                    isOk(numActual,"数字正确");


                    //新客户校验
                    var newClient=$("#newClient");


                    var reg1=/^[0-9]{1,}$/;


                    var num1=newClient.val();

                    if(!reg1.test(num1)){

                        isErroy(newClient,"请输入正确数字");
                        return false;
                    }


                    isOk(newClient,"数字正确");

                    //旧客户校验
                    var oldClient=$("#oldClient");


                    var reg2=/^[0-9]{1,}$/;


                    var num2=oldClient.val();

                    if(!reg2.test(num2)){

                        isErroy(oldClient,"请输入正确数字");
                        return false;
                    }

                    //保费校验
                    var money=$("#money");


                    var reg3=/^[0-9]{1,}$/;


                    var num3=money.val();

                    if(!reg3.test(num3)){

                        isErroy(money,"请输入正确数字");
                        return false;
                    }

                    isOk(money,"数字正确");

                    //开始时间校验
                    var createtime=$("#createtime");

                    if(!createtime.val()){
                        isErroy(createtime,"时间输入错误");
                        return false;
                    }
                    isOk(createtime,"开始时间正确");

                    $.ajax({
                        type:'post',
                        url:'${pageContext.request.contextPath}/userController/add1',
                        data:$("#biao1").serialize(),
                        dataType:'json',
                        success:function(data){
                            $("input[name=itemId]").val(data);
                            alert("成功");

                            $("#tupian").modal('show');

                        },
                    })
                });

            },
            error:function(msg){
                alert("error")
            }

        })
    }

    //成功校验
    function isOk(obj,text){
        obj.parent().parent().removeClass("has-error");


        obj.parent().parent().addClass("has-success");


        obj.parent().next().children(":first").html(text);
    }



    //失败校验
    function isErroy(obj,text){//input 校验信息

        obj.parent().parent().removeClass("has-success");

        obj.parent().parent().addClass("has-error");

        obj.parent().next().children(":first").html(text);

    }

    //启用插件设置相应的参数
    imgUpload({
        inputId:'file', //input框id
        imgBox:'imgBox', //图片容器id
        buttonId:'btn', //提交按钮id
        upUrl:'${pageContext.request.contextPath}/userController/addtupian',  //提交地址
        data:'files', //type="file"控件的name名
        formId:"upBox",//form表单的id
        num:"10"//上传个数
    })

</script>



</html>
