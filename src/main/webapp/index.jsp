<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<head>
<!-- axios 불러오는 CDN -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<title>메인 페이-지</title>

<!-- 최신 버전의 jQuery 불러오기 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

// 데이터 생성 함수
	function Create() {
		var name = $("input#name").val();
		var age = $("input#age").val();

		//post 참조값이 java Controller 주소와 맞춰야 함
		axios.post("create", {
			name : name,
			age : age,
		}).then(function(res) {
			console.log(res.data);
		})
	}

//데이터 목록 조회
	var datas =[];
	function read(){
		axios.get("read").then(new Promise(function(res) {
			return res.data;
		})).then(function (temp) {
			datas=temp;
			console.log(datas,"2");
			return datas;
		})
		console.log(datas,"4");
		var text = '';
		
		for(var i=0; i < datas.length; ++i){
			text+= '<td>' + datas[i].name + '</td>'
			text+= '<td>' + datas[i].age.toString + '</td>' + '<br/>'
		}

	}

	//데이터 갱신
	function Update() {
		var name = $("input#updateName").val();
		var age = $("input#updateAge").val();

		axios.post("update", {
			name : name,
			age : age,
		}).then(function(res) {
			console.log(res.data);
		})
	}

	//데이터 이름 기준 검색 후 삭제
	function deleteByName() {
		var name = $("input#deleteName").val();

		axios.post("delete", {
			name : name,
			age : age,
		}).then(function(res) {
			console.log(res.data);
		})
	}
	
	/* //div(내용) 표시하고 숨기는 부분
	function readText(){
		var text = document.getElementById("read");
		if(text.style.display === "none"){
			text.style.display = "block";
			console.log("목록 표시");
		} else{
			text.style.display = "none";
			console.log("목록 숨김");
		}
	}
	function createText(){
		var text = document.getElementById("create");
		if(text.style.display === "none"){
			text.style.display = "block";
			console.log("작성 표시");
		} else{
			text.style.display = "none";
			console.log("작성 숨김");
		}
	}
	function updateText(){
		var text = document.getElementById("update");
		if(text.style.display === "none"){
			text.style.display = "block";
			console.log("갱신 표시");
		} else{
			text.style.display = "none";
			console.log("갱신 숨김");
		}
	}
	function deleteText(){
		var text = document.getElementById("delete");
		if(text.style.display === "none"){
			text.style.display = "block";
			console.log("삭제 표시");
		} else{
			text.style.display = "none";
			console.log("삭제 숨김");
		}
	} */
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
	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="read()">오라-클 데이타 目錄(Read)</button>

	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="createText()">오라-클 데이타 作成(Create)</button>

	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="updateText()">오라-클 데이타 更新(Update)</button>

	&nbsp;&nbsp;&nbsp;&nbsp;
	<button onclick="deleteText()">오라-클 데이타 削除(Delete)</button>
	<hr />
	&nbsp;&nbsp;&nbsp;&nbsp;

	<br />
	<!-- Read -->
	<div id="read">
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

			<%-- <c:forEach var="datas" items="${datas}" begin=0 end="${datas.length}" step=1> --%>
				<tr>
<%-- 					<td>${datas.name}</td>
					<td>${datas.age}</td> --%>
					<script>
					//foreach 왜 안 먹지?????
					document.getElementById("read")
					</script>
				</tr>
			<%-- </c:forEach> --%>
		</tbody>
	</table>
<script>console.log("목록 끝")</script>
	<br />
	<hr />
	</div>
	
	<!-- Create -->
	
<!-- 	<div id="create" style="display: none" > -->
<!-- 	 <div id="create" >
		<h1>오라-클 데이타 作成</h1>
		<hr />
			<form method="post">
				姓名(한글로 쓰시오): <input type="text" id="createName"/><br/>
				年齡(숫자로 쓰시오): <input type="text" id="createAge"/><br/>
				<input type="submit" value="追加">
				<script type="text/javascript">
				if(name === "" || age === "") {
				alert("빈 部分이 있읍니다.");
				} else {
				alert("追加되었읍니다.");
				}
				</script>
				
			</form>
		
	</div> 
	 -->
	<!-- Update-->
<!-- 
	<div id="update" >

		<h1>오라-클 데이타 更新</h1>
		<hr />
		<form action="ReadView.jsp" method="post">
		姓名: <input type="text" id="updateName" /><br /> 
		年齡: <input type="text" id="updateAge" /><br />
		<input type="submit" value="更新">
		</form>
	</div>



	Delete
	
	<div id="delete">
			<h1>오라-클 데이타 削除</h1><br/>
			<h3>姓名 검색 후 削除</h3>
		<hr />

		<form action="ReadView.jsp" method="post">
			姓名: <input type="text" id="deleteName" /><br /> 
			年齡: <input type="text"	 id="deleteAge" /><br /> 
				<input type="submit" value="削除">
		</form>

	</div>
	 -->
</body>