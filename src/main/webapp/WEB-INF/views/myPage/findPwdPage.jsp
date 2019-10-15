<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<style type="text/css">
	table tr{
		height: 50px;
		color: black;
		font-size: 20px;
	}
</style>
<title>비밀번호 찾기</title>
</head>
<body>

	<div class="content-fluid" style="height: 100px;" align="center">
		<h1>비밀번호 찾기</h1>
		<br><br>
		<form action="findNo.wo">
			<table width="400" celspacing="5" border="1">
				<tr>
					<td>사번</td>
					<td><input type="number" name="empNo" required></td>
				</tr>
				
				
				<tr>
					<td>이름</td>
					<td><input type="text" name="empName" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" required></td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="btn btn-secondary btn-lg">찾기</button>
		</form>
	</div>
		
</body>
</html>