<!-- updateGuestBookProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="guestbook.GuestBookMgr"/>
<jsp:useBean id="bean" class="guestbook.GuestBookBean"/>
<jsp:setProperty property="*" name="bean"/>
<%
		if(bean.getSecret()==null)
			bean.setSecret("0");//��б��� üũ���� ������ �Ӽ�=�� ��ü�� �Ѿ���� �ʴ´�.
		mgr.updateGuestBook(bean);	
%>
<!-- ������ ���� â�� close�ǰ� ������ ���ϱ��� ������ �Ƿ��� 
showGuestBook.jsp ���ΰ�ħ -->
<script>
	opener.location.reload();
	self.close();
</script>







