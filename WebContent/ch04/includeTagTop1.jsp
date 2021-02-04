<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
%>
include 액션 태그의 top 입니다<p>
<b><%=name %></b>파이팅!!
<hr align ="left" color="red" width ="40%">
