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
	String itemName = request.getParameter("itemName");
	int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
	double itemRate = Double.parseDouble(request.getParameter("itemRate"));
	
	System.out.println("itemName is " + itemName);
	System.out.println("itemPrice is " + itemPrice);
	System.out.println("itemRate is " + itemRate);
	
	Connection conn = null;
	PreparedStatement stmt = null;
	
	try{
		String jdbcDriver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jjdevmall?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "java0000";
		
		Class.forName(jdbcDriver);
		conn = DriverManager.getConnection(url, user, password);
		conn.setAutoCommit(false);
		
		String sql = "insert into item(item_name,item_price,item_rate) values(?,?,?)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, itemName);
		stmt.setInt(2, itemPrice);
		stmt.setDouble(3, itemRate);
		System.out.println(stmt);
		stmt.executeUpdate();
		conn.commit();
	}catch(SQLException e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		if(stmt != null) try{stmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex){}
	}
%>
<h1>등록 완료되었습니다.</h1>
</body>
</html>