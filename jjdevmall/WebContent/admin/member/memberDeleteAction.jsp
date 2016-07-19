<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String sendId = request.getParameter("sendId");
	System.out.println("sendId is " + sendId);
	Connection connection = null;
	PreparedStatement statement = null;
		
	try{
		String jdbcDriver = "com.mysql.jdbc.Driver";
		Class.forName(jdbcDriver);
		String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "java0000";
		connection = DriverManager.getConnection(url, user, password);
		System.out.println("connection is " + connection);
		
		String sql = "delete from member where member_id = ?";
		statement = connection.prepareStatement(sql);
		statement.setString(1, sendId);
		System.out.println("statement is " + statement);
		
		statement.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(statement != null) try{statement.close();} catch(SQLException ex){}
		if(connection != null) try{connection.close();} catch(SQLException ex){}
	}
%>
</body>
</html>