<!-- arrayTest2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//form�� �ΰ� �̻��� ������ name���� ��û�Ǹ� �ڵ� �迭ó��
		String hobby[] = request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++){
			out.print(hobby[i]+"<br>");
		}
%><p>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		String hobby2[] = bean.getHobby();
		for(int i=0;i<hobby2.length;i++){
			out.print(hobby2[i]+"<br>");
		}
%>







