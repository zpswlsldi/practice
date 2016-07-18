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
	String ITEMNAME = request.getParameter("itemname");
	int ITEMPRICE = Integer.parseInt(request.getParameter("itemprice"));
	double ITEMRATE = Double.parseDouble(request.getParameter("itemrate"));
	
	System.out.println("ITEMNAME is " + ITEMNAME);
	System.out.println("ITEMPRICE is " + ITEMPRICE);
	System.out.println("ITEMRATE is " + ITEMRATE);
	
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
		stmt.setString(1, ITEMNAME);
		stmt.setInt(2, ITEMPRICE);
		stmt.setDouble(3, ITEMRATE);
		System.out.println(stmt);
		stmt.executeUpdate();
		conn.commit();
	}catch(Exception e){
		conn.rollback();
		e.printStackTrace();
	}finally{
		stmt.close();
		conn.close();
	}
%>
<h1>가입 완료되었습니다.</h1>
</body>
</html>