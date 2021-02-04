<!-- fuploadProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String flag = request.getParameter("flag");
		mgr.uploadFile(request);
		response.sendRedirect("flist.jsp");
%>
