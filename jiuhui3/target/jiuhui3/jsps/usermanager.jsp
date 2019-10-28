<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./common/header.jsp"%>
<%@include file="./common/left.jsp"%>



 <script type="text/javascript">
 		$(function(){
 			createTab1("messageId","个人信息","${pageContext.request.contextPath }/jsps/index.jsp",true);
 			
 		})
        function xiugaimima() {
         createTab1("messageId1","修改密码","${pageContext.request.contextPath }/jsps/xiugaixianshi.jsp",true);
        }
        function shangbaoshuju() {
         createTab1("messageId5","上报数据","${pageContext.request.contextPath }/jsps/shangbao.jsp",true);
        }
        function yubaoshuju() {
         createTab1("messageId2","预报数据","${pageContext.request.contextPath }/jsps/addPlan.jsp",true);
        }
        function queryHistoryList1() {
         createTab1("messageId4","审核记录","${pageContext.request.contextPath }/jsps/jilu.jsp",true);
        }
        function queryPlanList1() {
         createTab1("messageId3","审核","${pageContext.request.contextPath }/jsps/yanzheng.jsp",true);
        }
        function gerenxinxi() {

        }
        function jihuaxianshi() {
         createTab1("messageId6","计划显示","${pageContext.request.contextPath }/jsps/jihuaxianshi.jsp",true);
        }
        function jihuatongji() {
         createTab1("messageId7","计划统计","${pageContext.request.contextPath }/jsps/jihuatongji.jsp",true);
        }
        function jigouguanli() {
         createTab1("messageId8","机构管理","${pageContext.request.contextPath }/jsps/jigouguanli.jsp",true);
        }
        function yonghu() {
         createTab1("messageId9","用户管理","${pageContext.request.contextPath }/jsps/yonghu.jsp",true);
        }
		function createTab1(id,name,url,isClose){
			//id tab标签的id，不允许重复；
			//name tab便签上面显示的标题
			//url 标签页里面要加载的页面 不知跨域
			//closalbe boolean类型，是否显示关闭图标。
		 	closableTab.addTab({'id': id, 'name': name, 'url': url, 'closable': isClose});
		}
	 	function dateFormats(dd) {
          var month=fix(dd.getMonth() +1, 2);
          var year =dd.getFullYear();
          var hours=fix(dd.getHours(), 2);
          var minutes=fix(dd.getMinutes(), 2);
          var dates=fix(dd.getDate(), 2);

         //var  d1=year+"-" +month+"-"+dates+hours+":"+minutes;
          var  d1=year+"-" +month+"-"+dates;
          return d1;
        }
        function fix(num,length) {
         return (''+num).length<length ? ((new Array(length+1))
                 .join('0')+num).slice(-length): '' + num;
        }
</script>  
   
   
   
<%@include file="./common/footer.jsp"%>
</body>
</html>
