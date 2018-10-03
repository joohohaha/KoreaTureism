<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/memberDesign/css/loginform.css">

<script src="https://www.google.com/recaptcha/api.js"></script>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "xHnGDEiESs7O3i28j1Wl";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8000/tour/naver_login", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    //session.setAttribute("state", state);
 %>
<div class="portfolio-modal modal fade" id="loginForm" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content" style="background: transparent; border: 0;">
			<div class="skip_navigation blind">
				<a href="#container">본문 바로가기</a>
			</div>
			<div id="wrap">
				<div id="header">
					<h1>
						<a href="index.jsp" class="logo"> 
							<img src="resources/memberDesign/images/img_logo_zum_login.png?_LM=1530147020000" alt="KOREA" width="222" height="41">
						</a>
					</h1>
					<div class="close-modal" data-dismiss="modal">
						<div class="lr"><div class="rl"></div></div>
					</div>
				</div>
				<div id="container">
					<div class="login_page">
						<h2>로그인 하기</h2>
						<div class="login_box">
							<form id="frm_in_login" name="frm_in_login" method="post" action="user_login">
								<fieldset>
									<dl>
										<dt class="blind">아이디</dt>
										<dd>
											<span class="text_box d_input_area"> <!-- on : 입력창 활성화 , warning : 입력 사항에 문제 있음 -->
												<label for="id">아이디 입력</label>
												<input type="text" id="id" name="id" maxlength="30" value="">
												<button type="button" class="btn_clear d_clear" style="display: none" tabindex="-1">입력창 비우기</button>
											</span>
											<div class="text_alert" style="display: none;">
												<p>오류 메세지</p>
											</div>
										</dd>
										<dt class="blind">비밀번호</dt>
										<dd>
											<span class="text_box d_input_area"> 
												<label for="password">비밀번호 입력</label>
												<input type="password" id="password" maxlength="30">
												<button type="button" class="btn_clear d_clear" style="display: none" tabindex="-1">입력창 비우기</button>
											</span>
										</dd>
									</dl>
									<div class="check_keep_login">
										<input type="checkbox" id="login_check" name="rmm">
										<label for="login_check">로그인 상태 유지</label>
									</div>
									<div class="check_ip_security">
										<input type="checkbox" id="btn_ip">
										<label for="btn_ip" class="checked" id="btn_ip_on"><!-- checked : IP 보안 ON 상태 -->
											IP보안 <strong>ON</strong> 
											<!--
					                            <strong>OFF</strong>
					                            <strong>ON</strong>
					                        -->
										</label>
									</div>
									<div class="btn_login">
										<button type="submit">로그인</button>
										<input id="loginTargetUrl" name="targetUrl" type="hidden" value="#">
  										<a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
									</div>
								</fieldset>
							</form>
							<input type="hidden" id="zumOnly" value="false">
						</div>

						<div class="login_menu">
							<ul>
								<li><a id="btn_find_id" href="find_id">아이디 찾기</a></li>
								<li><a id="btn_find_pass" href="new_pass">비밀번호 찾기</a></li>
								<li><a class="nav-link" data-toggle="modal" href="#joinForm" 
										style="-webkit-appearance: initial; padding: 0;"role="button" type="submit">회원가입</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- <div class="social_login">
		<ul>
			<li><a id="btn_fblogin" href="#" class="sc_facebook" target="_blank">facebook 로그인</a></li>
			<li><a id="btn_tlogin" href="#" class="sc_twitter">twitter 로그인</a></li>
			<li><a id="btn_klogin" href="#" class="sc_kakao">kakao 로그인</a></li>
		</ul>
	</div> -->
		</div>

		<!-- <form method="post" id="frm_sub_login" name="frm_sub_login">
	<input id="enc_id" name="enc_id" type="hidden">
	<input id="enc_password" name="enc_password" type="hidden" >
	<input id="ipCheck_result" name="ipCheck" type="hidden">
	<input id="rmm" name="rmm" type="hidden">
	<input id="targetUrl" name="targetUrl" type="hidden" value="http://zum.com/#!/home">
	<input id="secret" name="secret" type="hidden">
</form>
<form method="post" id="frm_fblogin" target="_top" style="margin:0;padding:0">
	<input type="hidden" id="fb_targetUrl" name="targetUrl">
</form>
<form method="post" id="frm_tlogin" target="_top" style="margin:0;padding:0">
	<input type="hidden" id="t_targetUrl" name="targetUrl">
</form>
<form method="post" id="frm_klogin" target="_top" style="margin:0;padding:0">
	<input type="hidden" id="k_targetUrl" name="targetUrl">
</form>
<input type="hidden" id="generalSubmitUrl" value="https://sign.zum.com/auth/login_proc">
<input type="hidden" id="fbLoginUrl" value="https://sign.zum.com/auth/fblogin_proc">
<input type="hidden" id="fbLoginGeneralTargetUrl" value="https://user.zum.com/login/fblogin2?form=general&url=">
<input type="hidden" id="tLoginUrl" value="https://sign.zum.com/auth/tlogin_proc">
<input type="hidden" id="tLoginGeneralTargetUrl" value="https://user.zum.com/login/tlogins?form=general&url=">
<input type="hidden" id="kLoginUrl" value="https://sign.zum.com/auth/klogin_proc">
<input type="hidden" id="kLoginGeneralTargetUrl" value="https://user.zum.com/login/klogins?form=general&url=">
<input type="hidden" id="loginHold" value=""> -->

	</div>
	<!-- 	<div id="footer">
		
