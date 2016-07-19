<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String sessionMemberId = (String)session.getAttribute("sessionMemberId");
int itemNo = Integer.parseInt(request.getParameter("itemNo"));

if(sessionMemberId == null){
	response.sendRedirect(request.getContextPath()+"/index.jsp");
}else{
	// 주문 폼 구현orders
	
	// SELECT JDBC 코드
	// int itemPrice = ?
	// int itemRate = ?
%>
	<form action="">
		<div>
			itemNo : 
			<input type="text" value="<%= itemNo %>" readonly="readonly"/>
		</div>
		<div>
			itemPrice :
			<%-- <span><%= itemPrice %></span>
			<span><%= itemPrice*(1-itemRate) %></span>
			<span>()할인율:<%= itemRate %>)</span> --%>
		</div>		
		<div>
			ordersQuantity :
			<select>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
		</div>
		<div>
			total : <span></span>
		</div>
	</form>
<%
}
%>
</body>
</html>