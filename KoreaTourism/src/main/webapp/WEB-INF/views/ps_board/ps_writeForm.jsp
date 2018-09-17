<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap file -->
<link rel="stylesheet" href="resources/ps_design/css/bootstrap.css">
<link rel="stylesheet" href="resources/ps_design/css/custom.css">
<link rel="shortcut icon" href="#">
<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
<!-- Google jQuery file -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/ps_design/js/bootstrap.js"></script>
<title>게시글 상세보기</title>
</head>

<body>

	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<a class="navbar-brand" href="#">한국관광공사</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="list"></a></li>
				<li class="nav-item"><a class="nav-link" href="list"></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbargrop"
					data-toggle="dropdown">접속</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#"></a> <a class="dropdown-item"
							href="#"></a>
					</div></li>
			</ul>
		</div>
	</nav>
	<section>
		<div id="board-list" class="container">
			<!-- 부트스트랩 이용한 그리드 시스템 -->
			<div class="row">
				<!-- 12칸 분할 -->
				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<form action="ps_insert">
					<table border="1">
						<fieldset class="form-group">

							<legend class="border-bottom mb-4">글을 씁시댜</legend>
							
							<div class="form-group">
								<label class="form-control-label">글 제목</label> <input
									class="form-control form-control-lg" type="text" name="b_title"
									required autofocus>
							</div>

							<div class="form-group">
								<label class="form-control-label">글 내용</label>
								<textarea id="textAreaContent" name="b_content" rows="10"
									cols="80" style="width: 100%"></textarea>
							</div>
						</fieldset>
					</table>
					<div class="form-group">
						<button class="btn btn-outline-success" type="submit"
							style="float: right">글쓰기</button>
					</div>
				</form>

				</div>
			</div>
			<!-- row(12분할) END -->
		</div>
		<!-- container END -->
	</section>

</body>
</html>