<ul class="links">
	<li><a href="http://inside.zum.com/brand/">서비스소개</a></li>
	<li><a href="http://policy.zum.com/terms/">이용약관</a></li>
	<li><a href="http://policy.zum.com/info/"><strong>개인정보처리방침</strong></a></li>
	<li><a href="mailto:partner@zum.com">제휴</a></li>
	<li><a href="http://www.estsoft.co.kr/?wbs=5.0.3" target="_blank" title="새 창으로 링크열기">채용</a></li>
	<li><a href="http://help.zum.com/">고객센터</a></li>
	<li><a href="http://dev.zum.com/">개발자센터</a></li>
	<li><a href="http://www.zuminternet.com/" target="_blank"><strong>&#64;ZUM internet</strong></a></li>
</ul>

	</div>  -->
</div>



<!-- <script type="text/javascript">document.domain='zum.com';</script>
<script type="text/javascript" src="/script/plugin/jquery-1.8.2.min.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/plugin/jquery.cookie.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/jsbn.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/rsa.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/prng4.js?_LM=1499327254000"></script>
<script type="text/javascript" src="/script/rsa/rng.js?_LM=1499327254000"></script>

<script type="text/javascript" src="/script/login/login.common.js?_LM=1499327254000"></script>
<script type="text/javascript">
(function(login, $){
	login.general = {
		$id : $("#id"),
		$password : $("#password"),
		$enc_id : $("#enc_id"),
		$enc_password : $("#enc_password"),
        $btn_ip : $("#btn_ip"),
		$btn_ip_on : $("#btn_ip_on"),
		$btn_find_pass : $("#btn_find_pass"),
		$btn_join : $("#btn_join"),
		$btn_find_id : $("#btn_find_id"),
		$btn_fblogin : $("#btn_fblogin"),
        $btn_tlogin : $("#btn_tlogin"),
        $btn_klogin : $("#btn_klogin"),
		$targetUrl : $("#targetUrl"),
		$generalSubmitUrl : $("#generalSubmitUrl"),
		$fbLoginGeneralTargetUrl : $("#fbLoginGeneralTargetUrl"),
        $tLoginGeneralTargetUrl : $("#tLoginGeneralTargetUrl"),
        $kLoginGeneralTargetUrl : $("#kLoginGeneralTargetUrl"),
		$rmm_check : $("#rmm_check"),
		$rmm : $("#rmm"),
		$ipCheck_result : $("#ipCheck_result"),
		$frm_in_login : $("#frm_in_login"),
		$fbLoginUrl : $("#fbLoginUrl"),
		$fb_targetUrl : $("#fb_targetUrl"),
		$frm_sub_login : $("#frm_sub_login"),
        $tLoginUrl : $("#tLoginUrl"),
        $t_targetUrl : $("#t_targetUrl"),
        $kLoginUrl : $("#kLoginUrl"),
        $k_targetUrl : $("#k_targetUrl"),
		getkey_ajax_flag : false,
		//$div_capslock : $('#div_capslock'),
		$captcha_box : $('#d_captcha_box'),
		$loginHold : $('#loginHold'),
		$secret : $('#secret'),
        $inputArea : $('.d_input_area input'),
        $clearBtn : $('.text_box').find('.btn_clear'),
        $zumOnly : $("#zumOnly"),

		init : function() {
			var _ = login.general;
			
			_.$frm_in_login.submit(_.submit);
			_.$btn_join.click(_.click.join);
			_.$btn_find_id.click(_.click.findId);
			_.$btn_find_pass.click(_.click.findPass);
            _.$inputArea.focus(function() {
                $(this).parent().addClass('on');
            });
            _.$inputArea.blur(function() {
                if ($(this).val() === '') {
                    $(this).parent().removeClass('on');
                }
            });
            _.$inputArea.keyup(function() {
                var $thisBtnClear = $(this).parent().find('.btn_clear');
                if($(this).val() === '') {
                    $thisBtnClear.hide();
                } else {
                    $thisBtnClear.show();
                }
            });
            _.$clearBtn.click(function() {
                $(this).hide().parent().find('input').val("").focus();
            });
			_.$btn_fblogin.click(_.click.facebook);
            _.$btn_tlogin.click(_.click.twitter);
            _.$btn_klogin.click(_.click.kakao);
            _.$btn_ip.on('change', function(){
                var thisLabel = $(this).parent().find('label');
                if ($(this)[0].checked) {
                    thisLabel.addClass('checked').find('strong').html("ON");
                } else {
                    thisLabel.removeClass('checked').find('strong').html("OFF");
                }
            });
			_.$id.val("");
			_.$password.val("");
			_.$id.focus();
			_.$btn_ip.prop('checked', true);
		},
		
		validate : function() {
			var _ = login.general;
			var id = $.trim(_.$id.val());
			var pass = $.trim(_.$password.val());
			
			if(id === "") {
				alert(message.empty.id);
				_.$id.focus();
				return false;
			}
			
			if(pass === "") {
				alert(message.empty.password);
				_.$password.focus();
				return false;
			}
			return true;
		},

		rmm : {
			check : function() {
				var _ = login.general;
				if( _.$rmm_check.prop('checked') ) {
					$.cookie("rmm", "1", {expires:14, domain:".zum.com", path:"/"});
				}
				else {
					$.cookie("rmm", "0", {expires:14, domain:".zum.com", path:"/"});
				}
			}
			
		},
		
		submit : function() {
			var _ = login.general;
			var	$captchaBox = $('#d_captcha_box');
			
			if($captchaBox.length > 0){
				var recaptcha = grecaptcha.getResponse();
				if(recaptcha.length === 0){
					alert('다시 체크해 주세요.');
					return false;
				}
				
				_.$secret.val(recaptcha);
			}
			
			if( !(_.validate()) ) {
				return false;
			}
			if (_.$btn_ip_on.hasClass("checked")) {
				_.$ipCheck_result.val("true");
			}
			else {
				_.$ipCheck_result.val("false");
			}

			_.rmm.check();

			if (!_.getkey_ajax_flag) {
				_.getkey_ajax_flag = true;
				getKey(function(data) {
					if (data !== null && data !== undefined) {
						var targetUrl = _.$targetUrl.val();
						var generalSubmitUrl = _.$generalSubmitUrl.val();
						if (_.$zumOnly.val() === "true")
							generalSubmitUrl += "?zumOnly=true";
						else
							generalSubmitUrl += "?zumOnly=false";
						if (targetUrl !== null && targetUrl !== "") {
							targetUrl = encodeURIComponent(targetUrl);
							generalSubmitUrl += "&targetUrl=" + targetUrl;
						}

						var $plain_set = [ _.$id, _.$password ];
						var $enc_set = [ _.$enc_id, _.$enc_password ];
						var rsa = new RSAKey();
						rsa.setPublic(data.modulus, data.exponent);
						for ( var i = 0; i < $plain_set.length; i++) {
							$enc_set[i].val(rsa.encrypt($
									.trim($plain_set[i].val())));
						}
						_.$frm_sub_login.prop("action", generalSubmitUrl)
								.submit();
					} else {
						alert("일시적인 장애입니다. 잠시 후 다시 시도해 주세요.");
					}
					_.getkey_ajax_flag = false;
				});
			}
			return false;
		},

		click : {
            kakao : function() {
                var _ = login.general;
                _.rmm.check();
                _.$k_targetUrl.val(_.$targetUrl.val());

                var targetUrl = _.$kLoginGeneralTargetUrl.val();
                var url = _.$kLoginUrl.val();

                if(targetUrl !== "" && targetUrl !== null){
                    targetUrl = encodeURIComponent(targetUrl);
                    url += "?targetUrl=" + targetUrl + "&ipCheck="
                        + (_.$btn_ip_on.hasClass('checked') ? "true" : "false");
                }

                window.open(url, "", "height = 600, width = 500");
                return false;
            },
            twitter : function() {
                var _ = login.general;
                _.rmm.check();
                _.$t_targetUrl.val(_.$targetUrl.val());

                var targetUrl = _.$tLoginGeneralTargetUrl.val();
                var url = _.$tLoginUrl.val();

                if(targetUrl !== "" && targetUrl !== null){
                    targetUrl = encodeURIComponent(targetUrl);
                    url += "?targetUrl=" + targetUrl + "&ipCheck="
                        + (_.$btn_ip_on.hasClass('checked') ? "true" : "false");
                }

                window.open(url, "", "height = 600, width = 500");
                return false;
            },
			facebook : function() {
				var _ = login.general;
				_.rmm.check();
				_.$fb_targetUrl.val(_.$targetUrl.val());
				var targetUrl = _.$fbLoginGeneralTargetUrl.val();
				targetUrl += _.$targetUrl.val();
				var url = _.$fbLoginUrl.val();

				if (targetUrl !== "" && targetUrl !== null) {
					targetUrl = encodeURIComponent(targetUrl);
					url += "?targetUrl=" + targetUrl + "&ipCheck="
							+ (_.$btn_ip_on.hasClass('checked') ? "true" : "false");
				}

				window.open(url, "", "height = 600, width = 500");
				return false;
			},
			join : function() {
				location.href = "https://user.zum.com/member/join?targetUrl="
						+ encodeURIComponent(login.general.$targetUrl.val());
				return false;
			},
			findId : function() {
				location.href = "https://user.zum.com/member/find/id";
				return false;
			},
			findPass : function() {
				location.href = "https://user.zum.com/member/find/pass";
				return false;
			}
		}
	};
	login.general.init();
})(window["login"] = window["login"] || {}, jQuery);
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