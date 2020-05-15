<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>testPage</title>
	<style>
		#test{
			margin:auto;
			marign-top:30px;
			width:500px;
			height:300px;
			border:1px solid #cccccc;
		}
		.rowR{
			margin:auto;
			width:400px;
			height:30px;
			display:flex;
			align-items:center;
			justify-content:center;
		}
		.rowrow{
			float:left;
		}
		#submit{
			margin:auto;
			margin-top:50px;
			width:500px;
			display:flex;
			justify-content:center;
			align-items:center;
		}
	</style>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		function imsi(){
			//alert($("#memberId").val());	
			$.ajax({
				type:"POST",
				//url:"sendkey.jsp",
				url:"fitness/main/naverSender.do",
				data:"memberId="+$("#memberId").val(),
				dataType:'JSON',
				success:function(data){		
					//$("#imsi").val(data.key);
					
				}
			});
		}
		function imsi2(){
			if(document.pkc.key.value!=document.pkc.imsi.value){
				alert("발송된 인증키가 일치하지 않습니다.");
				return false;
			}
			document.pkc.action="imsi.jsp";
			document.pkc.submit();
		}
	</script>
</head>
<body>
	<form name="pkc">
		<div id="test">
			<div class="rowR">
				<div>
					<div class="rowrow">ID : </div>
					<div class="rowrow">
						<input id="memberId" name="memberId" type="text">
						<span onclick="imsi()">메일받기</span>
					</div>
				</div>
				
			</div>
			<div class="rowR">
				key:<input id="key" name="key" type="text" placeholder="key입력">
				<input id="imsi" name="imsi" type="hidden" value="">
			</div>
			<div id="submit">
				<input type="button" value="제출" onclick="imsi2()">
			</div>
		</div>
	</form>
</body>
</html>