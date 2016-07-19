<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#loginButton").click(function(){
			if($("#adminId").val()==""){
				$("#idCheck").text("아이디를 입력하세요.");
				$("#adminId").focus();
			}else if($("#adminPw").val()==""){
				$("#pwCheck").text("비밀번호를 입력하세요.");
				$("#adminPw").focus();
			}else{
				$("#loginForm").submit();
			}
		});
	});
</script>
<body>
	<h1>관리자 로그인 화면</h1>
<%
	String sessionAdminId = (String)session.getAttribute("sessionAdminId");
	if(sessionAdminId == null) { // 로그인이 안된 상태
%>
		<form id="loginForm" action="<%=request.getContextPath()%>/admin/member/adminLoginAction.jsp">
			<!-- 로그인 폼 구현 -->
			<div>
				<label>아이디 : </label>
				<input type="text" id="adminId" name="adminId">
				<span id="idCheck"></span>
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="password" id="adminPw" name="adminPw">
				<span id="pwCheck"></span>
			</div>
			<div>
				<input type="button" id="loginButton" value="로그인">
			</div>
		</form>
<%		
	} else { // 로그인이 된 상태
%>
		<%= sessionAdminId %> 님이 로그인 중입니다. <a href="<%=request.getContextPath()%>/admin/member/adminLogout.jsp">::로그아웃::</a>
		<ol>
			<li><a href="<%=request.getContextPath()%>/admin/item/itemList.jsp">상품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/">주문관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin/member/memberListAll.jsp">회원관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>