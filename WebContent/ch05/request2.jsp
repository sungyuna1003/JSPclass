<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");

		String protocol = request.getProtocol();
		int port = request.getServerPort();
		String remoteAddr = request.getRemoteAddr();
		String requestURI = request.getRequestURI();
		StringBuffer requestURL = request.getRequestURL();
		String query = request.getQueryString();
		
%>
�������� : <%=protocol%><br>
Port : <%=port%><br>
��ǻ���ּ� : <%=remoteAddr%><br>
��û���(URI) : <%=requestURI%><br>
��û���(URL) : <%=requestURL%><br>
���� : <%=query%><br>
