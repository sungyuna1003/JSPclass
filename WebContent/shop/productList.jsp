<!-- productList.jsp -->
<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		Vector<ProductBean> pvlist = pMgr.getProductList();
%>
<html>
<head>
<title>Simple Shopping Mall</title>
<script src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
	<%@ include file="top.jsp" %>
	<table width="75%" align="center" bgcolor="#FFFF99">
	<tr> 
	<td align="center" bgcolor="#FFFFCC">
		<table width="95%" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600"> 
				<td><font color="#FFFFFF">�̸�</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">��¥</font></td>
				<td><font color="#FFFFFF">���</font></td>
				<td><font color="#FFFFFF">�󼼺���</font></td>
			</tr>
			<%
					for(int i=0;i<pvlist.size();i++){
						ProductBean pbean = pvlist.get(i);
			%>
			<tr align="center">
				<td><%=pbean.getName() %></td>
				<td><%=UtilMgr.monFormat(pbean.getPrice())%></td>
				<td><%=pbean.getDate()%></td>
				<td><%=UtilMgr.monFormat(pbean.getStock())%></td>
				<td><input type="button" value="�󼼺���" 
				onclick="productDetail('<%=pbean.getNo()%>')"></td>
			</tr>	
			<%}%>
		</table>
	</td>
	</tr>
	</table>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>
	<%@ include file="bottom.jsp" %>
</body>
</html>




