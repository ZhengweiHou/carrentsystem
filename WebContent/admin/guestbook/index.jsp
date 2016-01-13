<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>
<jsp:useBean id="lb" scope="page" class="com.bean.GuestBookBean" />
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String dir=sn.getDir();
String thisurl = basePath+dir+"/guestbook/index.jsp";
session.setAttribute("thisurl", thisurl);

%>
<HTML><HEAD><TITLE>��̨������</TITLE>
<LINK href="<%=basePath %><%=dir %>/images/Admin_Style.css" type=text/css rel=stylesheet>
<LINK href="<%=basePath %><%=dir %>/images/style.css" type=text/css rel=stylesheet>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/Common.js"></SCRIPT>
<SCRIPT language=JavaScript src="<%=basePath %><%=dir %>/images/calendar.js"></SCRIPT>
<STYLE type=text/css>
BODY {
	MARGIN-LEFT: 0px; BACKGROUND-COLOR: #ffffff
}
.STYLE1 {color: #ECE9D8}
</STYLE>
</HEAD>

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
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{
	List list = sn.getSiteInfo();
	String sitename = list.get(0).toString();
	String method=request.getParameter("method");
	String stime="2";String etime="2";
	if(method!=null){
		if(method.equals("datequery")){
			stime=request.getParameter("stime");etime=request.getParameter("etime");
		}
		if(method.equals("showgb")){
			stime="1";etime="1";
		}
		if(method.equals("hidegb")){
			stime="0";etime="0";
		}
	}
%>
<BODY oncontextmenu="return false;" onselectstart="return false;" leftMargin=0 background=<%=basePath %><%=dir %>/images/MainBg.gif topMargin=0 scroll=no marginheight="0" marginwidth="0">

	

<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
  <tbody>
  <tr>
    <td align="left" vAlign=top >
    <form action="<%=basePath %>GuestBook.do?method=delguestbook" method="post" name="pageform">
       <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1 class=tablewidth>
		  <tbody>
		  <TR align="center" class=head>
			<td height=23>���</td>
			<td>�ǳ�</td>
			<td>���ݸ���</td>
			<td>����ʱ��</td>
			<td>ip��ַ</td>
			<td>���״̬</td>
			<td>ѡ��</td>
		  </tr>
		<%
			lb.setEVERYPAGENUM(10);
			int cou = lb.getMessageCountM(stime,etime);//�õ���Ϣ����			        
			String page1=request.getParameter("page");
			if(page1==null){
				page1="1";
			}
			session.setAttribute("busMessageCount", cou + "");
			session.setAttribute("busPage", page1);
			List pagelist1 = lb.getMessageM(Integer.parseInt(page1),stime,etime); //����һ��ҳ���������ظ�ҳ��Ҫ��ʾ����Ϣ 
			session.setAttribute("qqq", pagelist1);
			int pageCount = lb.getPageCount(); //�õ�ҳ��  
			session.setAttribute("busPageCount", pageCount + ""); 
			List pagelist3=(ArrayList)session.getAttribute("qqq");
			%>

		 
			<%
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
					String content = pagelist2.get(3).toString().trim();
					String ifhide = pagelist2.get(7).toString();
			%>   
		  <TR align="center" bgColor=#ffffff>
			<td width="30" id=map><%=i+1 %></td>
			<td id=map><a href="<%=basePath %><%=dir %>/guestbook/replay.jsp?id=<%=pagelist2.get(0).toString()%>"><%=pagelist2.get(1).toString() %></a></td>
			<td id=map><%=content.substring(0,content.length()>10?10:content.length()) %></td>
			<td id=map><%=pagelist2.get(4).toString() %></td>
			<td id=map><%=pagelist2.get(5).toString() %></td>
			<td>
				<a href="<%=basePath %>GuestBook.do?method=hideGuest&id=<%=pagelist2.get(0).toString()%>"><% if(ifhide.equals("1")){out.println("�����");}else{out.println("δ���");}%></a>
			</td>
			<td id=map><input type="checkbox" name="checkit" value="<%=pagelist2.get(0).toString()%>"></td>
		  </tr>
		<%}%>    	
		  <TR align="right" >
			 <td colspan="11" id=map>
			 <input id="checkall" type="checkbox" name="checkall" onClick="allch()" >&nbsp;ȫѡ
			 </td>
			 </tr>
		  </tbody>
      </table></form>
       </td>
		</tr>
	     <tr>
    	   <td align="right" vAlign=top >
             <TABLE width="100%" border=0 align="right" cellPadding=3 cellSpacing=1>
		     <tbody>
		     <TR align="right" class=head>
			 <td >
			 <form action="" method="post" name="form3">	
			 <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//���ڸ�javascript��ֵ-->
			 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//���ڸ�javascript��ֵ-->         
				<a href="#" onClick="gotop()"><img src="<%=basePath %>images/first.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="dopre()"><img src="<%=basePath %>images/pre.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				 ��<%=session.getAttribute("busMessageCount").toString()%>����¼,
				 ����<%=session.getAttribute("busPageCount").toString()%>ҳ,
				 ��ǰ��<%=session.getAttribute("busPage").toString()%>ҳ&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="donext()"><img src="<%=basePath %>images/next.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
				<a href="#" onClick="golast()"><img src="<%=basePath %>images/last.gif" border="0" /></a>
			 ��<input name="busjump" type="text" size="3" />ҳ<a href="#" onClick="bjump()"><img src="<%=basePath %>images/jump.gif" border="0" /></a>&nbsp;&nbsp;&nbsp;
			 </form>
             </td>
             </tr>
			 </tbody>
			 </table>
		  </td>
		</tr>
		<tr>
    	   <td align="center" vAlign=top >
             <TABLE width="100%" border=0 align="center" cellPadding=3 cellSpacing=1>
		     <tbody>
		     <TR align="center" class=head>
			 <td >
			 <input type="button" name="button" value="ɾ��" onClick="del()" >
			 </td>
			 </tr>
			 </tbody>
			 </table>
		  </td>
		 </tr>
  </tbody>
</table>
</body>
<%} %>
</HTML>


