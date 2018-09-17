<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
<head>
<title>로그인 기록 - 한국 관광</title>
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
	<h2>로그인 기록
		<span><em>l</em> 회원님의 최근 3개월 동안의 로그인 기록을 확인 하실 수 있습니다.</span>
	</h2>
</div>
		



<script type="text/javascript" src="/script/plugin/jquery-1.8.2.min.js?_LM=1499327254000"></script>
<div class="contents">
	<table class="tlb_log">
		<caption><span class="blind">로그인 기록</span></caption>
		<colgroup>
			<col style="width:200px">
			<col style="width:200px">
			<col style="width:180px">
			<col>
			<col style="width:200px">
		</colgroup>
		<thead>
		<tr>
			<th scope="col">일시</th>
			<th scope="col">IP</th>
			<th scope="col">상태</th>
			<th scope="col">결과</th>
			<th scope="col">서비스</th>
		</tr>
		</thead>
		<tbody>
			
				<tr>
					<td>#</td>
					<td>#</td>
					<td>
						#
						
					</td>
					
						<td class="suc">
							<span class="success">#</span>
						</td>
					
					
					<td>한국관광.com</td>
				</tr>
			
		
		</tbody>
	</table>
	<!-- UI Object -->
	<div class="paginate">
		<a href="/member/cmd=login_record" class="pre"><span>이전</span></a>			
		
			
			
				
					
						<a href="/member/login/record/1"  class="on">1</a>
					
				
			
		
		
		
		<a href="/member/cmd=login_record" class="next"><span>다음</span></a>
	</div>
	<!-- //UI Object -->
	<p class="guide">로그인 실패 결과는 사용하시는 아이디와 비슷한 아이디를 사용하는 타인의 입력 오류에 의해 생긴 것일 수도 있습니다.</p>
</div>

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




<script type="text/javascript" src="/script/gnb.js?_LM=1536220352000"></script>



<!-- <script type="text/javascript">
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
