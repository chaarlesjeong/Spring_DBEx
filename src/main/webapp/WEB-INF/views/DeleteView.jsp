<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeleteView</title>
</head>
<body>
	<h1>오라-클 데이타 削除</h1><br/>
	<h3>姓名 검색 후 削除</h3>
	<hr />

<form action="ReadView.jsp" method="post">
姓名: <input type="text" name="name" /><br/>
年齡: <input type="text" name="age" /><br/>
<input type="submit" value="削除">
</form>

</body>
</html>