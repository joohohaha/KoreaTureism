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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="resources/boardDesign/ps_design/js/bootstrap.js"></script>
	
	<jsp:include page="../include/boardHeader.jsp"/>
	<title>POSTSCRIPT BOARD</title>
</head>
<body>
	<!-- 녹색 -->
	<div class="container jumbotron">
		<h1>POSTSCRIPT BOARD</h1>
	</div>
	<!-- 녹색 끝 -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">Realtime Popularity Area</h1>
			<br>
			<div class="list-group" id="hotPost">
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
						<td>댓글수</td>
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
							<td>${item.b_replycount}</td>
							<td>${item.b_readcount}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="8">
							<c:set var="i" value="${i+pageNum}" />
							<c:if test="${prev}">
								<a class="btn btn-outline-info" href="ps_board?pageNum=${i-7}">이전</a>
							</c:if>
							<c:if test="${next}">
								<a class="btn btn-outline-primary" href="ps_board?pageNum=${i+7}">다음</a>
							</c:if>
							<c:choose>
								<c:when test="${empty SessionNaver and empty SessionUser}">
									<a class="btn btn-outline-danger" style="float:right;" href="#" onclick="alert('로그인 하셈 ㅎㅎ');">글쓰기</a>
								</c:when>
								<c:otherwise>
									<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
									<a class="btn btn-outline-danger" style="float:right;" href="ps_writeForm">글쓰기</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- container END -->
	</section>
	<!-- 게시판 끝-->
	<!-- ----------------------------------------------------------------------------- -->

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
	<script>
		function hotPost() {
			$.ajax({
				type : "POST",
				url : "psboard_hotPost",
				dataType : "text",
				contentType : "application/text;charset=utf-8",
				success : function(data){
					$('#hotPost').empty();
					var result = JSON.parse(data);
					for(var i=0; i<result.length; i++){
						var button = document.createElement('button');
						button.type = 'button';
						button.className = 'list-group-item list-group-item-action';
						button.style = 'background-color : white; text-align : center';
						button.setAttribute('onclick', 'location.href=\'ps_view?b_num='+result[i].b_num+"\'");
						button.innerHTML = result[i].b_title + " 조회수 : " + result[i].b_readcount;
						document.getElementById('hotPost').append(button);
					}
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
				}		
			});
		}
		$(document).ready(function() {
			hotPost()
			setInterval("hotPost()", 5000); // 매 5000ms(5초)가 지날 때마다 hotPost() 함수를 실행합니다.
		});
	</script>
</body>
</html>