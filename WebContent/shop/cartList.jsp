<!-- cartList.jsp -->
<%@page import="shop.UtilMgr"%>
<%@page import="shop.ProductBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		if(session.getAttribute("idKey")==null){
			response.sendRedirect("login.jsp");
			return;
		}
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		int totalPrice = 0;
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
		<table width="95%" align="center" bgcolor="#FFFF99" border="1">
			<tr align="center" bgcolor="#996600">
				<td><font color="#FFFFFF">��ǰ</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">����</font></td>
				<td><font color="#FFFFFF">����/����</font></td>
				<td><font color="#FFFFFF">��ȸ</font></td>
			</tr>
			<%if(hCart.isEmpty()){%>
			<tr>
				<td colspan="5" align="center">��ٱ��ϴ� ��� �ֽ��ϴ�.</td>
			</tr>	
			<%
				}else{
					Enumeration<Integer> hCartKey = hCart.keys(); 
					while(hCartKey.hasMoreElements()){
						//Ű������ �ֹ���ü�� ����
						OrderBean order = hCart.get(hCartKey.nextElement());
						//��ǰ��ȣ
						int productNo = order.getProductNo();
						//��ǰ ����
						ProductBean pbean = pMgr.getProduct(productNo);
						//��ǰ�̸�
						String pName = pbean.getName();
						//��ǰ����
						int price = pbean.getPrice();
						//�ֹ�����
						int quantity = order.getQuantity();
						//�ֹ�����
						int subTotal = price * quantity;
						//��ü�ֹ�����
						totalPrice+=subTotal;
			%>
			<tr align="center">
			<form method="post" action="cartProc.jsp">
				<input type="hidden" name="productNo" 
				value="<%=productNo%>">
				<td><%=pName%></td>
				<td><input name="quantity" style = "text-align:right;" 
					value="<%=quantity%>" size="3">��</td>
				<td><%=UtilMgr.monFormat(subTotal)%>��</td>
				<td>
					<input type="button" value="����" size="3" onclick="javascript:cartUpdate(this.form)"> /
					<input type="button" value="����" size="3" onclick="javascript:cartDelete(this.form)">
				</td>
				<td>
					<a href="javascript:productDetail('<%=productNo%>')">�󼼺���</a>
				</td>
				<input type="hidden" name="flag">
				</form>
			</tr>
			<%}//while %>
			<tr>
				<td colspan="4" align="right">
					�� �ֹ��ݾ� : <%=UtilMgr.monFormat(totalPrice)%>��
				</td>
				<td align="center">
					<a href="orderProc.jsp">�ֹ��ϱ�</a>
				</td>
			</tr>
		<%}//---if-else %>	
		</table>
	</td>
	</tr>
	</table>
	<%@ include file="bottom.jsp" %>
	<form name="detail" method="post" action="productDetail.jsp" >
		<input type="hidden" name="no">
	</form>	
</body>
</html>













