<%@ page  contentType="text/html; charset=EUC-KR"%>
<%
        //��û�Ǵ� form�� post ����� �ѱ� ó��
		request.setCharacterEncoding("EUC-KR");
       //��û�Ǵ� from �� get ����� �ѱ�ó��:server.xml(63����)->URIEncoding="EUC-KR"
       //get��İ� a��ũ ��ũ ��� ������ ����̴�.
		String name = request.getParameter("name");
%>
<!-- ��û�Ҷ� name ���� ���� ��û�� �ȴ�. -->
<jsp:include page="includeTagTop1.jsp"/>
include �׼��±��� body �Դϴ�.