<script type="text/JavaScript">
	
function del()
{
	pageform.submit(); 
}

function allch()
{
	 var check = document.getElementsByName("checkit");
	 for(var i = 0; i < check.length; i++){
		 check[i].checked=document.getElementById("checkall").checked;
	 }
}

function gotop(){	//���ص�һҳ
	form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page=1";
    form3.submit();
}

function golast(){ //�������һҳ
    if(form3.pageCount.value==0){//�����ҳ��Ϊ0����ô���һҳΪ1��Ҳ���ǵ�һҳ�������ǵ�0ҳ
    form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function dopre(){ //��һҳ
  var page=parseInt(form3.page.value);
  if(page<=1){
    alert("������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function donext(){//��һҳ
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("�������һҳ");
  }else{
    form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page="+(page+1);
    form3.submit();
  }
}

function bjump(){
	var pageCount=parseInt(form3.pageCount.value);
  	if(fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("��ת�ı�����ֻ����������!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
  	if(form3.busjump.value>pageCount){//�����ת�ı����������ҳ���������һҳ���������������һҳ
		if(pageCount==0){	
	
			var url = "<%=basePath%><%=dir %>/guestbook/index.jsp?page=1";
			form3.action=url;
			form3.submit();
		}
		else{
			var url = "<%=basePath%><%=dir %>/guestbook/index.jsp?page="+pageCount;
			form3.action=url;
			form3.submit();
		}	
	}
  	else if(form3.busjump.value<=pageCount){
		var page=parseInt(form3.busjump.value);
		if(page==0){
	    	page=1;//������������0����ô����������1
	    	form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page="+page;
	    	form3.submit();
   		}else{
      		form3.action="<%=basePath%><%=dir %>/guestbook/index.jsp?page="+page;
      		form3.submit();
   		}
	}	  	
}

//****�ж��Ƿ���Number.
function fIsNumber (sV,sR){
	var sTmp;
	if(sV.length==0){ return (false);}
	for (var i=0; i < sV.length; i++){
		sTmp= sV.substring (i, i+1);
		if (sR.indexOf (sTmp, 0)==-1) {return (false);}
	}
	return (true);
}
	
</script> 

