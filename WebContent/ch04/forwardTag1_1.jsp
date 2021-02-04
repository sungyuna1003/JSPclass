<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");	
%>

현재의 페이지는 동적인 값으로 인한 다른 페이지 전달(경유)의 목적으로 존재
현재 페이지의 텍스트 보이지 않는다.
그대신 include 액션테그 처럼 요청한 페이지 (forwardTag1.html)에서 id와 pwd도 같이 전달 된다.

<jsp:forward page="forwardTag1_2.jsp"/>