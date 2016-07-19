<%@ page language="java" contentType="text/html; charesultSetet=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charesultSetet=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 목록</h1>
	<table border="1">
		<tr>
			<td>상품명</td><td>본가</td><td>할인율</td>
		</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;		
	
	try{
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "java0000";
		
		Class.forName(jdbcDriver);
		connection= DriverManager.getConnection(url, user, password);
		System.out.println("connection is " + connection);
		
		String sql = "select * from item";
		statement = connection.prepareStatement(sql);
		System.out.println("statement is " + statement);
		
		resultSet=statement.executeQuery();
		while(resultSet.next()){
%>
			<tr>
				<td><%= resultSet.getString("item_name") %></td>
				<td><%= resultSet.getString("item_name") %></td>
				<td><%= resultSet.getString("item_rate") %></td>
			</tr>
<%	
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(resultSet != null) try{resultSet.close();} catch(Exception ex){}
		if(statement != null) try{statement.close();} catch(Exception ex){}
		if(connection != null) try{connection.close();} catch(Exception ex){}
	}
%>
	</table>
</body>
</html>