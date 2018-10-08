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
		<!-- Google jQuery file -->
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="resources/ps_design/js/bootstrap.js"></script>
		
		<jsp:include page="../include/boardHeader.jsp"/>
		<title>게시글 상세보기</title>
	</head>
	
	<body>
		<section>
			<div id="board-list" class="container">
				<!-- 부트스트랩 이용한 그리드 시스템 -->
				<div class="row">
					<div class="container">
						<strong class="tit_category">게시글 상세보기</strong>
						<div class="tit_area ">
							<h3 class="tit_h3">${sboard.b_title}</h3>
						</div>
						<div class="media mb-4" style="border-bottom: 1px solid #e6e6e6;">
							<a href="/PostList.nhn?blogId=humuson_1" class="se_thumbnail">
								<span class="img">
									<img src="resources/img/travel.png" width="35" height="35" alt="프로필">
								</span>
								<!-- <span class="sim ico_monthlyblog1"></span> -->
							</a>
							<div class="media-body" style="margin-bottom: 5px;">
								<a href="#"><strong class="ell">${sboard.m_userid}</strong></a><br>
								<small>${sboard.b_updatedate}</small>
								<div class="media-body" style="float: right;">
									<a class="txt" href="ps_updateForm?b_num=${sboard.b_num}">수정</a> 
									<a class="txt" href="ps_delete?b_num=${sboard.b_num}">삭제</a> 
									<a class="txt" href="ps_board">목록보기</a>
								</div>
							</div>
						</div>
						<!-- 내용 -->
						${sboard.b_content}
						<!-- 댓글 -->
						<div class="container" id="reply-container">
							<div class="row">
								<h5 class="tit_h5 col-lg-2">덧글 달기: </h5>
								<input type="text" class="form-control col-lg-7" id="reply_content">
								<c:choose>
									<c:when test="${empty SessionNaver and empty SessionUser}">
										<input type="button" class="btn btn-primary col-lg-2" onclick="alert('로그인 후 이용가능합니다.')" value="Submit">
									</c:when>
									<c:otherwise>
									<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
										<input type="button" class="btn btn-primary col-lg-2" onclick="sendReply('${sboard.b_num}')" value="Submit">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<!-- 등록된 댓글 -->
						<div id="psboard_reply">
							<c:forEach var="item" items="${breply_Data}">
								<div class="media mb-4">
									<div class="media mb-4">
										<c:choose>
											<c:when test="${item.m_userid eq myID}">
												<a onclick="delbtn(${item.b_num}, ${item.br_num})">
													<img class="d-flex mr-3 rounded-circle" src="resources/img/clear.png">
												</a>
											</c:when>
											<c:otherwise>
												<img class="d-flex mr-3 rounded-circle" src="resources/img/reply.png">
											</c:otherwise>
										</c:choose>
										<div class="media-body">
											<h5 class="mt-0">${item.m_userid}</h5>
											<!-- 덧글 내용 -->
											${item.br_content}
										</div>
									</div>
								</div>
							</c:forEach>	
						</div>							
					</div>
				</div>
			</div>
		</section>
		<!-- 댓글 끝-->
	</body>
	<script>
		function delbtn(b_num, br_num) {
			location.href="delete_breply?b_num="+b_num+"&br_num="+br_num;
		}
		
		function addDiv(b_num, br_num, m_userid, br_content){
			var newDiv = document.createElement('div');
			newDiv.className = 'media mb-4';
			newDiv.innerHTML = "<div class='media mb-4'><a onclick='delbtn("+b_num+","+br_num+")'><img class='d-flex mr-3 rounded-circle' src='resources/img/clear.png'></a><div class='media-body'><h5 class='mt-0'>"+m_userid+"</h5>"+br_content+"</div></div>";			
			document.getElementById('psboard_reply').prepend(newDiv);
		}
	
		function sendReply(b_num){
			var replyData = document.getElementById("reply_content");
			var recontent = replyData.value; //안녕
			if(recontent == ''){
				alert('글을 입력하세요.');
				return false;
			}
			var jsonData = {
					"br_content" : recontent,
					"m_userid" : "${myID}",
					"b_num" : b_num
			};
			var result = JSON.stringify(jsonData);
			console.log(result);
			replyData.value = '';
			$.ajax({
				type : "POST",
				url : "send_breply",
				dataType : "text",
				contentType : "application/text;charset=utf-8",
				data : result,
				success : function(data){
					var result = JSON.parse(data);
					addDiv(result.b_num, result.br_num, result.m_userid, result.br_content);
				},
				error : function(jqXHR, textStatus, errorThrown){
					console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
				}		
			});
		}
	</script>
</html>

