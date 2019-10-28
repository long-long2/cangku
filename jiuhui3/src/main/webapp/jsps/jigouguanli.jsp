<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>机构管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/ztree/css/zTreeStyle/zTreeStyle.css" />
    <script src="${pageContext.request.contextPath}/static/ztree/js/jquery.ztree.all.min.js"></script>
</head>
<body>
<ul id="planTree" class="ztree"></ul>

</body>
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
                        <label for="deptCode" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptCode" id="deptCode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="deptName" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="deptName" id="deptName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="areaCode" class="col-sm-2 control-label">所属</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaCode" id="areaCode">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="areaId" class="col-sm-2 control-label">号码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaId" id="areaId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="available" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="available" id="available">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">级别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="type" id="type">
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


<div class="modal fade" id="bt7" tabindex="-1" role="dialog" aria-labelledby="myModalLabel7" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">


            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;                    </button>
                <h4 class="modal-title" id="myModalLabel7">添加</h4>
            </div>

            <form id="biao7" class="form-horizontal" role="form" >
                <div class="modal-body">
                    <div class="form-group">
                        <label for="areaName" class="col-sm-2 control-label">名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaName" id="areaName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="areaCode" class="col-sm-2 control-label">简写</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="areaCode" id="areaCode1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="parentId" class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="parentId" id="parentId">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="available" class="col-sm-2 control-label">状态</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="available" id="available1">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">级别</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="type" id="type1">
                        </div>
                    </div>



                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-default" id="ti7" data-dismiss="modal">提交</button>
                </div>
            </form>
        </div>
    </div>
</div>






</html>
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
            onRemove:onRemove,
            onRename:onRename
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
                var treeObj = $.fn.zTree.init($("#planTree"),setting,data);
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
                del(id);
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


    function add(parentId) {
        if(parentId == 1 ){
            $("#bt2").modal('show');
            $("#ti").click(function(){
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/shu/addshu',
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
        }else if(parentId == 0){
            $("#bt7").modal('show');
            $("#ti7").click(function(){
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/shu/addshi',
                    data:$("#biao7").serialize(),
                    dataType:'json',
                    success:function(data){
                        window.location.href="${pageContext.request.contextPath}/jsps/usermanager.jsp";
                    },
                    error:function(msg){
                        alert("error")
                    }
                })
            })
        }

    };


    function onRemove(event,treeId,treeNode) {
        if(treeNode.parentId == 1 ){
            $.ajax({
                type:'post',
                url:'${pageContext.request.contextPath}/shu/findbyshi',
                data:{areaName:treeNode.areaName},
                dataType:'json',
                success:function(data){
                        $.ajax({
                            type:'post',
                            url:'${pageContext.request.contextPath}/shu/delshi',
                            data:{"id":data.id},
                            dataType:'json',
                            success:function(data){
                                window.location.href="${pageContext.request.contextPath}/jsps/usermanager.jsp";
                            },
                            error:function(msg){
                                alert("error")
                            }
                        })


                },
                error:function(msg){
                    alert("error")
                }

            })

        }else {
            $.ajax({
            type:'post',
            url:'${pageContext.request.contextPath}/shu/findbyshu',
            data:{"deptName":treeNode.areaName},
            dataType:'json',
            success:function(data){
                alert();
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/shu/delshu',
                    data:{"id":data.id},
                    dataType:'json',
                    success:function(data){
                        window.location.href="${pageContext.request.contextPath}/jsps/usermanager.jsp";
                    },
                    error:function(msg){
                        alert("error")
                    }
                })


            },
            error:function(msg){
                alert("error")
            }

        })

        }
    }



    function onRename(event,treeId,treeNode) {
        if(treeNode.parentId == 1 ){

                        $.ajax({
                            type:'post',
                            url:'${pageContext.request.contextPath}/shu/upshi',
                            data:{"id":treeNode.id,"areaName":treeNode.areaName},
                            dataType:'json',
                            success:function(data){

                                alert("成功")
                                location.reload();
                            },

                        })




        }else {
                $.ajax({
                    type:'post',
                    url:'${pageContext.request.contextPath}/shu/upshu',
                    data:{"id":treeNode.id,"deptName":treeNode.areaName},
                    dataType:'json',
                    success:function(data){
                        window.location.href="${pageContext.request.contextPath}/jsps/usermanager.jsp";
                    },
                    error:function(msg){
                        alert("error")
                    }
                })
        }

    };

</script>
