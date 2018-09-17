<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보 변경 - 한국관광</title>
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
	<h2>회원정보 변경
		<span><em>l</em> 개인정보 변경을 원하실 경우, 로그인이 꼭 필요합니다.</span>
	</h2>
</div>
		



<input type="hidden" id="targetUrl" value="#">
<form id="frmUpdateInfo" action="#" onsubmit="return false">

<div class="contents">
	<div class="content_wrap">
		<dl class="info_basic modify_02 clear_float">
			<dt>아이디</dt>
			<dd><span class="id"><input type="hidden" class="ignore" id="userId" name="userId" value="-"></span></dd>
			<dt>이름</dt>
			<dd><span class="name"><input type="hidden" class="ignore" id="userName" name="userName" value="-"></span></dd>
			<dt><label for="userNewPassConfirm">이메일</label></dt>
			<dd>
				<input type="text" id="userFrontEmail" name="userFrontEmail" class="type_02 valid" style="width:105px" title="이메일 아이디 입력" value="" maxlength="30">
				@
				<input type="text" id="userBackEmail" name="userBackEmail" class="type_02 valid" style="width:105px" title="이메일 도메인 입력" value="" maxlength="30">
				<select class="type_02 ignore" id="userEmailAddress" name="userEmailAddress" title="이메일 도메인 선텍" style="width:120px">
					<option>직접입력</option>
					<option selected>naver.com</option>
					<option >hanmail.net</option>
					<option >daum.net</option>
					<option >gmail.com</option>
					<option >nate.com</option>
					<option >chol.com</option>
					<option >korea.com</option>
					<option >empal.com</option>
					<option >lycos.co.kr</option>
					<option >netian.com</option>
					<option >dreamwiz.com</option>
				</select>
				<span class="error aye" for="userEmail" generated="false" ><em><span class="blind">알림</span></em>사용 가능한 이메일입니다.</span>
				<p class="help">입력하신 이메일은 아이디, 비밀번호 분실 시 찾기 위한 용도로 사용되오니 신중하게 입력해 주세요.</p>
				<p class="help_check"><input type="checkbox" id="checkUserSendEmail" class="ignore" ><label for="checkUserSendEmail">한국 관광의 서비스 소식, 이벤트 등 프로모션 안내 메일 받기</label></p>
			</dd>
			<dt><label for="userFrontSex">성별</label></dt>
			<dd class="last usersex" id="gender">
				<input type="radio" id="male" name="userSex" checked="" value="male">
				<label for="man">남자</label>
				<input type="radio" id="female" name="userSex"  value="female">
				<label for="woman">여자</label>
				<input type="radio" id="unknown" name="userSex"  value="unknown">
				<label for="userSex">선택안함</label>
			</dd>
			<dt><label for="userFrontEmail">휴대폰</label></dt>
			<dd>
				<select class="type_02 ignore" id="userPhone1" title="휴대폰 통신사 선택" style="width:75px">
					<option>없음</option>
					<option >010</option>
					<option >011</option>
					<option >016</option>
					<option >017</option>
					<option >018</option>
					<option >019</option>
				</select>
				-
				<input type="text" id="userPhone2" maxlength="4" name="userPhone2" class="type_02 valid" value="" disabled class="type_02 valid" style="width:68px" title="휴대폰 중간자리 입력">
				-							
				<input type="text" id="userPhone3" maxlength="4" name="userPhone3" class="type_02 valid" value="" disabled class="type_02 valid" style="width:68px" title="휴대폰 끝자리 입력">
				<!-- <a href="#" id="btnPhoneAuthNum"><img src="/style/images/btn_smail_get.gif?_LM=1499327256000" alt="인증번호 받기"></a>
				<span for="userPhone" generated="false" class="error aye" style="display: none;"><em><span class="blind">알림</span></em>휴대폰 번호를 입력해 주시기 바랍니다.</span>
				<span id="phoneAuthComplete" style="display: none;"><strong>인증완료</strong></span> -->
				<p class="help">입력하신 번호는 아이디, 비밀번호 분실 시 찾기 위한 용도로 사용되오니 신중하게 입력해 주세요.</p>
			</dd>
			<!-- <dt id="phoneAuthdt" style="display:none;"><label for="">인증번호</label></dt>
			<dd id="phoneAuthdd" style="display:none;">
				<input type="text" id="phoneAuth" name="phoneAuth" class="type_02 valid" style="width:128px" disabled>
				<a href="#" id="btnPhoneAuth"><img src="/style/images/btn_smail_confirm.gif?_LM=1499327256000" alt="인증번호 받기"></a>
				<span id="phoneAuthMsg" for="phoneAuth" generated="false" class="error rort" style="display: none;"><em><span class="blind">알림</span></em></span>
				<p class="help">인증번호는 발송된 시점부터 3분간만 유효합니다. 인증번호가 도착하지 않거나, 유효 시간이 지난 경우 재인증을 시도해 주세요.</p>
			</dd> -->
		</dl>
		<div class="btn">
			<a href="#" id="btnUpdateInfo"><img src="resources/memberDesign/images/btn_save.gif?_LM=1499327256000" alt="저장"></a>
			<a href="#" id="btnReSet"><img src="resources/memberDesign/images/btn_reinput.gif?_LM=1499327256000" alt="다시 입력"></a>
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
<script type="text/javascript" src="/script/gnb.js?_LM=1536220352000"></script>
<script type="text/javascript">
resetData = {
	'frontEmail' : 'skel123',
	'backEmail' : 'naver.com',
	'emailMsg' : '사용 가능한 이메일입니다.',
	'sendEmail' : 'false',
	'phone1' : '',
	'phone2' : '',
	'phone3' : '',
	'certPhone' : 'false',
	'phoneAuthMsg' : '',
	'gender' : 'male'
};
$(function() {
	var $userEmailAddress = $('#userEmailAddress'),
		$userBackEmail = $('#userBackEmail');
	$userEmailAddress.val($userBackEmail.val());
	if($.trim($userEmailAddress.val()) !== $.trim($userBackEmail.val())) {
		$userEmailAddress.val('직접입력');
	}
	if($.trim($userEmailAddress.val()) === '직접입력')	{
		$userBackEmail.prop('disabled', false);
	}
	else {
		$userBackEmail.prop('disabled', true);
	}
});
</script>
<script type="text/javascript" src="/script/member.common.js?_LM=1512698956000"></script>
<script type="text/javascript" src="/script/update/info/member.update.info.form.js?_LM=1512698956000"></script>
<script type="text/javascript">
$(function() {
	$('#frmUpdateInfo').validate().settings.messages = {
			'userFrontEmail' : {
				'required' : '이메일을 입력해 주시기 바랍니다.',	
				'userFrontEmail' : '이메일 형식이 잘못되었습니다',
				'userEmailOverlap' : '현재 사용중인 이메일입니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'userBackEmail' : {
				'required' : '이메일을 입력해 주시기 바랍니다.',	
				'userBackEmail' : '이메일 형식이 잘못되었습니다',
				'whitespace' : '공백문자는 입력할 수 없습니다.',
				'yahooCheck' : '야후 메일은 추후 지원 예정입니다.',
				'userEmailOverlap' : '현재 사용중인 이메일입니다.',
				'hotmailCheck' : '핫메일은 추후 지원 예정입니다.',
				'outlookCheck' : '아웃룩은 추후 지원 예정입니다.'
			},
			'userPhone2' : {
				'required' : '휴대폰번호를 입력해 주시기 바랍니다.',	
				'userPhone' : '숫자만 입력 가능합니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'userPhone3' : {
				'required' : '휴대폰번호를 입력해 주시기 바랍니다.',	
				'userPhone' : '숫자만 입력 가능합니다.',
				'whitespace' : '공백문자는 입력할 수 없습니다.'
			},
			'phoneAuth' : {
				'required' : '휴대폰 인증번호를 입력해 주시기 바랍니다.',	
				'phoneAuth' : '6자리 숫자만 입력 가능합니다.',
				'isAuthNumChecked' : '휴대폰 인증을 해주시기 바랍니다.',
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
