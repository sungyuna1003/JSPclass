<!-- cartProc.jsp : ��ٱ��� ���, ����, ���� ó�� -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="cMgr" scope="session" class="shop.CartMgr"/>
<jsp:useBean id="order" class="shop.OrderBean"/>
<jsp:setProperty property="*" name="order"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = (String)session.getAttribute("idKey");
		if(id==null){
			response.sendRedirect("login.jsp");
			return;
		}
		//���� �ֹ� �ߴ��� ���ǿ� ����� id�� order ��ü setter
		order.setId(id);
		String flag = request.getParameter("flag");
		String msg = "";
		if(flag.equals("insert")){
			cMgr.addCart(order);
			msg = "��ٱ��Ͽ� ��ҽ��ϴ�.";
		}else if(flag.equals("update")){
			cMgr.updateCart(order);
			msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
		}else if(flag.equals("delete")){
			cMgr.deleteCart(order);
			msg = "��ٱ��ϸ� �����Ͽ����ϴ�.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "cartList.jsp";
</script>






