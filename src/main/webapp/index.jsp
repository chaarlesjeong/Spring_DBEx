<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>메인 페이-지</title>

<!-- 최신 버전의 jQuery 불러오기 -->
<!-- dataType를 json으로 고칠 것 -->
<script type="text/javascript">
	/* $(document).ready(function() {

		$.ajax({
			type : "POST",
			url : "InputData.jsp",
			datatype : "json",
			error : function() {
				alert('通新 失敗!, 다시 試圖하십시요.');
			},
			success : function(Parse_data) {

				$("#Parse_Area").html(Parse_data);
				alert("通新 데이타 값 : " + Parse_data);
			}

		});
	});
	 */

	$(function() {
		$("#readButton").click(function() {

			$.ajax({
				url : "read",
				async : false,
				type : "post",
				dataType : "json",
				success : function(json) {
					console.log(json);
				},
				error : function() {
					alert("通新 失敗!, 다시 試圖하십시요.")
				}
			});
		});
	});
</script>



</head>

<body>
	<%=new Date()%>
	<br />
	<h4>世界로 雄飛하는 超一流 企業-----비-트 콤퓨타</h4>
	<h2>오라-클 데이타 시스템</h2>
	<br />
	<h3>원하시는 技能을 選擇하세요.</h3>
	<br />
	<hr />
	<a href="read">오라-클 데이타 目錄(Read)</a>
	<br />
	<a href="create">오라-클 데이타 作成(Create)</a>
	<br />
	<a href="update">오라-클 데이타 更新(Update)</a>
	<br />
	<a href="delete">오라-클 데이타 削除(Delete)</a>
	<br />



	<a href="read">오라-클 데이타 目錄(Read)</a>
	<br /> &nbsp;&nbsp;&nbsp;&nbsp;
	<button id="readButton">이 페이지에 데이타 卽時 要請(Read)</button>
	<div id="listLayout"></div>


	<!-- 	<button id="id01">이 페이지에 데이타 卽時 要請(Read)</button><br/> -->
</body>