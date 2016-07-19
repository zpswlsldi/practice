<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>개인 정보 수정</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
		response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
	}else { // 로그인이 된 상태
		request.setCharacterEncoding("UTF-8");
		String sendId = request.getParameter("send_Id");
		System.out.println("sendId is "+ sendId);
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
			
		String updateId = null;
		String updatePw = null;
		String updateName = null;
		String updateGender = null;
		int updateAge = 0;
		try{
			String jdbcDriver = "com.mysql.jdbc.Driver"; 
			Class.forName(jdbcDriver);
			String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
			String user = "root";
			String password = "java0000";
			
			connection = DriverManager.getConnection(url, user, password);
			String sql = "select member_id, member_pw, member_name, member_gender, member_age from member where member_id = ?";
			System.out.println("connection is " + connection);
			
			statement = connection.prepareStatement(sql);
			statement.setString(1, sendId);
			System.out.println("statement is " + statement);
			resultSet = statement.executeQuery();
			if(resultSet.next()){
				updateId = resultSet.getString("member_id");
				updatePw = resultSet.getString("member_pw");
				updateName = resultSet.getString("member_name");
				updateGender = resultSet.getString("member_gender");
				updateAge = resultSet.getInt("member_age");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if (statement != null) try { statement.close(); } catch(SQLException ex) {}
			if (connection != null) try { connection.close(); } catch(SQLException ex) {}
		}
%>
<form action="<%=request.getContextPath() %>/admin/member/memberUpdateAction.jsp" method="post">
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><input type="hidden" id="updateId" name="updateId" value=<%= updateId %>><%= updateId %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" id="updatePw" name="updatePw" value=<%= updatePw %>></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" id="updateName" name="updateName" value=<%= updateName %>></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="text" class="updateGender" name="updateGender" value=<%= updateGender %>></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" id="updateId" name="updateAge" value=<%= updateAge %>></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="수정버튼"></td>
		</tr>
	</table>
</form>
<%
	}
%>
</body>
</html>