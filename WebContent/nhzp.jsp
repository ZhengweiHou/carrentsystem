<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd html 4.01 transitional//EN" "http://www.w3c.org/tr/1999/REC-html401-19991224/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<LINK href="images/default.css" type=text/css rel=stylesheet>
<LINK href="images/css.css" type=text/css rel=stylesheet>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<STYLE type=text/css>
.ycbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-COLOR: #EAF2EF; BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsbt {
	BORDER-RIGHT: #fff 1px solid; BORDER-TOP: #fff 1px solid; PADDING-LEFT: 1.8em; BACKGROUND-IMAGE: url(images/head1.gif); BORDER-LEFT: #fff 1px solid; PADDING-TOP: 7px; BORDER-BOTTOM: #fff 1px solid; HEIGHT: 20px
}
.xsnr {
	DISPLAY: block
}
.ycnr {
	DISPLAY: none
}
</STYLE>
<script type=text/javascript>
function tb_xs(t,m,n){
for(var i=1;i<=m;i++){
if (i != n){
document.getElementById("tb"+t+ "_bt" + i).className= "ycbt";
document.getElementById("tb"+t+ "_nr" + i).className= "ycnr";}
else{
document.getElementById("tb"+t+ "_bt" + i).className= "xsbt";
document.getElementById("tb"+t+ "_nr" + i).className= "xsnr";}}}
</script>
<script language=Javascript>
<!--//屏蔽出错代码
function killErr(){
	return true;
}
window.onerror=killErr;
//-->
</script>
<script language=Javascript>
<!--//处理大分类一行两个小分类
function autotable(div){
	fs=document.getElementById(div).getElementsByTagName("table");
	for(var i=0;i<fs.length;i++){
		fs[i].style.width='49.5%';
		if(i%2==1){
			if (document.all) {
				fs[i].style.styleFloat="right";
			}else{
				fs[i].style.cssFloat="right;";
			}
		}else{
			if (document.all) {
				fs[i].style.styleFloat="left";
			}else{
				fs[i].style.cssFloat="left;";
			}
		}
	}
}
//-->
</script>
<script language=Javascript src="images/inc.js"></script>
<script language=Javascript src="images/default.js"></script>
<script language=Javascript src="images/swfobject.js"></script>
<META content="MShtml 6.00.2900.3268" name=GENERATOR>
</head>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
%>
<body text=#000000 bgColor=#ffffff leftMargin=0 topMargin=0>
<script language=Javascript>
<!--//目的是为了做风格方便
document.write('<div class="wrap">');
//-->
</script>
     <table class=dragtable cellSpacing=0 cellPadding=0 width="100%" border=1>
		<tbody>
				<TR>
				<TD>
					<TABLE class=dragTable height=28 cellSpacing=0 cellPadding=0
						width=100% align=center background=<%=basePath%> images/head1.gif
						border=0>
						<TBODY>
							<TR>
								<TD align=left class=head><FONT color=#000000>您现在的位置：<SPAN
										style="TEXT-DECORATION: none">车辆信息</FONT></TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
			</TR>
		
        <tr>
          <td class=head colspan="2">
			<SPAN class=TAG>车辆信息</SPAN> 
			
		  </td>
		</tr>
		<tr>
		<td  class=middle align="left" >
               <table class=xsnr id=tb1_nr1  cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <tbody>
                    <%
                    List hotlist=cb.getCom("select qc.*,type.title from qc AS qc LEFT JOIN type AS type ON qc.fl = type.id order by qc.id desc",9);
                    if(!hotlist.isEmpty()){
					for(int alln1=0;alln1<hotlist.size();alln1++){
						List allnew=(List)hotlist.get(alln1);
			%>
        <tr>
          <td width=20% align=left>
          <IMG height=100 src="<%=basePath+allnew.get(3).toString()%>" width=120 onload=makesmallpic(this,120,80); border=0>
		  </td>
		  <td align=left><br>
		  车名：<%=allnew.get(1).toString()%>  &nbsp;&nbsp;&nbsp;所属分类：<%=allnew.get(allnew.size()-1).toString()%><br>
		  联系电话：<%=allnew.get(4).toString()%>   <br>
		  租金：<%=allnew.get(5).toString()%>  元&nbsp;超时价格：<%=allnew.get(6).toString()%> 元 &nbsp;&nbsp;&nbsp;
		  备注信息：<%=allnew.get(7).toString()%><br>
		  <a href="<%=basePath %>prepinfo.jsp?id=<%=allnew.get(0).toString()%>">我要租车</a>
		  </td>
		  
		</tr>
		<%}} %>
				</tbody>
			</table>			
			</td>
		</tr>
        </tbody>
	  </table>


<script language=Javascript>
<!--//目的是为了做风格方便
document.write('</div>');
//-->
</script>
<script language=Javascript>
<!--
clickEdit.init();
//-->
</script>
</body>
</html>

<%@ include file="iframe/foot.jsp"%>