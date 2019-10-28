<%@ page language="java"
	contentType="application/vnd.ms-excel; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String fileName = (String)request.getAttribute("title");
	response.setHeader("Content-Disposition", "attachment; filename="+new String((fileName).getBytes("KSC5601"),"8859_1")+".xls");
	response.setHeader("Content-Description", "JSP Generated Date");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<c:choose>
		<c:when test="${ accType eq 2}">
			<table align="center">
				<thead>
					<tr>
						<td colspan="4">${title }</td>
					</tr>
					<tr>
						<td width="25%">계정과목</td>
						<td width="25%">금액</td>
						<td width="25%">계정과목</td>
						<td width="25%">금액</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list }">
						<tr>
							<td>${i.deptside }</td>
							<td>${i.account1 }</td>
							<td>${i.credit }</td>
							<td>${i.account2 }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>

		<c:otherwise>
			<table align="center">
				<thead>
					<tr>
						<td colspan="2">${title }</td>
					</tr>
					<tr>
						<td width="25%">계정과목</td>
						<td width="25%">금액</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list }">
						<tr>
							<td>${i.accountSubject }</td>
							<td>${i.account }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>