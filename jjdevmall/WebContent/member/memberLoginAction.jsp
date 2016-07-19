<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
	System.out.println("memberId is " + memberId);
	System.out.println("memberPw is " + memberPw);
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	try{
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "java0000";
		
		Class.forName(jdbcDriver);
		connection = DriverManager.getConnection(url, user, password);
		System.out.println("connection is " + connection);
		
		String sql = "select * from member where member_id = ? and member_pw = ?";
		statement = connection.prepareStatement(sql);
		statement.setString(1, memberId);
		statement.setString(2, memberPw);
		System.out.println("statement is " + statement);
		
		resultSet = statement.executeQuery();
		if(resultSet.next()) {
			System.out.println("로그인 성공");
			// 세션에 아이디값 저장
			session.setAttribute("sessionMemberId", resultSet.getString("member_id"));
		} else {
			System.out.println("로그인 실패");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if(resultSet != null) try{resultSet.close();} catch(Exception ex){}
		if(statement != null) try{statement.close();} catch(Exception ex){}
		if(connection != null) try{connection.close();} catch(Exception ex){}
	}
	response.sendRedirect(request.getContextPath()+"/index.jsp");
%>
</body>
</html>