<!-- admin/productProc.jsp -->
<%@page import="shop.UtilMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="pMgr" class="shop.ProductMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//insert, update, delete
		String flag = request.getParameter("flag");
		boolean result = false;
		String msg = "오류가 발생하였습니다.";
		if(flag.equals("insert")){
			result = pMgr.insertProduct(request);
			if(result) msg = "상품을 등록하였습니다.";
		}else if(flag.equals("update")){
			result = pMgr.updateProduct(request);
			if(result) msg = "상품을 수정하였습니다.";
		}else if(flag.equals("delete")){
			result = pMgr.deleteProduct(UtilMgr.parseInt(request, "no"));
			if(result) msg = "상품을 삭제하였습니다.";
		}
%>
<script>
	alert("<%=msg%>");
	location.href = "productMgr.jsp";
</script>



