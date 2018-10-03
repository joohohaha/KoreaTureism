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
<link rel="stylesheet" href="resources/boardDesign/ps_design/css/bootstrap.css">
<link rel="stylesheet" href="resources/boardDesign/ps_design/css/custom.css">
<link rel="shortcut icon" href="#">
<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
<!-- Google jQuery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/boardDesign/ps_design/js/bootstrap.js"></script>


<title>POSTSCRIPT BOARD</title>
</head>
<body>

	<!-- ----------------------------------------------------------------------------- -->
	
	<!-- 헤드 -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<a class="navbar-brand" href="index">한국관광공사</a>
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
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="index" id="navbargrop" data-toggle="dropdown">접속</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">뭘?</a>
						<a class="dropdown-item" href="#">꼬라</a>
						<a class="dropdown-item" href="#">보노보노</a>
					</div>
				</li>
			</ul>
		</div>
	</nav>
	<br>
	<!-- 헤드 끝 -->
	
	<!-- ----------------------------------------------------------------------------- -->
	
	<!-- 녹색 -->
	<div class="container jumbotron">
		<h1>POSTSCRIPT BOARD</h1>
	</div>
	<!-- 녹색 끝 -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">Realtime Popularity Area</h1>
			<br>
			<div class="list-group">
				<button type="button" class="list-group-item list-group-item-action" disabled>NewYork 가고 싶다.</button>
				<button type="button" class="list-group-item list-group-item-action" disabled>Cancún 가고 싶다.</button>
				<button type="button" class="list-group-item list-group-item-action" disabled>집에 가고 싶다.</button>
				<button type="button" class="list-group-item list-group-item-action" disabled>제주도에 가고 싶다.</button>
				<button type="button" class="list-group-item list-group-item-action" disabled>아싸 월화 안온다. goodluck</button>
			</div>
		</div>
	</div>
	
	<!-- ----------------------------------------------------------------------------- -->
	
	<!-- 게시판 -->
	<section class="bg-light">
		<div class="container">

			<!-- 1번 라인 -->
			<!-- 왼쪽친구 -->
			<div class="container">
				<table class="table table-striped" border="1">

					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>글제목</td>
						<td>글내용</td>
						<td>작성일</td>
						<td>수정일</td>

						<td>조회수</td>
					</tr>
					<c:forEach var="item" items="${list}">
						<tr>
							<td><a href="ps_view?b_num=${item.b_num}">${item.b_num}</a></td>
							<td><a href="ps_view?b_num=${item.b_num}">${item.m_userid}</a></td>
							<td><a href="ps_view?b_num=${item.b_num}">${item.b_title}</a></td>
							<td><a href="ps_view?b_num=${item.b_num}">${item.b_content}</a></td>
							<td>${item.b_writedate}</td>
							<td>${item.b_updatedate}</td>
							<td>${item.b_readcount}</td>
						</tr>
					</c:forEach>
				</table>
				<c:set var="i" value="${i+pageNum}" />
				<c:if test="${prev}">
					<a class="btn btn-outline-info" href="ps_board?pageNum=${i-7}">이전</a>
				</c:if>
				<c:if test="${next}">
					<a class="btn btn-outline-primary" href="ps_board?pageNum=${i+7}">다음</a>
				</c:if>
					<a class="btn btn-outline-danger" style="float:right;" href="ps_writeForm">글쓰기</a>
			</div>
		</div>
		<!-- container END -->
	</section>
	<!-- 게시판 끝-->
	<!-- ----------------------------------------------------------------------------- -->
	<!-- 댓글 -->
	<section class="bg-light" id="board11-1">
		<div class="container">
			<!-- Comments Form -->
			<div class="card my-4">
				<!-- 댓글달기 -->
				<!-- ------------------------------------------------------------- -->
				<h5 class="card-header">댓글달기:</h5>
				<hr>
				<div class="card-body">
					<div class="form-group">
						<textarea class="form-control" id="replyData" rows="3"></textarea>
					</div>
					<input type="button" class="btn btn-primary" onclick="alert('로그인 후 이용가능합니다.');" value="Submit">
				</div>
				<div class="card-body">
					<div class="form-group">
						<textarea class="form-control" id="replyData" rows="8"></textarea>
					</div>
				</div>
			</div>

		</div>
		<!-- container END -->
	</section>
	<!-- 댓글 끝-->

	<!-- ----------------------------------------------------------------------------- -->
	
	<!-- Clients -->
	<div class="card my-4" id="footer1">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="#">
						<img class="img-fluid d-block mx-auto" src="resources/boardDesign/ps_design/img/footer1.png" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="http://bto.or.kr/renewal/main/main.php">
						<img class="img-fluid d-block mx-auto" src="resources/boardDesign/ps_design/img/footer1.png" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#">
						<img class="img-fluid d-block mx-auto" src="resources/boardDesign/ps_design/img/footer1.png" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#">
						<img class="img-fluid d-block mx-auto" src="resources/boardDesign/ps_design/img/footer1.png" alt="">
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ----------------------------------------------------------------------------- -->
</body>
</html>