<!-- pollFormProc.jsp -->
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
   int listNum = Integer.parseInt(request.getParameter("num"));
   String itemNum[] = request.getParameterValues("itemnum");
   boolean result = mgr.updatePoll(listNum, itemNum);
   String msg ="��ǥ�� ���� �Ͽ����ϴ�";
   if(result) msg ="��ǥ�� �Ͽ����ϴ�";
  %>
  <script>
  alert("<%=msg%>");
  location.href ="pollList.jsp?num=<%=listNum%>";
  </script>