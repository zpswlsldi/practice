<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#memberid").blur(function(){
			if($("#memberid").val()==""){
				$("#checkId").text("아이디를 입력하세요.");
				$("#memberid").focus();
			}else{
				$("#checkId").text();
			}
		});
		$("#memberpw").blur(function(){
			if($("#memberpw").val()==""){
				$("#checkPw").text("비밀번호를 입력하세요.");
				$("#memberpw").focus();
			}else if($("#memberpw").val().length<6){
				$("#checkPw").text("6자 이상이여야 합니다.");
				$("#memberpw").focus();
			}else{
				$("#checkPw").text();
			}
		});
		$("#membername").blur(function(){
			if($("#membername").val()==""){
				$("#checkName").text("이름을 입력하세요.");
				$("#membername").focus();
			}else if(!isNaN($("#membername").val())){
				$("#checkName").text("숫자는 입력할 수 없습니다.");
				$("#membername").focus();
			}else{
				$("#checkName").text();
			}
		});
		$("#memberage").blur(function(){
			if($("#memberage").val()==""){
				$("#checkAge").text("나이를 입력하세요.");
				$("#memberage").focus();
			}else if(isNaN($("#memberage").val())){
				$("#checkAge").text("문자는 입력할 수 없습니다.");
				$("#memberage").focus();
			}else if($("#memberage").val()<0){
				$("#checkAge").text("음수는 입력할 수 없습니다.");
				$("#memberage").focus();
			}else{
				$("#checkAge").text();
			}
		});
		$("#memberAction").click(function(){
			if(!isNaN($("#memberid").val())){
				$("#checkId").text("숫자만 입력하시면 안 됩니다.");
				$("#memberid").focus();
			}else if($("#memberpw").val()!=$("#memberpwcheck").val()){
				$("#checkPw").text("서로 내용이 일치해야 합니다.");
				$("#memberpw").focus();
			}else if($(".membergender:checked").length == 0){
				$("#checkGender").text("성별을 선택하세요.");
				$("#membergender").focus();
			}else{
				$("#addAction").submit();
			}
		});
	});
</script>
</head>
<body>
<h1>회원 가입 화면</h1>
<form id="addAction" action="<%= request.getContextPath() %>/member/memberAddAction.jsp" method="post">
	<div>
		<label>아이디 : </label>
		<input type="text" id="memberid" name="memberid">
		<span id="checkId"></span>
	</div>
	<div>
		<label>비밀번호 : </label>
		<input type="password" id="memberpw" name="memberpw">
		<label>비밀번호 확인 : </label>
		<input type="password" id="memberpwcheck" name="memberpwcheck">
		<span id="checkPw"></span>
	</div>
	<div>
		<label>이름 : </label>
		<input type="text" id="membername" name="membername">
		<span id="checkName"></span>
	</div>
	<div>
		<label>성별 : </label>
		<input type="radio" class="membergender" name="membergender" value="남">남
		<input type="radio" class="membergender" name="membergender" value="여">여
		<span id="checkGender"></span>
	</div>
	<div>
		<label>나이 : </label>
		<input type="text" id="memberage" name="memberage">
		<span id="checkAge"></span>
	</div>
	<div>
		<label>주소 : </label>
		<input type="text" id="memberaddress" name="memberaddress">
		<span id="checkAddress"></span>
	</div>
	<div>
		<input type="button" id="memberAction" value="가입">
	</div>
</form>
</body>
</html>