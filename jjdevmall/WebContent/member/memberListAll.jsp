<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<h1>전체 회원 목록</h1>
	<table border="1">
		<tr>
			<td>아이디</td><td>비밀번호</td><td>이름</td><td>성별</td><td>나이</td>
		</tr>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String jdbcDriver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
	String user = "root";
	String password = "java0000";			
	
	try{
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(url, user, password);
		String sql = "select * from member";
		stmt = conn.prepareStatement(sql);
		rs=stmt.executeQuery();
		while(rs.next()){
%>
			<tr>
				<td><%= rs.getString("member_id") %></td>
				<td><%= rs.getString("member_pw") %></td>
				<td><%= rs.getString("member_name") %></td>
				<td><%= rs.getString("member_gender") %></td>
				<td><%= rs.getInt("member_age") %></td>
			</tr>
<%	
		}
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();} catch(SQLException ex){}
		if(stmt != null) try{stmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex){}
	}
%>
	</table>
</body>
</html>