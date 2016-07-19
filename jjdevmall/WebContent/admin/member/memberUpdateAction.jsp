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
	request.setCharacterEncoding("UTF-8");
	String updateId = request.getParameter("updateId");
	String updatePw = request.getParameter("updatePw");
	String updateName = request.getParameter("updateName");
	String updateGender = request.getParameter("updateGender");
	int updateAge = Integer.parseInt(request.getParameter("updateAge"));
	System.out.println("updateId is " + updateId);
	System.out.println("updatePw is " + updatePw);
	System.out.println("updateName is " + updateName);
	System.out.println("updateGender is " + updateGender);
	System.out.println("updateAge is " + updateAge);
	
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
		String sql = "update member set member_pw = ?, member_name = ?, member_gender = ?, member_age = ? where member_id = ?";
		statement = connection.prepareStatement(sql);
		statement.setString(1, updatePw);
		statement.setString(2, updateName);
		statement.setString(3, updateGender);
		statement.setInt(4, updateAge);
		statement.setString(5, updateId);
		System.out.println("statement is " + statement);
		statement.executeUpdate();
	}catch(SQLException e){
		e.printStackTrace();
	}finally{
		if(statement != null) try{ statement.close();} catch(SQLException ex){}
		if(connection != null) try{ connection.close();} catch(SQLException ex){}
	}
	response.sendRedirect(request.getContextPath()+"/admin/member/memberListAll.jsp");
%>
</body>
</html>