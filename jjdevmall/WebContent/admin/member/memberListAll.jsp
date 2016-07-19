<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String sessionAdminId = (String)session.getAttribute("sessionAdminId");
	if(sessionAdminId == null) { // 로그인이 안된 상태
		response.sendRedirect(request.getContextPath()+"/admin/adminIndex.jsp");
	} else { // 로그인이 된 상태
%>
		<h1>전체 회원 목록</h1>
		<%= sessionAdminId %> 님이 로그인 중입니다. <a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">::로그아웃::</a><br><br>
		<table border="1">
			<tr>
				<td>No</td><td>아이디</td><td>비밀번호</td><td>이름</td><td>성별</td><td>나이</td><td>수정</td><td>삭제</td>
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
					<td><%= rs.getString("member_no") %></td>
					<td><%= rs.getString("member_id") %></td>
					<td><%= rs.getString("member_pw") %></td>
					<td><%= rs.getString("member_name") %></td>
					<td><%= rs.getString("member_gender") %></td>
					<td><%= rs.getInt("member_age") %></td>
					<td><a href="<%=request.getContextPath()%>/admin/member/memberUpdateList.jsp?send_Id=<%=rs.getString("member_id")%>">수정</a></td>
					<td><a href="<%=request.getContextPath()%>/admin/member/memberDeleteAction.jsp?send_Id=<%=rs.getString("member_id")%>">삭제</a></td>
				</tr>
	<%	
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();} catch(SQLException ex){}
			if(stmt != null) try{stmt.close();} catch(SQLException ex){}
			if(conn != null) try{conn.close();} catch(SQLException ex){}
		}
	%>
		</table>
	<%		
	}
%>
</body>
</html>