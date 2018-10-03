<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
	
	<script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lN3APOAVWfk96iNDnU6F&submodules=geocoder"></script>
	<script type="text/javascript" src="resources/mapCluster/src/MarkerClustering.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>

    <title>Agency - Start Bootstrap Theme</title>
    
    <jsp:include page="include/mainLink.jsp"/>

  </head>

  <body id="page-top">
    <!-- 여백 -->
	<jsp:include page="include/header.jsp"/>
    <jsp:include page="loginForm.jsp"/>
    <jsp:include page="joinForm.jsp"/>
	<!-- 메인 배경과 버튼 사이의 공간 -->
	<div class="container top-section">
		<!-- 지도 입니다. 지도 스크립트 검색하면 됨 Ctrl+F -->
		<div id="map"></div>
		<!-- 오른쪽친구 -->
		<div id="rightImg" class="carousel slide aaaa" data-ride="carousel" >
			  <ol class="carousel-indicators">
			    <li data-target="#rightImg" data-slide-to="0" class="active"></li>
			    <li data-target="#rightImg" data-slide-to="1"></li>
			    <li data-target="#rightImg" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img class="d-block w-100" src="resources/design/img/a1.png" alt="First slide" width="50%" height="380px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="resources/design/img/a2.png" alt="Second slide" width="50%" height="380px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="resources/design/img/a3.png" alt="Third slide" width="50%" height="380px">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#rightImg" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#rightImg" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
		</div>
		
	</div> <!-- top-section END -->
	
    <!-- Portfolio Grid -->
    <!-- 핵심 부분 -->
    <section class="bg-light" id="portfolio">
      <div class="container">
        <div class="navbar-expand-lg bg-dark navbar-dark">
		 	<a style="margin:12px" data-toggle="modal" href="#" class="btn btn-primary btn-lg active" role="button" type="submit">인기 지역 보기</a>
			
			<a style="margin:12px" onclick="moving('gyeongsang')" class="btn btn-outline-info btn-lg active" role="button">경상도</a>
			<a style="margin:12px" onclick="moving('seoul')" class="btn btn-outline-info btn-lg active" role="button">서울</a>
			<a style="margin:12px" onclick="moving('gyeonggi')" class="btn btn-outline-info btn-lg active" role="button">경기도</a>
			<a style="margin:12px" onclick="moving('gangwon')" class="btn btn-outline-info btn-lg active" role="button">강원도</a>
			<a style="margin:12px" onclick="moving('chungcheong')" class="btn btn-outline-info btn-lg active" role="button">충청도</a>
			<a style="margin:12px" onclick="moving('jeonla')" class="btn btn-outline-info btn-lg active" role="button">전라도</a>
			<a style="margin:12px" onclick="moving('jeju')" class="btn btn-outline-info btn-lg active" role="button">제주도</a>
	    </div><br>
	    
	<!-- ------------------------------------------------------------------------------------------------------------------------ -->
	
        <!-- 지역 이미지 -->
        <div class="row">
          <!-- 1번째 줄-->
          
          <c:forEach var="item" items="${mainlist}" varStatus="i">
          <div class="col-md-4 col-sm-6 portfolio-item">
            <a class="portfolio-link" data-toggle="modal" href="#hotlocal${i.count}" type="submit">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x"></i>
                </div>
              </div>
              <img class="img-fluid" src="resources/design/img/m2.png" alt="" width="400" height="300"><!--// /m2-> ${item.div_seg_name} 넣을거임 -->
            </a>
            <div class="portfolio-caption">
               <h4>${item.tour_name}</h4>
              <p class="text-muted">${item.tour_info}</p>
            </div>
          </div>
          </c:forEach>
          
        </div>
      </div>
    </section>

   <!-- ------------------------------------------------------------------------------------------------------------------------ -->
    <!-- Team -->
    <section class="bg-light" id="team">
      <div class="container">
      
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Our Amazing Colleague</h2>
            <h3 class="section-subheading text-muted">bitc 503의 숨겨진 ACE</h3>
          </div>
        </div>
        
        <div class="row">
          <!-- 선생님 -->
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/master.png" alt="">
              <h4>GOD Jooho Choi</h4>
              <p class="text-muted">CRUD Master</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
           <!-- 태훈 -->
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/leader.png" alt="">
              <h4>TaeHoon</h4>
              <p class="text-muted">503 Leader</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
           <!-- 성건 -->
          <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/gun.png" alt="">
              <h4>Gun</h4>
              <p class="text-muted">His GOD</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
           <!-- 나 -->
           <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/me.jpg" alt="">
              <h4>HanSaem</h4>
              <p class="text-muted">Park Driver</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
           <!-- 정배형 -->
           <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/bae.png" alt="">
              <h4>JoungBae</h4>
              <p class="text-muted">Ma Driver</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
           <!-- 누구??? -->
           <div class="col-sm-4">
            <div class="team-member">
              <img class="mx-auto rounded-circle" src="resources/design/img/team/who.png" alt="">
              <h4>who are you</h4>
              <p class="text-muted">come with me?</p>
              <ul class="list-inline social-buttons">
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-twitter"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-facebook"></i>
                  </a>
                </li>
                <li class="list-inline-item">
                  <a href="#">
                    <i class="fa fa-linkedin"></i>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          
        </div>
        
        <div class="row">
          <div class="col-lg-8 mx-auto text-center">
            <p class="large text-muted"></p>
          </div>
        </div>
      </div>
    </section>

    <!-- Clients -->
    <section class="py-5">
      <div class="container">
        <div class="row">
          <div class="col-md-3 col-sm-6">
            <a href="http://www.mcst.go.kr/main.jsp">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l1.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="http://kto.visitkorea.or.kr/kor.kto">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l2.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="#">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l3.png" alt="" width="150" height="200">
            </a>
          </div>
          <div class="col-md-3 col-sm-6">
            <a href="http://bto.or.kr/renewal/main/main.php">
              <img class="img-fluid d-block mx-auto" src="resources/design/img/logos/l4.png" alt="" width="150" height="200">
            </a>
          </div>
        </div>
      </div>
    </section>	

    <!-- Footer -->
    <!-- <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; Your Website 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-facebook"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-linkedin"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer> -->
	
	 
    <!-- Portfolio Modals -->
    <!-- ============================================================= -->
    <jsp:include page="localInfo.jsp"/>
    <jsp:include page="hotLocal.jsp"/>
    
	<!-- ============================================================= -->
	<script>// -- 지도 스크립트
		//---------- 페이지 시작부터 불러오기로 맵을 만든다. markers는 marker를 넣기위한 배열틀이다.
	    var map = new naver.maps.Map("map", {
	        zoom: 2,
	        center: new naver.maps.LatLng(36.490692,128.0897413),
	        zoomControl: true,
	        zoomControlOptions: {
	            position: naver.maps.Position.TOP_LEFT,
	            style: naver.maps.ZoomControlStyle.SMALL
	        }
	    }),markers = [];
		
	    //-----------------------클러스터 마킹이미지 적용시키는 변수 작성 -----------
		var htmlMarker1 = {
		        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-1.png);background-size:contain;"></div>',
		        size: N.Size(40, 40),
		        anchor: N.Point(20, 20)
		    },
		    htmlMarker2 = {
		        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-2.png);background-size:contain;"></div>',
		        size: N.Size(40, 40),
		        anchor: N.Point(20, 20)
		    },
		    htmlMarker3 = {
		        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-3.png);background-size:contain;"></div>',
		        size: N.Size(40, 40),
		        anchor: N.Point(20, 20)
		    },
		    htmlMarker4 = {
		        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-4.png);background-size:contain;"></div>',
		        size: N.Size(40, 40),
		        anchor: N.Point(20, 20)
		    },
		    htmlMarker5 = {
		        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(resources/mapCluster/img/cluster-marker-5.png);background-size:contain;"></div>',
		        size: N.Size(40, 40),
		        anchor: N.Point(20, 20)
		    };
		//------------------------v3방식 마커 클러스터 방식--------
		document.getElementById("map").onload = onLoad();
		//------------------------클러스터 기법 foreach사용
		function onLoad() {
		    <c:forEach var="item" items="${selectAll}" varStatus="val">
		    	<c:set var="i" value="${val.index}"/>
		        var marker${i} = new naver.maps.Marker({
		            position: new naver.maps.LatLng(${item.location_x}, ${item.location_y})
		        });
	  			// 마크 클릭시 인포윈도우 오픈
				var infowindow${i} = new naver.maps.InfoWindow({
					content: '${item.tour_name}'
				});
	  			
				markers.push(marker${i});
				
				naver.maps.Event.addListener(marker${i}, "click", function(e) {
					if (infowindow${i}.getMap()) {
					  infowindow${i}.close();
					} else {
					  infowindow${i}.open(map, marker${i});
					  window.setTimeout(function () { infowindow${i}.close(); }, 2000);//2초뒤 정보 사라짐
					}
				});
		    </c:forEach>
	  		
		    var markerClustering = new MarkerClustering({
		        minClusterSize: 2,
		        maxZoom: 8,
		        map: map,
		        markers: markers,
		        disableClickZoom: false,
		        gridSize: 120,
		        icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
		        indexGenerator: [10, 100, 200, 500, 1000],
		        stylingFunction: function(clusterMarker, count) {
		        	$(clusterMarker.getElement()).find('div:first-child').text(count); //$() :: jQuery 문법
		        }
		    });
		}// endof onLoad();
	</script><!-- 지도 스크립트 end -->
	
	<script> // Modal, moving, innerHTML(addDiv), map
			
			// 필요한 정보 불러오기
          	function moving(local) {
				//페이지 비우기
				$('#localData').empty();
				
				// page 만드는 ajax
          		$.ajax({
        			type : "POST",
        			url : "AjaxData",
        			dataType : "text",
        			contentType : "application/text; charset=UTF-8",
        			data : local,
        			success : function(data){
        				var seg_Data = JSON.parse(data);
        				console.log(seg_Data);
        				for(var i=0; i<seg_Data.length;i++){
        					callDiv(seg_Data[i].tour_name, seg_Data[i].div_seg_area);
        				}
                  		document.getElementById('local_name').textContent = local;
        				$('#myModal').modal();
        			},
        			error : function(jqXHR, textStatus, errorThrown){
        				console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
        			}		
        		});
			}
	
          	// 받은정보로 페이지 만들기
          	function callDiv(tour_name, div_seg_area){
	      		// 첫번째 모달 페이지
          		var newDiv = document.createElement('div');
	      		newDiv.className = 'col-md-4 col-sm-6 portfolio-item';
	      		newDiv.innerHTML = "<a class=\"portfolio-link\" onclick=\"call_tour_data('"+ tour_name + "')\">"+
      			"<img class='img-fluid' src='resources/design/img/portfolio/01-thumbnail.jpg'></a>"+
      			"<div class='portfolio-caption'>"+
      				"<h4>"+tour_name+"</h4>"+
      				"<p class='text-muted'>"+div_seg_area+"</p>"+
      			"</div>";
      			
	      		document.getElementById('localData').prepend(newDiv);
      			
	      	}
          	
          	function call_tour_data(tour_name) {
          		// 초기화 시키기
				$('#tour_data').empty();
				$('#reply').empty();
				
				// 관광지 정보 가져오기
				$.ajax({
        			type : "POST",
        			url : "tour_data",
        			dataType : "text",
        			contentType : "application/text; charset=UTF-8",
        			data : tour_name,
        			success : function(data){
        				console.log("Data: " + data);
        				var tData = JSON.parse(data);
        				tour_data(tData.tour_info, tData.tour_com_tel, tData.tour_name, tData.div_seg_area, tData.location_x, tData.location_y, tData.st_date, tData.tour_com_name, tData.addr_street, tData.addr_location);
        				$('#seg_Data').modal();
        			},
        			error : function(jqXHR, textStatus, errorThrown){
        				console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
        			}		
        		});
				
				// 덧글 정보 가져오기
				$.ajax({
        			type : "POST",
        			url : "tour_reply",
        			dataType : "text",
        			contentType : "application/text;charset=utf-8",
        			data : tour_name,
        			success : function(data){
        				var result = JSON.parse(data);
        				console.log("reply : " + result);
        				for(var i=0; i<result.length;i++){
        					applyReply(seq, result[i].r_num, result[i].tour_name, result[i].m_userid, result[i].r_content);
        				}
        			},
        			error : function(jqXHR, textStatus, errorThrown){
        				console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
        			}
        		});
          	}
          	
          	function tour_data(tour_info, tour_com_tel, tour_name, div_seg_area, location_x, location_y, st_date, tour_com_name, addr_street, addr_location) {
				var replybtn = '', addr = '';
    			
    			//세션 유효성 검사
    			<c:choose>
					<c:when test='${empty SessionNaver and empty SessionUser}'>
						replybtn = "<input type='button' class='btn btn-primary' onclick='alert('로그인 후 이용가능합니다.')' value='submit'>";
					</c:when>
					<c:otherwise>
						replybtn = "<input type='button' class='btn btn-primary' onclick='sendReply('"+tour_name+"')' value='submit'>";
					</c:otherwise>
				</c:choose>
				
				//주소 유효성 검사
      			if(addr_street == ''){
      				addr = "<p class='item-intro text-muted'>" + addr_street + "</p>";
				} else {
					addr = "<p class='item-intro text-muted'>" + addr_location + "</p>";
				}
      			
				// 두번째 모달 페이지
	      		var tourData = document.createElement('div');
	      		tourData.className = "col-lg-8 mx-auto";
	      		tourData.innerHTML = "" + 
					"<div class='modal-body'>"+
						"<h2 class='text-uppercase'>"+tour_name+"</h2>" + addr +
						"<div id='map_local'></div>"+
						"<p>"+tour_info+"</p>"+
						"<ul class='list-inline'>"+
							"<li>등록 일자 : "+st_date+"</li>"+
							"<li>관리기관 전화번호: "+tour_com_tel+"</li>"+
							"<li>관리기관명: "+tour_com_name+"</li>"+
						"</ul>"+
						"<a class='btn btn-success' data-toggle='modal' href='#seg_Data' type='submit' >"+
							"<i class='fa fa-times'></i>Close Project"+
						"</a>"+
						"<div class='card my-4'>"+
							"<h5 class='card-header'>Leave a Comment:</h5>"+
							"<div class='card-body'>"+
								"<div class='form-group'>"+
									"<textarea class='form-control' id='replyData' rows='3'></textarea>"+
								"</div>" + replybtn +
							"</div>"+
						"</div>"+
						"<div id='reply'></div>"+
					"</div>";
				
				//페이지 생성
		      	document.getElementById('tour_Data').prepend(tourData);
	      		
	      		// 맵 선언
				var map_local = new naver.maps.Map('map_local', {
				    	center: new naver.maps.LatLng(location_x, location_y),
				    	size: new naver.maps.Size(500, 500),
				    	mapTypeId: naver.maps.MapTypeId.HYBRID,
				        zoom: 8
				});
				// 마커 선언
		    	var marker_ch = new naver.maps.Marker({
		            position: new naver.maps.LatLng(location_x,location_y),
			    	map: map_local
		        });
			}
          	
         	// 댓글 뿌리기
			function applyReply(r_num, tour_name, m_userid, r_content) {  //append 
			    var replyDiv = document.createElement("div");
			    var id = '${SessionNaver}';
				if(id == '')id = '${SessionUser}';
				
				var img_tag = "";
				if(id == m_userid){ // 본인 글 일 때
					img_tag = "<a onclick='delbtn(" + r_num + "," + tour_name + ")'><img class='d-flex mr-3 rounded-circle' src='resources/img/clear.png'></a>";	
				} else {			// 남의 글 일 때
					img_tag = "<img class='d-flex mr-3 rounded-circle' src='resources/img/reply.png'>";
				}
				
				replyDiv.className = 'media mb-4'; 
				replyDiv.innerHTML = "<div class='media mb-4'>"+img_tag+"<div class='media-body'><h5 class='mt-0'>" + m_userid + "</h5>" + r_content + "</div></div>";
			    
			    document.getElementById('reply').prepend(replyDiv); //appendChild(newDIv); 
		  	}
          </script>
          
          <script>
          	function delbtn(r_num, tour_name){
				location.href="reboard_delete&tour_name=" + tour_name + "&renum=" + r_num;
			}
			
          </script>
  </body>

</html>
