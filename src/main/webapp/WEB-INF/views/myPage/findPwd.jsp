<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
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
		<br><br>
		<h1>비밀번호 찾기</h1>
		<br><br>
		<form action="findPwd.wo">
			<table width="400" celspacing="5">
				<tr>
					<td>사번</td>
					<td><input type="number" name="empNo" required></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="empName" required></td>
				</tr>
			</table>
			<br><br>
			<button type="submit" class="btn btn-secondary btn-lg">찾기</button>
			<button type="button" class="btn btn-secondary btn-lg" onclick="history.back();">뒤로가기</button>
		</form>
	</div>
		
</body>
</html>