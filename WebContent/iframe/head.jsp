<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<jsp:useBean id="sys" scope="page" class="com.bean.SystemBean" /> 
<jsp:useBean id="abc" scope="page" class="com.bean.AfficheBean"/>  
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List sysList=sys.getSiteInfo(); 
List affList=abc.getAllAffiche(); 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<TITLE><%=sysList.get(0).toString() %></TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META name="keywords" content="<%=sysList.get(2).toString() %>" />
<META name="description" content="<%=sysList.get(3).toString() %>" />

<META content="MSHTML 6.00.2900.3243" name=GENERATOR>
<LINK href="<%=basePath %>images/css.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %>images/default.css" type=text/css rel=stylesheet>

<!-- //////////头文字特效////////// -->
<style type="text/css">
.milky {
   text-transform: uppercase;
  font-size: 20px;
  color: #f1ebe5;
  text-shadow: 0 8px 9px #c4b59d, 0px -2px 1px #fff;
  font-weight: bold;
  text-align: center;
  background: linear-gradient(to bottom, #ece4d9 0%,#e9dfd1 100%);
  border-radius: 5px; 
  margin: 0;
  padding: 0；
  
}
</style>

<!-- //////////////////// -->
</HEAD>
<SCRIPT language=JavaScript src="<%=basePath %>images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/index.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/calendar.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %>images/jquery-1.9.0.js"></SCRIPT>
 
<SCRIPT language=JavaScript>
<!--//屏蔽出错代码
function killErr(){
	return true;
}
window.onerror=killErr;
//-->
</SCRIPT>

<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
 
<BODY text=#000000   leftMargin=0 topMargin=0>
	<div align="center"><h1>欢迎使用HZW汽车租赁系统</h1></div>
	
	
	<!--****************主菜单开始****************-->
	<div class="nav" align="center">
	<ul>
    	<li><a href="index.jsp" name="navurl" target="">首    页</a></li>
        <li><a href="news.jsp" name="navurl" target="">新闻信息</a></li>
        <li><a href="nhzp.jsp" name="navurl" target="">车辆信息</a></li>
        <li><a href="guestbook.jsp" name="navurl" target="">投诉建议</a></li>
        <!-- <li><a href="admin/login.jsp" target="">管理员登陆</a></li>  -->
        <li style="margin-left: 20%;">  <%
	String members=(String)session.getAttribute("member");
	if(members==null){%>
	<a name="navurl" style="color: red;" href=<%=path+"/login.jsp"%> target="">未登录
	<% }else{%>
	<a style="color: blue;" href="member/index.jsp" target="">用户<%=members%>已登录
	<%}%></a></li>
        
    </ul>
   
</div>

	<!--****************主菜单结束****************-->
	

<script language="javascript">
	function nav(){
	   var url = document.URL;
		var urls = document.getElementsByName("navurl");
		for(var i=0;i<urls.length;i++){
			if(urls[i] == url){
				urls[i].parentNode.className = 'select';
				return;
			}
		}
		urls[0].parentNode.className = 'select';
	}
	nav();
// jQuery	
$(function(){
	var a1 = document.URL;
	var a2 = $(".nav_other a");
	for(var i=0;i<a2.length;i++){
		if(a2[i] == a1){
			$(a2[i]).parent().addClass("select");
			return;
		}
	}
	$(a2[0]).parent().addClass("select");
})
</script>


