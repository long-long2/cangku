<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>酒会管理系统  </title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	
		<script type="text/javascript">



			function createTab1(id,name,url,isClose){
				//id tab标签的id，不允许重复；
				//name tab便签上面显示的标题
				//url 标签页里面要加载的页面 不知跨域
				//closalbe boolean类型，是否显示关闭图标。
				closableTab.addTab({'id': id, 'name': name, 'url': url, 'closable': isClose});
			}
            $(function(){
                var cid = $('#nav_list> li>.submenu');
                cid.each(function(i){
                    $(this).attr('id',"Sort_link_"+i);

                })

                $("#main-container").height($(window).height()-76);
                $("#iframe").height($(window).height()-140);

                $(".sidebar").height($(window).height()-99);
                var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height",thisHeight);
                //当文档窗口发生改变时 触发
                $(window).resize(function(){
                    $("#main-container").height($(window).height()-76);
                    $("#iframe").height($(window).height()-140);
                    $(".sidebar").height($(window).height()-99);

                    var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
                    $(".submenu").height();
                    $("#nav_list").children(".submenu").css("height",thisHeight);
                });
                $(document).on('click','.iframeurl',function(){
                    var cid = $(this).attr("name");
                    var cname = $(this).attr("title");
                    $("#iframe").attr("src",cid).ready();
                    $("#Bcrumbs").attr("href",cid).ready();
                    $(".Current_page a").attr('href',cid).ready();
                    $(".Current_page").attr('name',cid);
                    $(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();
                    $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();
                    $("#parentIfour").html(''). css("display","none").ready();
                });

                /******/
                $(document).on('click','.link_cz > li',function(){
                    $('.link_cz > li').removeClass('active');
                    $(this).addClass('active');
                });
            })




            /*********************点击事件*********************/
            $( document).ready(function(){
                $('#nav_list,.link_cz').find('li.home').on('click',function(){
                    $('#nav_list,.link_cz').find('li.home').removeClass('active');
                    $(this).addClass('active');
                });
//时间设置
                function currentTime(){
                    var d=new Date(),str='';
                    str+=d.getFullYear()+'年';
                    str+=d.getMonth() + 1+'月';
                    str+=d.getDate()+'日';
                    str+=d.getHours()+'时';
                    str+=d.getMinutes()+'分';
                    str+= d.getSeconds()+'秒';
                    return str;
                }

                setInterval(function(){$('#time').html(currentTime)},1000);
//修改密码
              
                $('#' +
						'Exit_system').on('click', function(){
                    layer.confirm('是否确定退出系统？', {
                            btn: ['是','否'] ,//按钮
                            icon:2,

                        },
                        function(){
							$.ajax({
								type:"post",
								url:"${pageContext.request.contextPath}/userController/loginout",
								success:function (data) {
									if (data){
										location.href="${pageContext.request.contextPath}/jsps/login.jsp";
									}
								}
							})


						});
                });
            });
            function link_operating(name,title){
                var cid = $(this).name;
                var cname = $(this).title;
                $("#iframe").attr("src",cid).ready();
                $("#Bcrumbs").attr("href",cid).ready();
                $(".Current_page a").attr('href',cid).ready();
                $(".Current_page").attr('name',cid);
                $(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();
                $("#parentIfour").html(''). css("display","none").ready();


            }


		</script>
	</head>
	<body>
		<div class="navbar navbar-default" id="navbar">
        <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="https://item.taobao.com/item.htm?id=539837098284" class="navbar-brand">
						<small>					
						<!--<img src="images/logo.png" width="470px">-->
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->
				<div class="navbar-header operating pull-left">
				
				</div>
			   <div class="navbar-header pull-right" role="navigation">
               <ul class="nav ace-nav">	
                <li class="light-blue">
				<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				 <span  class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>超级管理员</span>
				 <i class="icon-caret-down"></i>
				</a>
				<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
				
				 <li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
				</ul>
			   </li>
	     

					
					</ul>

                </div>
			</div>
		</div>
		<div class="main-container" id="main-container">
			<script type="text/javascript">
                try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>
			<div class="main-container-inner" style="width: auto;">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
                        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<a class="btn btn-success">
								<i class="icon-signal"></i>
							</a>

							<a class="btn btn-info">
								<i class="icon-pencil"></i>
							</a>

							<a class="btn btn-warning">
								<i class="icon-group"></i>
							</a>

							<a class="btn btn-danger">
								<i class="icon-cogs"></i>
							</a>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->
					<div id="menu_style" class="menu_style">
					<ul class="nav nav-list" id="nav_list">
					<c:if test="${user.level == 1}">
						<li  style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-laptop"></i><span class="menu-text"> 活动审核 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
								<li class="home"><a href="javascript:queryPlanList1();"  title="审核计划" ><i class="icon-double-angle-right"></i>审核计划</a></li>
								<li class="home"><a href="javascript:queryHistoryList1();"  title="审核记录" ><i class="icon-double-angle-right"></i>审核记录</a></li>
							</ul>
						</li>
					</c:if>
						<c:if test="${user.level == 2}">
							<li style="z-index: 0;">
								<a href="#" class="dropdown-toggle"><i class="icon-credit-card"></i><span class="menu-text"> 计划管理 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu">
									<li class="home"><a href="javascript:jihuaxianshi()"  name="usermanagerInfo1.jsp" title="计划显示"  class="iframeurl"><i class="icon-double-angle-right"></i>计划显示</a></li>
									<li class="home"><a href="javascript:jihuatongji()"  name="usermanagerInfo2.jsp" title="计划统计 " class="iframeurl"><i class="icon-double-angle-right"></i>计划统计</a></li>

								</ul>
							</li>
						</c:if>
						<c:if test="${user.level == 2}">
							<li style="z-index: 0;">
								<a href="#" class="dropdown-toggle"><i class="icon-credit-card"></i><span class="menu-text"> 机构管理 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu">
									<li class="home"><a href="javascript:jigouguanli()"  name="usermanagerInfo1.jsp" title="机构管理"  class="iframeurl"><i class="icon-double-angle-right"></i>机构管理</a></li>
								</ul>
							</li>
						</c:if>
						<c:if test="${user.level == 2}">
							<li style="z-index: 0;">
								<a href="#" class="dropdown-toggle"><i class="icon-credit-card"></i><span class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
								<ul class="submenu">
									<li class="home"><a href="javascript:yonghu()"  name="usermanagerInfo1.jsp" title="用户管理"  class="iframeurl"><i class="icon-double-angle-right"></i>用户管理</a></li>
								</ul>
							</li>
						</c:if>
					<c:if test="${user.level == 0}">
						<li style="z-index: 0;">
				   <a href="#" class="dropdown-toggle"><i class="icon-credit-card"></i><span class="menu-text"> 活动管理 </span><b class="arrow icon-angle-down"></b></a>
				     <ul class="submenu">
						<li class="home"><a href="javascript:yubaoshuju()"  name="usermanagerInfo1.jsp" title="预报数据"  class="iframeurl"><i class="icon-double-angle-right"></i>预报数据</a></li>
						 <li class="home"><a href="javascript:shangbaoshuju()"  name="usermanagerInfo2.jsp" title="上报数据 " class="iframeurl"><i class="icon-double-angle-right"></i>上报数据</a></li>
						 
					 </ul>
						</li>
					</c:if>
                <li style="z-index: 0;"><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span class="menu-text"> 个人中心 </span><b class="arrow icon-angle-down"></b></a>
							<ul class="submenu">
							    <li class="home"><a href="javascript:gerenxinxi();" name="usermanager.jsp" title="个人信息" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息</a></li>
								<li class="home"><a href="javascript:xiugaimima();"  name="changePassword.jsp" title="修改密码"  class="iframeurl"><i class="icon-double-angle-right"></i>修改密码</a></li>
							</ul>
						</li>
					</ul>
					</div>
		
					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
                    <script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
				
					<div class="breadcrumbs" id="breadcrumbs" style="width: 1500px">
					
					<ul id="aa" class="nav nav-tabs breadcrumb" role="tablist" style="z-index: 0;">
					</ul>
					
					</div>
 					<div class="tab-content" >
					
					
					
					</div>
					
             
				</div><!-- /.main-content -->	
		</div>
		</div>
         <!--底部样式-->
       
         <div class="footer_style" id="footerstyle">  
		 <script type="text/javascript">try{ace.settings.check('footerstyle' , 'fixed')}catch(e){}</script>
          <p class="l_f">版权所有：北京工商管理专修学院数据云</p>
          <p class="r_f">qq：18192111</p>
         </div>
        
</body>
<style>
#aa{
border: none;
}
#aa a{
text-decoration: none;
    border: none;
    background-color: whitesmoke;
}
</style>
</html>

