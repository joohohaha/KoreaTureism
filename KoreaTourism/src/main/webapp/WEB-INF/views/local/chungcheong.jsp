<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기를 따로 빼내기 -->
<!-- Portfolio Modals -->

<!-- --------여기는 관광지를 지역별로 뿌리는부분 ---------------------------------------------------------- -->
<div class="portfolio-modal modal fade" id="chungcheong" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="close-modal" data-dismiss="modal">
				<div class="lr">
					<div class="rl"></div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="modal-body">
							<!-- Project Details Go Here -->
							<h2 class="text-uppercase">충청도</h2>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
							<!-- ---------------------------------------------------------------------- -->
							<!-- 지역 이미지 -->
							<div class="row">
								<c:forEach var="item" items="${chungcheong}" varStatus="view">
									<c:set var="i" value="${view.count}"/>
									<div class="col-md-4 col-sm-6 portfolio-item">
										<a class="portfolio-link" data-toggle="modal" href="#chungcheong${i}"> 
											<img class="img-fluid" src="resources/design/img/portfolio/01-thumbnail.jpg" alt="">
										</a>
										<div class="portfolio-caption">
											<h4>${item.tour_name}</h4>
											<p class="text-muted">${item.div_seg_area}</p>
										</div>
										<!-- ---------------------------------------------------------------------- -->
									</div>
								</c:forEach>
							</div>
							<!--  -->
							<!-- ---------------------------------------------------------------------- -->
							<button class="btn btn-primary" data-dismiss="modal" type="button">
								<i class="fa fa-times"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ---------여기는 각 장소 소개하는 부분 ---------------------------------------------------------- -->
	<c:forEach var="item" items="${chungcheong}" varStatus="view">
		<c:set var="i" value="${view.count}"/>
		<div class="portfolio-hover">
			<div class="portfolio-hover-content"></div>

			<!-- Modal 경상도 세부 1 -->
			<div class="portfolio-modal modal fade" id="chungcheong${i}" tabindex="-1" role="dialog" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="close-modal" data-dismiss="modal">
							<div class="lr">
								<div class="rl"></div>
							</div>
						</div>
						<div class="container">
							<div class="row">
								<div class="col-lg-8 mx-auto">
									<div class="modal-body">
										<!-- Project Details Go Here -->
										<h2 class="text-uppercase">${item.tour_name}</h2>
										<c:choose>
											<c:when test="${item.addr_street != null}">
												<p class="item-intro text-muted">${item.addr_street}</p>
											</c:when>
											<c:otherwise>
												<p class="item-intro text-muted">${item.addr_location}</p>
											</c:otherwise>
										</c:choose>
										<div id="map_chung${i}"></div>
										<p>${item.tour_info}</p>
										<ul class="list-inline">
											<li>등록 일자 : ${item.st_date}</li>
											<li>관리기관 전화번호: ${item.tour_com_tel}</li>
											<li>관리기관명: ${item.tour_com_name}</li>
										</ul>
										<a class="btn btn-success" data-toggle="modal" href="#chungcheong${i}" type="submit" >
											<i class="fa fa-times"></i>Close Project
										</a>
										<div class="card my-4">
											<h5 class="card-header">Leave a Comment:</h5>
											<div class="card-body">
												<div class="form-group">
													<textarea class="form-control" id="replyData" rows="3"></textarea>
												</div>
												<c:choose>
													<c:when test="${empty SessionNaver and empty SessionUser}">
														<input type="button" class="btn btn-primary" onclick="alert('로그인 후 이용가능합니다.')" value="Submit">
													</c:when>
													<c:otherwise>
														<input type="button" class="btn btn-primary" onclick="sendReply('${item.tour_name}')" value="Submit">
													</c:otherwise>
												</c:choose>
											</div>
										</div>
										<div id="reply">
											<c:forEach var="item2" items="${reboards}">
												<div class="media mb-4">
													<div class="media-body">
														<h5 class="mt-0">${item2.id}</h5>
														${item2.recontent}
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<script>
			var map_chung${i} = new naver.maps.Map("map_chung${i}", {
			    	center: new naver.maps.LatLng(${item.location_x},${item.location_y}),
			    	size: new naver.maps.Size(500, 500),
			    	mapTypeId: naver.maps.MapTypeId.HYBRID,
			        zoom: 8
			    }),	
		       	marker_ch${i} = new naver.maps.Marker({
		            position: new naver.maps.LatLng(${item.location_x},${item.location_y}),
			    	map: map_chung${i}
		        }),
		        info_chung${i} = new naver.maps.InfoWindow({
					content: '<div>${item.tour_name}</div>'
				});
		   	
		    info_chung${i}.open(map_chung${i}, marker_ch${i});
		    
		    //--------------------------------------------------------------------------------
		</script>
	</c:forEach>
	<script>

    function addDiv(renum, num, id, recontent){
		var newDiv = document.createElement('div');
		newDiv.className = 'media mb-4';
		newDiv.innerHTML = "<div class='media-body'><h5 class='mt-0'>"+id+"</h5>"+recontent+"</div>";
		document.getElementById('reply').prepend(newDiv);
	}

	function sendReply(ture_name){
		var replyData = document.getElementById("replyData");
		var r_content = replyData.value; //안녕
		
		var id = '${SessionNaver}';
		if(id == '') {
			id = '${SessionUser}';
		}
		
		if(r_content == ''){
			alert('글을 입력하세요.');
			return false;
		}
		
		var jsonData = {
				"r_content" : r_content,
				"id" : id,
				"tour_name" : ture_name
		};
		
		var result = JSON.stringify(jsonData);
		
		replyData.value = '';
		
		$.ajax({
			type : "POST",
			url : "tour_reply",
			dataType : "text",
			contentType : "application/text;charset=utf-8",
			data : result,
			success : function(data){
				console.log("응 데이터 잘받음");
				var result = JSON.parse(data);
				addDiv(result.r_num, result.tour_name, result.m_userid, result.r_content);
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log("에러 발생 ~~\n" + textStatus + " : " +  errorThrown);
			}
		});
	}
	</script>
</div>