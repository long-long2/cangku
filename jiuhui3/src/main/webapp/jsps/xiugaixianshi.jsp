<%--
  Created by IntelliJ IDEA.
  User: 龙龙
  Date: 2019/9/9
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<html>
<head>
    <title>Title</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">



    <script src="${pageContext.request.contextPath}/static/common/jquery-3.2.1.min.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#huoqu").click(function () {

                var	phone = $("#phone").val();
                alert(phone)
               /* if (phone.test(phone)){*/
                $.ajax( {
                    type:"post",
                    url:"${pageContext.request.contextPath }/userController/duanxin",
                    data:{"phone":phone},
                    dataType:"json",
                    success:function (data) {
                        if (data){
                            alert("发送成功");
                        }else {
                            alert("发送失败");
                        }

                    }
                })
              /*  }*/
            });
            $("#yan").click(function () {

                var	code = $("#code").val();
                alert(code)
                $.ajax( {
                    type:"post",
                    url:"${pageContext.request.contextPath }/userController/yan",
                    data:{"code":code},
                    dataType:'json',
                    success:function (data) {0
                        if (data){
                            alert("成功");
                            createTab1("messageId2","改密码","${pageContext.request.contextPath }/jsps/xiugai.jsp",true);
                        }else {
                            alert("失败");
                        }

                    }
                })
            });
        });


        function createTab1(id,name,url,isClose){
            //id tab标签的id，不允许重复；
            //name tab便签上面显示的标题
            //url 标签页里面要加载的页面 不知跨域
            //closalbe boolean类型，是否显示关闭图标。
            closableTab.addTab({'id': id, 'name': name, 'url': url, 'closable': isClose});
        }
    </script>

</head>
<body>

<form role="form" class="from-horizontal">
    <div class="from-group">
        <h4> <label for="phone" class="col-sm-1 control-label">手机号</label></h4>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="phone" value="${user.phone}" disabled="disabled">
        </div>
    </div><h4> <button type="button" id="huoqu" class="btn btn-default" data-dismiss="modal">获取验证码</button></h4><br><br>
    <div class="from-group">
        <h4><label for="code" class="col-sm-1 control-label">验证码</label></h4>
        <div class="col-sm-2">
            <input type="text" class="form-control" id="code" placeholder="请输入验证码">
        </div>

    </div>
    <br><br>
    <div class="col-sm-3">
        <button type="button" id="yan" class="btn btn-default" data-dismiss="modal">修改</button>
    </div>

</form>
</body>

</html>
