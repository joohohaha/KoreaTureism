<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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

<jsp:include page="../include/boardHeader.jsp" />
<link rel="stylesheet" href="resources/boardDesign/ps_design/css/common.css">
<link rel="stylesheet" href="resources/footer/bootstrap.min.css">
<link rel="stylesheet" href="resources/footer/custom.css">
<title>POSTSCRIPT BOARD</title>
</head>
<body>
<c:set var="myID" value="${SessionNaver}${SessionUser}"/>
	<!-- 녹색 -->
	<div class="container jumbotron">
		<h1>POSTSCRIPT BOARD</h1>
	</div>
	<!-- 녹색 끝 -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="display-4">Realtime Popularity Area</h1><br>
			<div class="list-group" id="hotPost"></div>
		</div>
	</div>

	<!-- ----------------------------------------------------------------------------- -->

	<!-- 게시판 -->
	<div id="ps_board" class="area_cont inr-c">
		<form name="ps_board" method="get">
			<header class="tbl_header">
				<div class="lft box_c">
					<div class="col sel">
						<input type="hidden" name="action" value="do_search">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="search_op" id="sfl" class="select1">
							<option value="b_title">제목</option>
							<option value="b_content">내용</option>
							<option value="b_title||b_content">제목+내용</option>
							<option value="m_userid">글쓴이</option>
						</select>
					</div>
					<div class="col inp_search">
						<label for="stx" class="sound_only">검색어</label>
						<input name="search_cont" value="" required id="stx" class="inp_txt search">
						<input type="submit" id="search_img" value="검색" class="btn">
					</div>
				</div>
			</header>
			<input type="submit" value="검색" class="btn_submit" hidden="">
		</form>

		<form name="fboardlist" id="fboardlist" action="./board_list_update.php" method="post">
			<input type="hidden" name="bo_table" value="commu_02">
			<div class="inner">
				<div class="tbl_basic ty2">
					<table class="list" summary="공지사항 리스트입니다.">
						<colgroup>
							<col class="num">
							<col class="name">
							<col class="day">
							<col class="name">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">
									<label for="chkall" class="sound_only">현재 페이지 게시물 전체</label>
									<input type="checkbox" id="chkall" onclick="if (this.checked) all_checked(true); else all_checked(false);">번호
								</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col" class="hidden-xs">등록일</th>
								<th scope="col" class="hidden-xs">조회</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="thidden-xs">
									<label for="chk_wr_id_0" class="sound_only">* 노바 강마루 헤링본 출시! *</label>
									<input type="checkbox" name="chk_wr_id[]" value="30" id="chk_wr_id_0">
									<strong>공지</strong>
								</td>
								<td class="subject">
									<a href="#">* 노바 강마루 헤링본 출시! * </a>
								</td>
								<td><span class="sv_member">최고관리자</span></td>
								<td class="hidden-xs">04-09</td>
								<td class="hidden-xs">271</td>
							</tr>
							<c:set var="maxCount" value="${maxNum}"/>
							<c:if test="${pageNum != 0}">
								<c:set var="maxCount" value="${maxCount - (7 * pageNum)}"/>
							</c:if>
							
							<c:forEach var="ps_board" items="${list}">
							<tr>
								<td class="thidden-xs">
									<%-- <label for="chk_wr_id_3" class="sound_only">${ps_board.b_title}</label> --%>
									${maxCount}
								</td>
								<td class="subject">
									<a href="ps_view?b_num=${ps_board.b_num}">${ps_board.b_title}(${ps_board.b_replycount})</a>
								</td>
								<td><span class="sv_member">${ps_board.m_userid}</span></td>
								<td class="hidden-xs">${fn:split(ps_board.b_writedate,' ')[0]}</td>
								<td class="hidden-xs">${ps_board.b_readcount}</td>
							</tr>
							<c:set var="maxCount" value="${maxCount-1}"/>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="tbl_footer">
					<div class="ta-r">
						<c:if test="${!empty myID}">
							<a href="ps_writeForm" class="btn-pack blue2 rv n">글쓰기</a>
						</c:if>
						<c:if test="${empty myID}">
							<a href="#" onclick="alert('로그인을 하시요.');" class="btn-pack blue2 rv n">글쓰기</a>
						</c:if>
					</div>
				</div>
			</div>
		</form>

		<!-- 페이징 -->
		<nav class="pg_wrap">
			<c:forEach begin="0" end="${maxNum / 7}" varStatus="i">
				<c:choose>
					<c:when test="${paegNum ne 0 and maxNum/7 eq 0}">
						<a href="ps_board?pageNum=0" class="pg_page">맨앞</a>
					</c:when>
					<c:when test="${pageNum eq i.index}">
						<a href="ps_board?pageNum=${i.index*7}" class="pg_current" >${i.count}</a>	
					</c:when>
					<c:otherwise>
						<a href="ps_board?pageNum=${i.index*7}" class="pg_page">${i.count}</a>	
					</c:otherwise>
				</c:choose>
				<c:if test="${maxNum/7 ne 0}">
					<a href="ps_board?pageNum=${maxNum/7}" class="pg_page">맨끝</a>
				</c:if>
			</c:forEach>
			
			<!-- <a href="./board.php?bo_table=commu_02&amp;page=2" class="pg_current">1</a>
			<a href="./board.php?bo_table=commu_02&amp;page=2" class="pg_page">2</a>
			<a href="./board.php?bo_table=commu_02&amp;page=2" class="pg_page">3</a>
			<a href="./board.php?bo_table=commu_02&amp;page=2" class="pg_page pg_end">맨끝</a> -->
		</nav>
		<!-- 게시판 목록 끝 -->
	</div>
	<script>
		function hotPost() {
			$.ajax({
				type : "POST",
				url : "psboard_hotPost",
				dataType : "text",
				contentType : "application/text;charset=utf-8",
				success : function(data) {
					$('#hotPost').empty();
					var result = JSON.parse(data);
					for (var i = 0; i < result.length; i++) {
						var button = document.createElement('button');
						button.type = 'button';
						button.className = 'list-group-item list-group-item-action';
						button.style = 'background-color : white; text-align : center';
						button.setAttribute('onclick',
								'location.href=\'ps_view?b_num='
										+ result[i].b_num + "\'");
						button.innerHTML = result[i].b_title
								+ " 조회수 : " + result[i].b_readcount;
						document.getElementById('hotPost').append(
								button);
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("에러 발생 ~~\n" + textStatus + " : " + errorThrown);
				}
			});
		}
		$(document).ready(function() {
			hotPost()
			setInterval("hotPost()", 5000); // 매 5000ms(5초)가 지날 때마다 hotPost() 함수를 실행합니다.
		});
	</script>
	<jsp:include page="../include/footer.jsp"/>
</body>
</html>