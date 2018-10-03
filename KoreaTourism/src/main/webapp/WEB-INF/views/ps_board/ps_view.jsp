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
				<table border="1">
					<fieldset class="form-group">

						<legend class="border-bottom mb-4">게시글 상세보기</legend>
						<%-- <div class="form-group">
							<label class="form-control-label">게시글 번호</label> <input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_num}" name="b_num" readonly>
						</div> --%>
						<div class="form-group">
							<label class="form-control-label">아이디</label> <input
								class="form-control form-control-lg" type="text"
								value="${sboard.m_userid}" name="m_userid" readonly>
						</div>
						<div class="form-group">
							<label class="form-control-label">글 제목</label> <input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_title}" name="b_title" readonly>
						</div>						
						<div class="form-group">
							<label class="form-control-label">글 제목</label> <input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_title}" name="b_title" readonly>
						</div>

						<div class="form-group">	
						<label class="form-control-label">글 내용</label><br>							
						${sboard.b_content}
						</div>
						
						<%-- <div class="form-group">
							<label class="form-control-label"></label>작성일<input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_writedate}" name="b_writedate" readonly>
						</div>
						<div class="form-group">
							<label class="form-control-label"></label>수정일<input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_updatedate}" name="b_updatedate" readonly>
						</div> --%>
						<div class="form-group">
							<label class="form-control-label">조회수</label><input
								class="form-control form-control-lg" type="text"
								value="${sboard.b_readcount}" name="b_readcount" readonly>
						</div>
					</fieldset>
				</table>
				<a class="btn btn-outline-warning" href="ps_updateForm?b_num=${sboard.b_num}">수정</a> 
				<a class="btn btn-outline-danger" href="ps_delete?b_num=${sboard.b_num}">삭제</a> 
				<a class="btn btn-outline-info" style="float:right" href="ps_board">목록보기</a>
			</div>
		</div>
		<!-- row(12분할) END -->
	</div>
	<!-- container END -->
</section>

</body>
</html>

