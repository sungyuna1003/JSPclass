package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/servlet/exServlet1") //URL  mapping��
public class ExServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		//���� ��Ʈ��
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>��Ŭ������ ���� �����</h1>");
		out.println("����ID : " + session.getId());
		out.println("</body>");
		out.println("</html>");
	}
}























