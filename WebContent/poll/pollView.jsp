<!-- pollView.jsp -->
<%@page import="java.util.Random"%>
<%@page import="java.util.Vector"%>
<%@page import="poll.PollItemBean"%>
<%@page import="poll.PollListBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="poll.PollMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int listNum = Integer.parseInt(request.getParameter("num"));
		//� ������ ���� ��
		PollListBean plBean = mgr.getPoll(listNum);
		Vector<PollItemBean> vlist = mgr.getView(listNum); 
		//���� ������ sum ��ǥ��
		int sumCnt = mgr.sumCount(listNum);
		//���� ������ ���� ���� ��ǥ��
		int maxCnt = mgr.getMaxCount(listNum);
%>
<html>
<head>
<title>JSP Poll</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#FFFFCC">
<div align="center"><br/>
<h2>��ǥ ���</h2>
<table border="1" width="400">
	<tr>
		<td colspan="4"><b>Q : <%=plBean.getQuestion()%></b></td>
	</tr>
	<tr>
		<td colspan="3"><b>�� ��ǥ�� :  <%=sumCnt%>��</b></td>
		<td width="40"><b>count(%)</b></td>
	</tr>
	<%
			Random r = new Random();
			for(int i=0;i<vlist.size();i++){
				PollItemBean piBean = vlist.get(i);
				String item[] = piBean.getItem();
				int count = piBean.getCount();
				//����ǥ��/��ǥ��
				int ratio = (int)(Math.round((double)count/sumCnt*100));
				//������ ����
				String rgb = "#"+Integer.toHexString(r.nextInt(255*255*255));
	%>		
	<tr>
		<td width="20" align="center"><%=i+1%></td>
		<td width="120">
		<%if(maxCnt==count){%><font color="red"><b><%} %>
		 <%=item[0] %>
		 <%if(maxCnt==count){%></b></font><%}%>
		</td>
		<td>

			<table width="<%=ratio%>" height="15">
				<tr><td bgcolor="<%=rgb%>"></td></tr>
			</table>
		</td>
		<td width="40"><%=count%>(<%=ratio%>)</td>
	</tr>
	<%}//---for%>
</table><br>
<a href="javascript:window.close()">�ݱ�</a>
</div>
</body>
</html>








