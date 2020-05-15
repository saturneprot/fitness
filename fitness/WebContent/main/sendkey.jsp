<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- sendkey --%>
<%
String memberId = request.getParameter("memberId");

// 먼저 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
/*
 * Member m = new MemberService().memberLogin(memberId); if(m==null ||
 * !m.getEmail().equals(email)) { req.setAttribute("msg",
 * "아이디나 이메일 정보가 맞지 않습니다"); req.setAttribute("loc", "/member/searchPw");
 * req.getRequestDispatcher("/views/common/msg.jsp").forward(req, resp); return;
 * }
 */
// mail server 설정
String host = "smtp.naver.com";
String user = "eeprot@naver.com"; // 자신의 네이버 계정
String password = "94febYth&&";// 자신의 네이버 패스워드

// 메일 받을 주소
/* String to_email = m.getEmail(); */
String to_email = "eprot@naver.com";

// SMTP 서버 정보를 설정한다.
Properties props = new Properties();
props.put("mail.smtp.host", host);
props.put("mail.smtp.port", 465);
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.ssl.enable", "true");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.debug", "true");

// 인증 번호 생성기
StringBuffer temp = new StringBuffer();
Random rnd = new Random();
for (int i = 0; i < 10; i++) {
	int rIndex = rnd.nextInt(3);
	switch (rIndex) {
	case 0:
		// a-z
		temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		break;
	case 1:
		// A-Z
		temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		break;
	case 2:
		// 0-9
		temp.append((rnd.nextInt(10)));
		break;
	}
}
String AuthenticationKey = temp.toString();
System.out.println(AuthenticationKey);

Session session22 = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(user, password);
	}
});

// email 전송
try {
	MimeMessage msg = new MimeMessage(session22);
	msg.setFrom(new InternetAddress(user, "IMSI"));
	msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));

	// 메일 제목
	msg.setSubject("안녕하세요  인증 메일입니다.");
	// 메일 내용
	msg.setText("인증 번호는 :" + temp);

	Transport.send(msg);
	System.out.println("이메일 전송");

} catch (Exception e) {
	e.printStackTrace();// TODO: handle exception
}

%>
{
"key":<%= AuthenticationKey %>
}
