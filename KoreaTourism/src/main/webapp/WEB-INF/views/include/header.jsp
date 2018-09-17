<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    
    
   	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="index">한국 관광 공사</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
       		<c:choose>
       			<c:when test="${empty sessionScope.id}">
		            <li class="nav-item">
		              <a class="nav-link" data-toggle="modal" href="#loginForm" role="button" type="submit">로그인</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" data-toggle="modal" href="#joinForm" role="button" type="submit">회원가입</a>
		            </li>
		            <li class="nav-item">
		              <a href="f_board" class="nav-link">자유 게시판 가자</a>
		            </li>
		            <li class="nav-item">
		              <a href="ps_board" class="nav-link">후기 게시판 가자</a>
		            </li>
		    	</c:when>
		    	<c:otherwise>
		    		 <li class="nav-item">
		              <a class="nav-link" href="#">메인가자</a>
		            </li>
		            <li class="nav-item">
		              <a class="nav-link" href="#">회원정보 보자</a>
		            </li>
		            <li class="nav-item">
		              <a href="find_id">이동잼</a>
		            </li>
		    	</c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Header -->
    <header class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome To Our Web!</div>
          <div class="intro-heading text-uppercase">골라골라 싸게 골라</div>
          <a class="btn btn-warning btn-xl text-uppercase js-scroll-trigger" href="#portfolio">Tell Me More</a>
        </div>
      </div>
    </header>
    
    <!-- Bootstrap core JavaScript -->
    <script src="resources/design/vendor/jquery/jquery.min.js"></script>
    <script src="resources/design/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Plugin JavaScript -->
    <script src="resources/design/vendor/jquery-easing/jquery.easing.min.js"></script>
	
    <!-- Contact form JavaScript -->
    <script src="resources/design/js/jqBootstrapValidation.js"></script>
    <script src="resources/design/js/contact_me.js"></script>	
    
    <!-- Custom scripts for this template -->
   	<script src="resources/design/js/agency.min.js"></script>