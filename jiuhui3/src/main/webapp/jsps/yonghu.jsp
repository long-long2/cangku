<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" />
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>
</head>
<body>
<div class="container">

    <div class="row" >

        <div class="col-xs-4" style="background-color: white">
            <ul id="planTree1" class="ztree"></ul>

        </div>
        <div class="col-xs-8" style="background-color: white; ">
            <table id="tianjia7"> </table>
            <button class="btn btn-primary" id="on" style="display:none">添加</button>

            <input name="name" type="button" onClick="show();" value="显示" id="on1">
        </div>
    </div>
</div>







<div class="modal fade" id="bt2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;                    </button>
                <h4 class="modal-title" id="myModalLabel">添加</h4>
            </div>

            <form id="biao" class="form-horizontal" role="form" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="usercode" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="usercode" id="usercode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="username" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="username" id="username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="password" id="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="level" class="col-sm-2 control-label">级别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="level" id="level">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="deptId" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptId" id="deptId">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="areaId" class="col-sm-2 control-label">市编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaId" id="areaId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="areaCode" class="col-sm-2 control-label">所属</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaCode" id="areaCode">
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

<script type="text/javascript">
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false,
        },
        edit:{
            enable:true
        },
        data: {
            simpleData: {
                enable: true,
                idKey: "id",
                pIdKey: "parentId",
                rootPId: 0
            },
            key: {
                name: "areaName"
            }
        },
        callback:{
            onExpand:organizezTreeOnExpand,
            onClick:onClick
        }
    };
    $(function () {
        $.ajax({
            type: 'post',
            dataType:'json',
            url: "${pageContext.request.contextPath}/userController/mingzi",//请求的action路径  
            error: function () {//请求失败处理函数  
                alert('请求失败');
            },
            success:function(data){ //请求成功后处理函数。    
                var treeObj = $.fn.zTree.init($("#planTree1"),setting,data);
                var nodes = treeObj.getNodes();
                for(var i=0;i<nodes.length;i++){
                    var childrens = nodes[i].children;
                    for(var j=0;j<childrens.length;j++){
                        childrens[j].isParent=true;
                    }
                }
            },error:function () {
                alert("分支失败");
            }
        })
    });
    function addHoverDom(treeId, treeNode) {
        var parentId = treeNode.parentId;
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
            + "' title='add node' onfocus='this.blur();'></span>";
        sObj.append(addStr);
        var btnAdd = $("#addBtn_"+treeNode.tId);
        if (btnAdd) btnAdd.bind("click", function(){
            if (parentId == 0 || parentId == 1){
                add(parentId);

            }else {
                alert("县级节点不能添加子节点");
            }
        })
    };
    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };
    function organizezTreeOnExpand(event,treeId,treeNode) {
        if (null != treeNode.children) {
            return;
        }
        $.ajax({
            url: "${pageContext.request.contextPath}/userController/findby7",
            data: {"areaId": treeNode.id},
            error: function () {
                alert('請求失敗');
            },
            success: function (jsondata) {
                if (jsondata == null || jsondata == "") {
                    alert("該市下沒有數據！");
                } else {
                    var treeObj = $.fn.zTree.getZTreeObj("planTree");
                    var parentZNode = treeObj.getNodeByParam("id", treeNode.id, null);
                    newNode = treeObj.addNodes(parentZNode,jsondata)    ;
                }
            }
        })
    };

    function onClick(event,treeId,treeNode) {


        var id = treeNode.id;
        var pid = treeNode.pid;
        $("#tianjia7").bootstrapTable("destroy");
        if(treeNode.isParent){
            $("#tianjia7").bootstrapTable({
                url:"${pageContext.request.contextPath}/shu/findall",
                pagination:true,
                sidePagination:'client',
                pageNumber:1,
                pageSize:3,
                pageList:[3,5,10],
                sortName:"id",
                sortOrder:"desc",
                //strictSearch:true,
                queryParams:function(params){
                    return{
                        id:id
                    };
                },
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
                    }
                ]
            })
            function show(){
                document.getElementById("on").style.display="";

            }
            $(function(){
                $("#on1").click(function(){
                    $("#bt2").modal('show');
                    $("#ti").click(function(){
                        $.ajax({
                            type:'post',
                            url:'${pageContext.request.contextPath}/shu/tianjia',
                            data:$("#biao").serialize(),
                            dataType:'json',
                            success:function(data){
                                window.location.href="${pageContext.request.contextPath}/jsps/usermanager.jsp";
                            },
                            error:function(msg){
                                alert("error")
                            }
                        })
                    })
                })
            })
        }
    }






</script>
</body>
</html>

