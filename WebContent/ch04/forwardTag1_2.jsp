<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
%>

<!-- �� �������� Ŭ���̾�Ʈ���� ����ȴ�. -->
id:<%=id%><br>
pwd:<%=pwd%><br>