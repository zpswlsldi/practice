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
			if($("#memberId").val()==""){
				$("#idCheck").text("아이디를 입력하세요.");
				$("#memberId").focus();
			}else if($("#memberPw").val()==""){
				$("#pwCheck").text("비밀번호를 입력하세요.");
				$("#memberPw").focus();
			}else{
				$("#loginForm").submit();
			}
		});
	});
</script>
<body>
	<h1>로그인 화면</h1>
<%
	String sessionMemberId = (String)session.getAttribute("sessionMemberId");
	if(sessionMemberId == null) { // 로그인이 안된 상태
%>
		<form id="loginForm" action="<%=request.getContextPath()%>/member/memberLoginAction.jsp">
			<!-- 로그인 폼 구현 -->
			<div>
				<label>아이디 : </label>
				<input type="text" id="memberId" name="memberId">
				<span id="idCheck"></span>
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="password" id="memberPw" name="memberPw">
				<span id="pwCheck"></span>
			</div>
			<div>
				<input type="button" id="loginButton" value="로그인">
			</div>
		</form>
<%		
	}else{ // 로그인이 된 상태
%>
		<%= sessionMemberId %> 님이 로그인 중입니다. <a href="<%=request.getContextPath()%>/member/memberLogout.jsp">::로그아웃::</a>
		<ol>
			<li><a href="<%=request.getContextPath()%>/item/itemList.jsp">상품 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/orders/ordersAddForm.jsp">주문 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/member/memberList.jsp">내 정보 관리</a></li>
		</ol>
<%		
	}
%>
</body>
</html>