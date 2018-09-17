<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 - 한국관광</title>
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
				<h2>
					회원 탈퇴 <span><em>l</em> 회원 탈퇴를 위해 아래 내용을 확인해 주세요.</span>
				</h2>
			</div>


			<input type="hidden" id="userId" value="">
			<form action="#" id="frmLeaveUser" method="post">
				<div class="contents">
					<div class="section">
						<h3>
							1. <strong>회원 서비스 이용 불가능</strong>
						</h3>
						<p>회원 탈퇴를 하시면 줌의 회원 서비스를 더 이상 이용하실 수 없습니다.</p>
					</div>
					<div class="section">
						<h3>
							2. <strong>해당 아이디로 재가입 불가</strong>
						</h3>
						<p>
							회원탈퇴를 신청하시면 해당 아이디는 <strong>즉시 탈퇴 처리</strong> 되며, <strong>해당
								아이디는 영구적으로 사용이 중지</strong>되므로 해당 아이디로는 회원가입이 불가능 합니다.<br> 이는 가입과 탈퇴의
							반복을 막고, 선량한 이용자들에게 피해를 끼치는 행위를 방지하기 위한 조치이오니 양해 바랍니다.
						</p>
					</div>
					<div class="section">
						<h3>
							3. <strong>회원정보 및 회원제 서비스의 정보 삭제</strong>
						</h3>
						<p>
							회원 탈퇴 시 회원 계정에 속한 <strong>개인정보는 즉시 삭제됩니다.</strong><br> 제휴사에서
							제공하는 서비스에서 결제한 <strong>유료 아이템, 캐시 등의 유료 콘텐츠 또한 회원 탈퇴와 함께
								즉시 삭제됩니다.</strong><br> 유료 콘텐츠의 환불 등을 원하시는 경우 <strong>회원 탈퇴
								전에 관련 처리를 진행해야 하며, 자세한 내용은 제휴사의 서비스 약관에 따릅니다.</strong>
						</p>
					</div>
					<div class="section">
						<h3>
							4. <strong>불량이용 및 이용제한에 관한 기록 1년 동안 보관</strong>
						</h3>
						<p>개인정보취급방침에 따라 불량회원 및 이용제한에 관한 기록은 1년 동안 삭제되지 않고 보관됩니다.</p>
					</div>
					<div class="withdraw_check">
						<p>
							<input type="checkbox" id="checkCashAgree"> <label
								for="checkCashAgree">유료 콘텐츠 관련한 모든 정보 삭제에 동의합니다.</label>
						</p>
						<p>
							<input type="checkbox" id="checkLeaveAgree"> <label
								for="checkLeaveAgree">전체 내용을 확인하였습니다.</label>
						</p>
					</div>
					<div class="content_wrap">
						<dl class="info_basic modify_03 clear_float">
							<dt>아이디</dt>
							<dd>
								<span class="id">-</span>
							</dd>
							<dt>
								<label for="userNewPassConfirm">비밀번호</label>
							</dt>
							<dd>
								<input type="password" id="userPass" name="userPass"
									class="type_02 valid" style="width: 180px" maxlength="30">
							</dd>
						</dl>
						<div class="btn">
							<a href="#" id="btnLeaveUser"><img
								src="resources/memberDesign/images/btn_withdraw.gif?_LM=1499327256000"
								alt="회원탈퇴"></a>
						</div>
					</div>

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
<script type="text/javascript" src="/script/delete/member.leave.main.js?_LM=1512698956000"></script>
<script type="text/javascript" src="/script/member.common.js?_LM=1512698956000"></script>
<script type="text/javascript" src="/script/gnb.js?_LM=1536220352000"></script>
<script type="text/javascript">
$(function() {
	$('#frmLeaveUser').validate().settings.messages = {
		'userPass' : {
			'required' : '비밀번호를 입력해주십시오.',	
			'whitespace' : '공백문자는 입력할 수 없습니다.'
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
