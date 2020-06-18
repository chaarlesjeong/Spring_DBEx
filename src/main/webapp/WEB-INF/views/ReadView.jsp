<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReadView</title>

<!-- axios 불러오는 CDN -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
	function Read() {
		axios.get("read").then(function(res) {
			console.log(res.data);
		})
	}
</script>
</head>
<body>
	<h1>오라-클 데이타 目錄</h1>
	<hr />

	<table border="1">
		<thead>
			<tr>
				<th>姓名</th>
				<th>年齡</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="array" items="${array}">
				<tr>
					<td>${array.name}</td>
					<td>${array.age}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br />
	<hr />
	<a href="
<c:url value='index.jsp' />
">Home畵面</a>

</body>
</html>