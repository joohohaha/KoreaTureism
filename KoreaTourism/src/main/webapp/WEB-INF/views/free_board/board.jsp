<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap file -->
<link rel="stylesheet" href="resources/design/css/bootstrap.css">
<link rel="stylesheet" href="resources/design/css/custom.css">
<link rel="shortcut icon" href="#">
<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
<!-- Google jQuery file -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/design/js/bootstrap.js"></script>
<title>게시판이엽</title>
</head>
<body>
	<!-- 헤드 -->
	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<a class="navbar-brand" href="#">한국관광공사</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
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
						<a class="dropdown-item" href="#">뭘?</a> 
						<a class="dropdown-item" href="#">꼬라</a>
						<a class="dropdown-item" href="#">보노보노</a>
					</div></li>
			</ul>
		</div>
	</nav><br>
	<!-- 헤드 끝 -->
	
	<!-- 녹색 -->
	  <div class="container jumbotron">
        <h1>FREE BOARD</h1>
      </div>   
	<!-- 녹색 끝 -->
	
	<!-- 게시판 -->	
	<section class="bg-light" id="board11">
		<div class="container">
		
				<!-- 1번 라인 -->
				<!-- 왼쪽친구 -->
				<div class="board-s board-s-left board-s-top" >
					<table class="table table-striped" border="1">

						<tr>
							<td>번호</td>
							<td>이름</td>
							<td>제목</td>
							<td>내용</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
						<c:forEach var="item" items="${list}">
							<tr>
								<td><a href="view?bid=${item.bid}">${item.bid}</a></td>
								<td><a href="view?bid=${item.bid}">${item.bname}</a></td>
								<td><a href="view?bid=${item.bid}">${item.btitle}</a></td>
								<td><a href="view?bid=${item.bid}">${item.bcontent}</a></td>
								<td>${item.bdate}</td>
								<td>${item.bhit}</td>
							</tr>
						</c:forEach>
					</table>
					<c:set var="i" value="0"/>
					<c:set var="i" value="${i+pageNum}"/>
					<c:if test="${prev}">
						<a class="btn btn-outline-info" href="board?pageNum=${i-5}">이전</a> 
					</c:if>
					<c:if test="${next}">
						<a class="btn btn-outline-primary" href="board?pageNum=${i+5}">다음</a>
					</c:if>
				</div>
				<!-- 오른쪽친구 -->
				<div class="board-s board-s-top">
					<form action="insert">
						<table border="1">
							<fieldset class="form-group">

								<legend class="border-bottom mb-4">글을 씁시댜</legend>

								<div class="form-group">
									<label class="form-control-label">닉네임</label> <input
										class="form-control form-control-lg" type="text" name="bname"
										required autofocus>
								</div>

								<div class="form-group">
									<label class="form-control-label">글 제목</label> <input
										class="form-control form-control-lg" type="text" name="btitle"
										required autofocus>
								</div>

								<div class="form-group">
									<label class="form-control-label">글 내용</label>
									<textarea id="textAreaContent" name="bcontent" rows="10"
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
				
				<!-- 2번 라인 -->
				<!-- 왼쪽친구 -->
				<div id="carouselExampleIndicators" class="carousel slide aaaa board-s board-s-left " data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="resources/design/img/a1.png"
								alt="First slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a2.png"
								alt="Second slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a3.png"
								alt="Third slide" width="320px" height="280px">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>
				<!-- 오른쪽친구 -->
				<div id="carouselExampleIndicators1" class="board-s carousel slide aaaa" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators1" data-slide-to="0"
							class="active"></li>
						<li data-target="#carouselExampleIndicators1" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators1" data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="resources/design/img/a1.png"
								alt="First slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a2.png"
								alt="Second slide" width="320px" height="280px">
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="resources/design/img/a3.png"
								alt="Third slide" width="320px" height="280px">
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators1"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next"
						href="#carouselExampleIndicators1" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
		</div><!-- container END -->
	</section>
	<!-- 게시판 끝-->	
</body>
</html>