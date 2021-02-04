<!-- orderProc.jsp -->
<%@page import="java.util.Enumeration"%>
<%@page import="shop.OrderBean"%>
<%@page import="java.util.Hashtable"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<jsp:useBean id="orderMgr" class="shop.OrderMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//���ǿ� ����� ��ٱ��� ����
		Hashtable<Integer, OrderBean> hCart = cMgr.getCartList();
		///Hashtable�� Ű������ ����
		Enumeration<Integer> hCartKey = hCart.keys();
		String msg = "";
		if(!hCart.isEmpty()){
			while(hCartKey.hasMoreElements()){
				//out.println("��ǰ��ȣ : " + hCartKey.nextElement()+"<br>");
				//��ٱ��Ͽ� �ֹ���ȣ Ű������ �ֹ���ü ����
				OrderBean order = hCart.get(hCartKey.nextElement());
				//DB �ֹ�ó��
				orderMgr.insertOrder(order);
				//��� ����
				pMgr.reduceProduct(order);
				//��ٱ��Ͽ� �ֹ��� ��ǰ ����
				cMgr.deleteCart(order);
			}
			msg = "�ֹ� ó�� �Ͽ����ϴ�.";
		} else {
			msg = "��ٱ��ϰ� ������ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "orderList.jsp";
</script>















