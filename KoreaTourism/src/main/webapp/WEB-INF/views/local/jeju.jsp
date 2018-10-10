<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <div class="portfolio-modal modal fade" id="jeju" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
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
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet
								consectetur.</p>
							<!-- ---------------------------------------------------------------------- -->
							<!-- 지역 이미지 -->
							<div class="row">
								<c:forEach var="item" items="${jeju}" varStatus="view">
									<c:set var="i" value="${view.count}"/>
									<div class="col-md-4 col-sm-6 portfolio-item">
										<a class="portfolio-link" data-toggle="modal" href="#jeju${i}"> 
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
							<button class="btn btn-primary" data-dismiss="modal"
								type="button">
								<i class="fa fa-times"></i> Close Project
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ---------여기는 각 장소 소개하는 부분 ---------------------------------------------------------- -->
	<c:forEach var="item" items="${jeju}" varStatus="view">
		<c:set var="i" value="${view.count}"/>
		<div class="portfolio-hover">
			<div class="portfolio-hover-content"></div>

			<!-- Modal 경상도 세부 1 -->
			<div class="portfolio-modal modal fade" id="jeju${i}" tabindex="-1" role="dialog" aria-hidden="true">
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
										<p class="item-intro text-muted">Lorem ipsum dolor sitamet consectetur.</p>
										<div id="map_jeju${i}"></div>
										<p>${item.tour_info}</p>
										<ul class="list-inline">
											<li>Date: ${item.st_date}</li>
											<li>Client: Explore</li>
											<li>Category: Graphic Design</li>
										</ul>
										<a class="btn btn-success" data-toggle="modal" href="#jeju${i}" type="submit" >
											<i class="fa fa-times"></i>Close Project
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script>
			var map_jeju${i} = new naver.maps.Map("map_jeju${i}", {
			    	center: new naver.maps.LatLng(${item.location_x},${item.location_y}),
			    	size: new naver.maps.Size(500, 500),
			    	mapTypeId: naver.maps.MapTypeId.HYBRID,
			        zoom: 8
			    }),	
		       	marker_jj${i} = new naver.maps.Marker({
		            position: new naver.maps.LatLng(${item.location_x},${item.location_y}),
			    	map: map_jeju${i}
		        }),
		        info_jeju${i} = new naver.maps.InfoWindow({
				content: '<div>${item.tour_name}</div>'
				});
	        info_jeju${i}.open(map_jeju${i}, marker_jj${i}); 
		</script>
	</c:forEach>
</div>