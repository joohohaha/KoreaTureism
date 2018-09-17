<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="header">
	<!-- GNB -->
	<div class="gnb_wrap" id="gnb_wrap"></div>
	<input type="hidden" id="loginUrl" value="" /> <input type="hidden"
		id="headerLoginTargetUrl" value="index.jsp" />
	<h1></h1>
	<div class="header_menu">
		<ul class="clear_float">
			<li class="${find_id}"><a href="find_id">아이디 찾기</a></li>
			<li class="${new_pass}"><a href="new_pass">비밀번호 변경</a></li>
			<li class="${user_info}"><a href="user_info">회원정보 변경</a></li>
			<li class="${login_info}"><a href="login_info">로그인 기록</a></li>
			<li><a href="#">관심여행지</a></li>
			<li class="${withdrawal}"><a href="withdrawal">회원 탈퇴</a></li>
		</ul>
	</div>
</div>