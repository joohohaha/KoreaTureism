<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기를 따로 빼내기 -->
<!-- Portfolio Modals -->

<!-- --------여기는 관광지를 지역별로 뿌리는부분 ---------------------------------------------------------- -->
<div class="portfolio-modal modal fade" id="find_userid" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content">
				<div class="skip_navigation blind">
					<a href="#container">본문 바로가기</a>
				</div>
				<div id="wrap">
					<div id="header">
						<div class="close-modal" data-dismiss="modal">
							<div class="lr">
								<div class="rl"></div>
							</div>
						</div>
					</div>
					<div id="container">
						<div class="contents">
							<div class="box_outer clear_float">
								<form action="#" id="frmFindIdByEmail" name="email" method="post">
									<div class="box box _left">
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
												<input type="text" id="userFrontEmail" name="userFrontEmail" class="type_01 email_valid" style="width: 80px" title="이메일 아이디 입력"> @ 
												<input type="text" id="userBackEmail" name="userBackEmail" class="type_01 email_valid" style="width: 80px" title="이메일 도메인 입력"> 
												<select class="type_01" id="certEmailAddress" title="이메일 도메인 선텍" style="width: 105px">
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
							</div>
						<p class="guide">
						위의 방법으로 아이디 찾을 수 없을 경우 별도 확인이 불가능하오니, <br>
						새로운 아이디로 가입하여 주시기 바랍니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>