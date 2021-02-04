package shop;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend {
	
	private static class SMTPAuthenticator extends Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			//������ ���̵� , ��й�ȣ
			return new PasswordAuthentication("jinamunichenerin1003", "asdf4720asdf4720!");
			//"������ gmail ID", "������ ���"
		}
	}
	
	
	public static void send(String title, String content, String toEmail) {
		
		Properties p = new Properties();
		p.put("mail.smtp.user", "jinamunichenerin1003@gmail.com"); //���� ������
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true); 

			MimeMessage msg = new MimeMessage(session);
			String message = content;
			msg.setSubject(title);
			
			Address fromAddr = new InternetAddress("jinamunichenerin1003@gmail.com"); 
			msg.setFrom(fromAddr);
			
			Address toAddr = new InternetAddress(toEmail); 
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/html;charset=KSC5601");
	
			Transport.send(msg);
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
		public static void main(String[] args) {
			MailSend.send("�׽�Ʈ�Դϴ�.", "�氡�氡", "jinamunichenerin1003@gmail.com");
			System.out.println("����");
		}
	}





