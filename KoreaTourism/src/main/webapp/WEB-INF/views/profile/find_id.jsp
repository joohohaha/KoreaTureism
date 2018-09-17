<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기 - 한국관광</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

   	<!-- Profile styles for this template -->
	<link href="resources/memberDesign/css/member.css" rel="stylesheet" type="text/css">
<jsp:include page="../include/mainLink.jsp"/>
<link href="/favicon.ico?v=2" rel="shortcut icon">
</head>
<body id="layout_body">

	<jsp:include page="../include/header.jsp"/>
	
	<div class="skip_navi"><a href="#container">본문 바로 가기</a></div>
	
	<div class="wrap" id="wrap">
		<!-- this in the profile_header -->
		<jsp:include page="../include/profileHeader.jsp"/>
		
		<div id="container">
		
			<div class="title">
				<h2>
					아이디 찾기 <span><em>l</em> 아래의 사용자 확인 방법 중 하나를 선택해 주세요.</span>
				</h2>
			</div>


			<div class="contents">
				<div class="box_outer clear_float">
					<form action="#" id="frmFindIdByEmail" name="email" method="post">
						<div class="box box_left">
							<div class="id_email">
								<span class="blind">메일</span>
							</div>
							<h3>
								<strong>이메일 주소</strong>로 아이디 찾기
							</h3>
							<dl>
								<dt>
									<label for="certEmailName">이름</label>
								</dt>
								<dd>
									<input type="text" id="certEmailName" name="userName"
										class="type_01 email_valid" style="width: 307px"
										maxlength="30">
									<p class="help">한글/영문으로 입력해 주세요.</p>
								</dd>
								<dt>
									<label for="userFrontEmail">이메일</label>
								</dt>
								<dd>
									<input type="text" id="userFrontEmail" name="userFrontEmail"
										class="type_01 email_valid" style="width: 80px"
										title="이메일 아이디 입력"> @ <input type="text"
										id="userBackEmail" name="userBackEmail"
										class="type_01 email_valid" style="width: 80px"
										title="이메일 도메인 입력"> <select class="type_01"
										id="certEmailAddress" title="이메일 도메인 선텍" style="width: 105px">
										<option>직접입력</option>
										<option>chol.com</option>
										<option>daum.net</option>
										<option>dreamwiz.com</option>
										<option>empal.com</option>
										<option>freechal.com</option>
										<option>gmail.com</option>
										<option>hanafos.com</option>
										<option>hanmail.net</option>
										<option>hanmir.com</option>
										<option>hitel.net</option>
										<option>korea.com</option>
										<option>lycos.co.kr</option>
										<option>nate.com</option>
										<option>naver.com</option>
										<option>netian.com</option>
										<option>paran.com</option>
									</select>
									<p class="help">가입 시 기재한 이메일을 입력해 주세요.</p>
								</dd>
							</dl>
							<div class="btn">
								<a href="#" id="btnFindIdByCertEmail"><img
									src="resources/memberDesign/images/btn_idfind.gif?_LM=1499327256000"
									alt="아이디 찾기"></a>
							</div>
						</div>
					</form>
					<form action="#" id="frmFindIdByPhone" name="phone" method="post">
						<div class="box box_right">
							<div class="id_phone">
								<span class="blind">휴대폰</span>
							</div>
							<h3>
								<strong>휴대폰 번호</strong>로 아이디 찾기
							</h3>
							<dl>
								<dt>
									<label for="certPhoneName">이름</label>
								</dt>
								<dd>
									<input type="text" id="certPhoneName" name="userName"
										class="type_01 phone_valid" style="width: 307px"
										maxlength="30">
									<p class="help">한글/영문으로 입력해 주세요.</p>
								</dd>
								<dt>
									<label for="userFrontEmail">휴대폰</label>
								</dt>
								<dd>
									<select class="type_01" id="userPhone1" name="userPhone1"
										title="휴대폰 통신사 선택" style="width: 105px">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select> - <input type="text" id="userPhone2" name="userPhone2"
										maxlength="4" class="type_01 phone_valid" style="width: 76px"
										title="휴대폰 중간자리 입력"> - <input type="text"
										id="userPhone3" name="userPhone3" maxlength="4"
										class="type_01 phone_valid" style="width: 76px"
										title="휴대폰 끝자리 입력">
									<p class="help">가입 시 기재한 휴대폰 번호를 입력해 주세요.</p>
								</dd>
							</dl>
							<div class="btn">
								<a href="#" id="btnFindIdByCertPhone"><img
									src="resources/memberDesign/images/btn_idfind.gif?_LM=1499327256000"
									alt="아이디 찾기"></a>
							</div>
						</div>
					</form>
				</div>
				<p class="guide">위의 방법으로 아이디 찾을 수 없을 경우 별도 확인이 불가능하오니, 새로운 아이디로
					가입하여 주시기 바랍니다.</p>
			</div>



		</div>
		<!-- <div id="footer">
		
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
<script type="text/javascript" src="/script/find/id/member.find.id.part.main.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/gnb.js?_LM=1536220352000"></script>
<script type="text/javascript">
$(function() {
	$('#frmFindIdByEmail').validate().settings.messages = {
		'userName' : {
			'required' : '이름을 입력해 주시기 바랍니다.',	
			'userName' : '한글 1~16자, 영문 대·소문자 2~30자 가능합니다.',
			'whitespace' : '공백문자는 입력할 수 없습니다.'
		},
		'userFrontEmail' : {
			'required' : '이메일을 입력해 주시기 바랍니다.',	
			'userFrontEmail' : '이메일 형식이 잘못되었습니다',
			'whitespace' : '공백문자는 입력할 수 없습니다.'
		},
		'userBackEmail' : {
			'required' : '이메일을 입력해 주시기 바랍니다.',	
			'userBackEmail' : '이메일 형식이 잘못되었습니다',
			'whitespace' : '공백문자는 입력할 수 없습니다.'
		}
	};
	$('#frmFindIdByPhone').validate().settings.messages = {
		'userName' : {
			'required' : '이름을 입력해 주시기 바랍니다.',	
			'userName' : '한글 1~16자, 영문 대·소문자 2~30자 가능합니다.',
			'whitespace' : '공백문자는 입력할 수 없습니다.'
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
