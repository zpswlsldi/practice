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
		$("#itemname").blur(function(){
			if($("#itemname").val()==""){
				$("#checkitemname").text("상품명을 입력하세요.");
				$("#itemname").focus();
			}
		});
		$("#itemprice").blur(function(){
			if($("#itemprice").val()==""){
				$("#checkitemprice").text("본가를 입력하세요.");
				$("#itemprice").focus();
			}
		});
		$("#itemrate").blur(function(){
			if($("#itemrate").val()==""){
				$("#checkitemrate").text("할인율을 입력하세요.");
				$("#itemrate").focus();
			}
		});
		$("#itemaction").click(function(){
			if(!isNaN($("#itemname").val())){
				$("#checkitemname").text("숫자만 입력할 수 없습니다.");
				$("#itemname").focus();
			}else if($("#itemprice").val()<0){
				$("#checkitemprice").text("음수를 입력할 수 없습니다.");
				$("#itemprice").focus();
			}else if(isNaN($("#itemprice").val())){
				$("#checkitemprice").text("문자를 입력할 수 없습니다.");
				$("#itemprice").focus();
			}else if($("#itemrate").val()<0 || $("#itemrate").val()>1){
				$("#checkitemrate").text("할인율은 0과 1 사이의 수만 쓸 수 있습니다.");
				$("#itemrate").focus();
			}else if(isNaN($("#itemrate").val())){
				$("#checkitemrate").text("할인율엔 문자가 들어갈 수 없습니다.");
				$("#itemrate").focus();
			}else{
				$("#additem").submit();
			}
		});
	});
</script>
<body>
<form id="additem" action="<%=request.getContextPath()%>/item/itemAddAction.jsp" method="post">
		<div>
		상품명 : <input type="text" id="itemname" name="itemname">
		<span id="checkitemname"></span>
	</div>
	<div>
		본가 : <input type="text" id="itemprice" name="itemprice">
		<span id="checkitemprice"></span>
	</div>
	<div>
		할인율 : <input type="text" id="itemrate" name="itemrate">
		<span id="checkitemrate"></span>
	</div>
	<div>
		<input type="button" id="itemaction" value="등록">
	</div>
</form>
</body>
</html>