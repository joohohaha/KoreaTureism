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
<link rel="shortcut icon" href="#">
<!-- favicon 못찾는 오류나서.. 일단 넣어둠 태그 지우면 console에 오류뜸 -->
<!-- Google jQuery file -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/ps_design/js/bootstrap.js"></script>

<!-- smart editor -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources
/ps_design/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources
/ps_design/editor/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>

<title>게시글 상세보기</title>
</head>

<body>

	<nav class="navbar navbar-dark bg-dark navbar-expand-sm">
		<a class="navbar-brand" href="index">한국관광공사</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="list"></a></li>
				<li class="nav-item"><a class="nav-link" href="list"></a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbargrop"
					data-toggle="dropdown">접속</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#"></a> <a class="dropdown-item"
							href="#"></a>
					</div></li>
			</ul>
		</div>
	</nav>
	<section>
		<div id="board-list" class="container">
			<!-- 부트스트랩 이용한 그리드 시스템 -->
			<div class="row">
				<!-- 12칸 분할 -->
				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<form action="ps_update" name="w_form">						
							<fieldset class="form-group">

								<legend class="border-bottom mb-4">게시글 상세보기</legend>
								<div class="form-group">
									<label class="form-control-label">게시글 번호</label> <input
										class="form-control form-control-lg" type="text"
										value="${sboard.b_num}" name="b_num" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label">닉네임</label> <input
										class="form-control form-control-lg" type="text"
										value="${sboard.m_userid}" name="m_userid" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label">게시글 제목</label> <input
										class="form-control form-control-lg" type="text"
										value="${sboard.b_title}" name="b_title" required autofocus>
								</div>

								<div class="form-group">
									<label class="form-control-label"></label>
									<textarea id="textAreaContent" name="b_content" rows="10"
										cols="80" style="width: 100%">${sboard.b_content}</textarea>
								</div>
								<div class="form-group">
									<label class="form-control-label"></label>작성일자<input
										class="form-control form-control-lg" type="text"
										value="${sboard.b_writedate}" name="b_writedate" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label"></label>작성일자<input
										class="form-control form-control-lg" type="text"
										value="${sboard.b_updatedate}" name="b_updatedate" readonly>
								</div>
								<div class="form-group">
									<label class="form-control-label"></label>조회수<input
										class="form-control form-control-lg" type="text"
										value="${sboard.b_readcount}" name="b_readcount" readonly>
								</div>
							</fieldset>
						
						<div class="form-group">
							<button class="btn btn-outline-primary" type="submit" onclick="submitContents(this)"
								style="float: right">수정하기</button>
						</div>
					</form>
				</div>
			</div>
			<!-- row(12분할) END -->
		</div>
		<!-- container END -->
	</section>
	
	<!-- Naver Smart Editor 2 -->
	<script>
	  var oEditors = [];
	  nhn.husky.EZCreator.createInIFrame({
	      oAppRef: oEditors,
	      elPlaceHolder: "textAreaContent",
	      sSkinURI: "<%=request.getContextPath()%>/resources/ps_design/editor/SmartEditor2Skin.html",
	      fCreator: "createSEditor2"
	  });
	   
	  //‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	  function submitContents(elClickedObj) {
	      // 에디터의 내용이 textarea에 적용된다.
	      oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	   
	      // 에디터의 내용에 대한 값 검증은 이곳에서
	      // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	    
	      try {
	          elClickedObj.form.submit();
	      } catch(e) {
	       
	      }
	  }
	   
	  // textArea에 이미지 첨부
	  function pasteHTML(filepath){
	      var sHTML = '<img src="<%=request.getContextPath()%>/resources/ps_design/editor/upload/'+filepath+'">';
	      oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	  }
	  
	  // textArea에 영상 첨부
	  function pasteHTML(filepath){
	      var sHTML = '<iframe src="<%=request.getContextPath()%>/resources/ps_design/editor/stream/'+filepath+'">';
	      oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	  }
	</script>

</body>
</html>