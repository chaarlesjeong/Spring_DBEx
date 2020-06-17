<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UpdateView</title>
</head>
<body>
	<h1>오라-클 데이타 更新</h1>
	<hr />

<form action="ReadView.jsp" method="post">
姓名: <input type="text" name="name" /><br/>
年齡: <input type="text" name="age" /><br/>
<input type="submit" value="更新">
</form>
	

	<hr />
	<a href="
<c:url value='index.jsp' />
">Home畵面</a>

</body>
</html>