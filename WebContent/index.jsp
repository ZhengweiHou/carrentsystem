<%@ page language="java" import="java.util.*"
	contentType="text/html;charset=gb2312"%>
<%@ include file="iframe/head.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<style type="text/css">
.flashBanner{width:782px;height:326px;overflow:hidden;margin:0 auto;}
.flashBanner{position:relative;}
.flashBanner .mask{height:32px;line-height:32px;background-color:#000;width:100%;text-align:right;position:absolute;left:0;bottom:-32px;filter:alpha(opacity=70);-moz-opacity:0.7;opacity:0.7;overflow:hidden;}
.flashBanner .mask img{vertical-align:middle;margin-right:10px;cursor:pointer;}
.flashBanner .mask img.show{margin-bottom:3px;}
</style>

<script type="text/javascript">
$(function(){
	$(".flashBanner").each(function(){
		var timer;
		$(".flashBanner .mask img").click(function(){
			var index = $(".flashBanner .mask img").index($(this));	
			changeImg(index);
		}).eq(0).click();
		$(this).find(".mask").animate({
			"bottom":"0"	
		},3000);
		$(".flashBanner").hover(function(){
			clearInterval(timer);	
		},function(){
			timer = setInterval(function(){
				var show = $(".flashBanner .mask img.show").index();
				if (show >= $(".flashBanner .mask img").length-1)
					show = 0;
				else
					show ++;
				changeImg(show);
			},3000);
		});
		function changeImg (index)
		{
			$(".flashBanner .mask img").removeClass("show").eq(index).addClass("show");
			$(".flashBanner .bigImg").parents("a").attr("href",$(".flashBanner .mask img").eq(index).attr("link"));
			$(".flashBanner .bigImg").hide().attr("src",$(".flashBanner .mask img").eq(index).attr('uri')).fadeIn("slow");
		}
		timer = setInterval(function(){
			var show = $(".flashBanner .mask img.show").index();
			if (show >= $(".flashBanner .mask img").length-1)
				show = 0;
			else
				show ++;
			changeImg(show);
		},3000);
	});
});
</script>


<SCRIPT language=JavaScript>
<!--//屏蔽出错代码
	function killErr() {
		return true;
	}
	window.onerror = killErr;
//-->
</SCRIPT>
<SCRIPT language=JavaScript>
<!--//处理大分类一行两个小分类
	function autoTable(div) {
		fs = document.getElementById(div).getElementsByTagName("TABLE");
		for ( var i = 0; i < fs.length; i++) {
			fs[i].style.width = '49.5%';
			if (i % 2 == 1) {
				if (document.all) {
					fs[i].style.styleFloat = "right";
				} else {
					fs[i].style.cssFloat = "right;";
				}
			} else {
				if (document.all) {
					fs[i].style.styleFloat = "left";
				} else {
					fs[i].style.cssFloat = "left;";
				}
			}
		}
	}
//-->
</SCRIPT>
<SCRIPT language=JavaScript src="images/inc.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/default.js"></SCRIPT>
<SCRIPT language=JavaScript src="images/swfobject.js"></SCRIPT>
<META content="MSHTML 6.00.2900.3268" name=GENERATOR>
</HEAD>
<%
	String message = (String) request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<BODY text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
	<SCRIPT language=JavaScript>
	<!--//目的是为了做风格方便
		document.write('<div class="wrap">');
	//-->
	</SCRIPT>
	<TABLE class=MainTable cellSpacing=0 cellPadding=0 width="100%"
		align=center border=0>
		<TBODY>
			<TR>


				<TD class=Side vAlign=top align=left width="70%" height=200>
					<!--*******************************新闻资讯开始*******************************-->
					<TABLE class=dragTable cellSpacing=0 cellPadding=0 width="100%"
						align=center border=0>
						<TBODY>
							<TR>
								<TD align="center">
									<!-- 主页主播区域开始 --> 
									<%--  <img src="<%=basePath%>images/s.jpg" width=700 height=300 border=0>  --%>
								
									<div class="flashBanner">
		<a href="/"><img class="bigImg" width="782" height="326" /></a>
		<div class="mask">
			<img src="<%=basePath%>images/0.jpg" uri="<%=basePath%>images/0.jpg"  width="60" height="22"/>
			<img src="<%=basePath%>images/s.jpg" uri="<%=basePath%>images/s.jpg"  width="60" height="22"/>
			<img src="<%=basePath%>images/s.jpg" uri="<%=basePath%>images/s.jpg"   width="60" height="22"/>
			<img src="<%=basePath%>images/s.jpg" uri="<%=basePath%>images/s.jpg"   width="60" height="22"/>
			<img src="<%=basePath%>images/s.jpg" uri="<%=basePath%>images/s.jpg"   width="60" height="22"/>
		</div>
	</div>
									 <!-- 主页主播区域结束-->
								</TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD class=Side vAlign=top align=right width="25%">
					<!--*******************************滚动公告开始*******************************-->
					<TABLE width="100%" height="326" border=0 cellPadding=0
						cellSpacing=0 class=dragTable>
						<TBODY>
							<TR>
								<TD class=head><SPAN class=TAG>
										<P>网站公告</P>
								</SPAN></TD>
							</TR>
							<TR>
								<TD class=middle align=left>
								<MARQUEE
										onmouseover=if(document.all!=null){this.stop()}
										onmouseout=if(document.all!=null){this.start()} scrollAmount=1
										scrollDelay=1 direction=up height=180>
										<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
											<TBODY>
												<%
													if (!affList.isEmpty()) {
														for (int aff = 0; aff < affList.size(); aff++) {
															List affList2 = (List) affList.get(aff);
												%>
												<TR>
													<TD width="100%"><%=affList2.get(1).toString()%>---<%=affList2.get(2).toString()%><BR>
													</TD>
												</TR>
												<%
													}
													}
												%>

											</TBODY>
										</TABLE>
									</MARQUEE>
									</TD>
							</TR>
						</TBODY>
						<!--*******************************滚动公告结束*******************************-->
					</TABLE>
				</TD>
			</TR>
		</TBODY>
	</TABLE>



	<SCRIPT language=JavaScript>
	<!--//目的是为了做风格方便
		document.write('</div>');
	//-->
	</SCRIPT>
	<SCRIPT language=JavaScript>
	<!--
		clickEdit.init();
	//-->
	</SCRIPT>
</BODY>
</HTML>

<%@ include file="iframe/foot.jsp"%>