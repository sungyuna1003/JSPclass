<!-- request1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//post ������� ��û�� ���鿡 ���� ���ڵ� ����
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		String hobby[] = request.getParameterValues("hobby");
%>
���� : <%=name %><br>
�й� : <%=studentNum %><br>
���� : <%=gender %><br>
���� : <%=major %><br>
�߹� : <%
				for(int i=0;i<hobby.length;i++){
					out.println(hobby[i]+"&nbsp;");//ǥ���� ���� ���
				}
		%>
		
		
		
		