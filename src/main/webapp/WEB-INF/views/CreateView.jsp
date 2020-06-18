<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>InsertView</title>
</head>
<body>
	<h1>오라-클 데이타 作成</h1>
	<hr />

<c:forEach var="array" items="${array}">
<form action="ReadView.jsp" method="post">
姓名: <input type="text" name="name" />${array.name}<br/>
年齡: <input type="text" name="age" />${array.age}<br/>
<input type="submit" value="追加"
<script type="text/javascript">
if(name === "" || age === "") {alert("빈 部分이 있읍니다.")}
</script>
>
</form>
</c:forEach>

<br/>
	
	<a href="
<c:url value='index.jsp' />
">Home畵面</a>

</body>
</html>