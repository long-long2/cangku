<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 书写内容 -->

<form class="form-horizontal" id="planForm" role="form" method="post">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">计划名称</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="activitiesName" name="activitiesName" placeholder="请输入活动名称">
    </div>
     <div class="col-sm-4">
    	<span class="help-block" id="msg">${addMsg }</span>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">计划召开桌数</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="numActivities" name="numActivities" placeholder="请输入桌数">
    </div>
     <div class="col-sm-4">
    	<span class="help-block"></span>
    </div>
  </div>
  <!-- 可以加活动费用 -->
  
  <!-- 开始时间 -->
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">开始时间</label>
    <div class="col-sm-4">
       <input type="datetime-local" class="form-control" id="startTime" name="startTime" id="lastname">
    </div>
     <div class="col-sm-4">
    	<span class="help-block"></span>
    </div>
  </div>
  <!-- 结束时间 -->
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">结束时间</label>
    <div class="col-sm-4">
      <input type="datetime-local" class="form-control" id="endTime" name="endTime" id="lastname">
    </div>
     <div class="col-sm-4">
    	<span class="help-block"></span>
    </div>
  </div>
 
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" id="plan_btn" class="btn btn-default">提交</button>
    </div>
  </div>
</form>
<script type="text/javascript">
$(function(){
	$("#activitiesName").blur(function(){
		$("#msg").html("");
	});
		$("#plan_btn").click(function(){
			//用户名校验
			var activitiesName=$("#activitiesName");//input
			
			
			if(!activitiesName.val()){
				isErroy(activitiesName,"活动名称不能为空");
				return false;
			}
			isOk(activitiesName,"活动名正确");
			
			
			
			
			//桌数校验
			var numActivities=$("#numActivities");
			
			
			var reg=/^[0-9]{1,}$/;
			
			
			var num=numActivities.val();
			
			if(!reg.test(num)){
				
				isErroy(numActivities,"请输入正确数字");
				return false;
			}
			
			
			isOk(numActivities,"数字正确");
			
			
			
			
			//开始时间校验
			var startTime=$("#startTime");
			
			if(!startTime.val()){
				isErroy(startTime,"时间输入错误");
				return false;
			}
			isOk(startTime,"开始时间正确");
			//结束时间校验
			var endTime=$("#endTime");
			if(!endTime.val()){
				isErroy(endTime,"时间输入错误");
				return false;
			}
			isOk(endTime,"结束时间正确");
			
			var data=new FormData($("#planForm")[0]);
			 $.ajax({
					type:"post",
					url:"${pageContext.request.contextPath }/userController/add",
					dataType:"json",
					data:data,
					processData:false,
					contentType:false,
					success:function(data){	
							if(data){
								alert("添加成功");
								location.reload();//刷新
				    		}else{
				    			alert("添加失败")
				    		}
						
					}
				}) 
		});
	})


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


</script>

</body>
</html>
