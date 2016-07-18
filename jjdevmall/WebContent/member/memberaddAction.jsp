<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String MEMBERID = request.getParameter("memberid");
	String MEMBERPW = request.getParameter("memberpw");
	String MEMBERNAME = request.getParameter("membername");
	String MEMBERGENDER = request.getParameter("membergender");
	int MEMBERAGE = Integer.parseInt(request.getParameter("memberage"));
	
	System.out.println("MEMBERID is " + MEMBERID);
	System.out.println("MEMBERPW is " + MEMBERPW);
	System.out.println("MEMBERNAME is " + MEMBERNAME);
	System.out.println("MEMBERGENDER is " + MEMBERGENDER);
	System.out.println("MEMBERAGE is " + MEMBERAGE);
	
	String jdbcDriver = "com.mysql.jdbc.Driver";
	Connection conn = null;
	PreparedStatement stmt = null;
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String password = "java0000";
		
	Class.forName(jdbcDriver);
	conn = DriverManager.getConnection(url, user, password);
	String sql = "insert into member(member_id,member_pw,member_name,member_gender,member_age) values(?,?,?,?,?)";
	stmt = conn.prepareStatement(sql);
	stmt.setString(1, MEMBERID);
	stmt.setString(2, MEMBERPW);
	stmt.setString(3, MEMBERNAME);
	stmt.setString(4, MEMBERGENDER);
	stmt.setInt(5, MEMBERAGE);
	stmt.executeUpdate();
	
%>
<h1>가입 완료되었습니다.</h1>
</body>
</html>