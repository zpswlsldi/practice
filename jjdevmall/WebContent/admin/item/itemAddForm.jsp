<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#itemName").blur(function(){
			if($("#itemName").val()==""){
				$("#checkitemName").text("상품명을 입력하세요.");
				$("#itemName").focus();
			}
		});
		$("#itemPrice").blur(function(){
			if($("#itemPrice").val()==""){
				$("#checkitemPrice").text("본가를 입력하세요.");
				$("#itemPrice").focus();
			}
		});
		$("#itemRate").blur(function(){
			if($("#itemRate").val()==""){
				$("#checkitemRate").text("할인율을 입력하세요.");
				$("#itemRate").focus();
			}
		});
		$("#itemAction").click(function(){
			if(!isNaN($("#itemName").val())){
				$("#checkitemName").text("숫자만 입력할 수 없습니다.");
				$("#itemName").focus();
			}else if($("#itemPrice").val()<0){
				$("#checkitemPrice").text("음수를 입력할 수 없습니다.");
				$("#itemPrice").focus();
			}else if(isNaN($("#itemPrice").val())){
				$("#checkitemPrice").text("문자를 입력할 수 없습니다.");
				$("#itemPrice").focus();
			}else if($("#itemRate").val()<0 || $("#itemRate").val()>1){
				$("#checkitemRate").text("할인율은 0과 1 사이의 수만 쓸 수 있습니다.");
				$("#itemRate").focus();
			}else if(isNaN($("#itemRate").val())){
				$("#checkitemRate").text("할인율엔 문자가 들어갈 수 없습니다.");
				$("#itemRate").focus();
			}else{
				$("#additem").submit();
			}
		});
	});
</script>
<body>
<form id="additem" action="<%=request.getContextPath()%>/admin/item/itemAddAction.jsp" method="post">
	<div>
		<label>상품명 : </label>
		<input type="text" id="itemName" name="itemName">
		<span id="checkitemName"></span>
	</div>
	<div>
		<label>본가 : </label>
		<input type="text" id="itemPrice" name="itemPrice">
		<span id="checkitemPrice"></span>
	</div>
	<div>
		<label>할인율 : </label>
		<input type="text" id="itemRate" name="itemRate">
		<span id="checkitemRate"></span>
	</div>
	<div>
		<input type="button" id="itemAction" value="등록">
	</div>
</form>
</body>
</html>