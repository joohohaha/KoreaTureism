<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="ko">
<head>
<title>비밀번호 재발급 - 한국관광</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

		<!-- this in the linkFile -->
<jsp:include page="../include/mainLink.jsp" />
   	<!-- Profile styles for this template -->
	<link href="resources/memberDesign/css/member.css" rel="stylesheet" type="text/css">
<link href="/favicon.ico?v=2" rel="shortcut icon">
</head>
<body id="layout_body">

		<!-- this in the header -->
	<jsp:include page="../include/header.jsp" />

	<div class="skip_navi">
		<a href="#container">본문 바로 가기</a>
	</div>

	<div class="wrap" id="wrap">
		<!-- this in the profile_header -->
		<jsp:include page="../include/profileHeader.jsp" />

	<div id="container">
		

<div class="title">
	<h2>비밀번호 변경
		<span><em>l</em> 비밀번호는 개인정보 보호를 위해 최소 3개월마다 주기적으로 변경해 주세요.</span>
	</h2>
</div>

	<input type="hidden" id="userId" value="">


<input type="hidden" id="updateFrom" value="main">

<form action="#" method="post" id="frmUpdatePass">
<div class="contents">
	<div class="content_wrap">
		<h3><strong>비밀번호 변경</strong>을 위해 아래 정보를 정확히 입력해 주세요.</h3>
		<dl class="info_basic clear_float">
			
				<dt><label for="userPass">현재 비밀번호</label></dt>
				<dd>
					<input type="password" id="userPass" name="userPass" class="type_02 valid" style="width:180px" maxlength="30">
					<span for="userPass" class="error aye" generated="false" style="display: none;"><em><span class="blind">알림</span></em></span>
				</dd>
			
			<dt><label for="userNewPass">새로운 비밀번호</label></dt>
			<dd>
				<input type="password" id="userNewPass" name="userNewPass" class="type_02 valid" style="width:180px" maxlength="30">
				<span for="userNewPass" class="error rort" generated="false" style="display: none;"><em><span class="blind">알림</span></em>대,소문자,숫자,특수문자 3가지를 넣은 8자 이상 가능합니다.</span>
			</dd>
			<dt><label for="userNewPassConfirm">새로운 비밀번호 확인</label></dt>
			<dd>
				<input type="password" id="userNewPassConfirm" name="userNewPassConfirm" class="type_02 valid" style="width:180px" maxlength="30">
				<span for="userNewPassConfirm" class="error rort" generated="false" style="display: none;"><em><span class="blind">알림</span></em>새 비밀번호를 한 번 더 입력해 주시기 바랍니다.</span>
			</dd>
		</dl>
		<div class="btn">
			<a href="#" id="btnUpdatePass"><img src="resources/memberDesign/images/btn_ok.gif?_LM=1499327256000" alt="확인"></a>
		</div>
	</div>
	<p class="guide guide_change">
		<strong>안전한 비밀번호 사용 TIP</strong><br>
		비밀번호는 꼭 주기적으로 변경하기!<br>
		타 사이트와는 다른 아이디와 비밀번호를 사용하여 도용의 위험 낮추기!<br>
		아이디, 주민등록번호, 전화번호등 개인정보와 관련된 비밀번호 사용하지 않기!
	</p>
</div>
</form>

	</div>
<!-- 	<div id="footer">
		
<div class="footer">
	<ul>
		<li><a href="http://inside.zum.com/brand/">서비스 소개</a></li>
		<li><a href="http://policy.zum.com/terms" >이용약관</a></li>
		<li><a href="http://policy.zum.com/info" ><strong>개인정보취급방침</strong></a></li>
		<li><a href="mailto:partner@zuminternet.com">제휴</a></li>
		<li><a href="http://www.estsoft.co.kr/default.aspx?wbs=5.0.3" target="_blank">채용</a></li>
		<li><a href="http://help.zum.com/">고객센터</a></li>
		<li><a href="http://dev.zum.com/">개발자센터</a></li>
		<li class="adr"><a href="http://www.zuminternet.com/" target="_blank"><em>©</em><strong>ZUM internet</strong></a></li>
	</ul>
</div>

	</div> -->
</div>




<!-- <script type="text/javascript" src="/script/plugin/jquery-1.8.2.min.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/plugin/jquery.validate.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/jsbn.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/rsa.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/prng4.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/rng.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/checkpass.min.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/update/pass/member.update.pass.main.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/gnb.js?_LM=1536220352000"></script>
<script type="text/javascript">
$(function() {
	$('#frmUpdatePass').validate().settings.messages = {
		'userPass' : {
			'required' : '비밀번호를 입력해주십시오.',	
			'whitespace' : '공백문자는 입력할 수 없습니다.',
			'equalToOriginPass' : '현재 비밀번호가 잘못되었습니다.'

		},
		'userNewPass' : {
			'required' : '새 비밀번호를 입력해 주시기 바랍니다.',	
			'combination' : '대,소문자,숫자,특수문자 3가지를 넣은 8자 이상 가능합니다.',
			'sequence' : '연속된 숫자나 문자를 4자 이상 사용할 수 없습니다.',
			'same' : '동일한 문자를 연속으로 4자 이상 사용할 수 없습니다.',
			'equalToId' : '비밀번호는 ID와 동일하게 사용할 수 없습니다.',
			'notEqualTo' : '현재 비밀번호와 새 비밀번호가 같습니다.',
			'whitespace' : '공백문자는 입력할 수 없습니다.'
		},
		'userNewPassConfirm' : {
			'required' : '새 비밀번호를 한 번 더 입력해 주시기 바랍니다.',
			'whitespace' : '공백문자는 입력할 수 없습니다.',
			'equalToNewPass' : '새 비밀번호를 한 번 더 입력해 주시기 바랍니다.'
		}
	};
});
</script>




<script type="text/javascript">
	//EST
	(function() {
		var at = document.createElement('script');
		at.type = 'text/javascript';
		at.async = true;
		at.src = '//estat.zum.com/scripts/at.js';
		var s = document.getElementsByTagName('script')[0];
		s.parentNode.insertBefore(at, s);
	})();
	var ESTatTracker = ESTatTracker || [];
	ESTatTracker.push(['@PageView']);   

	//GA
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
	
	ga('create', 'UA-51949688-1', 'zum.com');
	ga('send', 'pageview');
</script> -->
</body>
</html>
