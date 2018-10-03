<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 여기를 따로 빼내기 -->
<!-- Portfolio Modals -->

<!-- --------여기는 관광지를 지역별로 뿌리는부분 ---------------------------------------------------------- -->
<div class="portfolio-modal modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true" style="overflow-y: scroll;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mx-auto">
						<div class="modal-body">
							<!-- Project Details Go Here -->
							<h2 class="text-uppercase" id="local_name">localInfo</h2>
							<div class="close-modal" data-dismiss="modal">
								<div class="lr">
									<div class="rl"></div>
								</div>
							</div>
							<p class="item-intro text-muted">Lorem ipsum dolor sit amet consectetur.</p>
							<!-- ---------------------------------------------------------------------- -->
							<!-- 지역 이미지 -->
								<div class="row" id="localData">
									<%-- <div class="col-md-4 col-sm-6 portfolio-item">
										<a class="portfolio-link" data-toggle="modal" href="#seg_Data${i}"> 
											<img class="img-fluid" src="resources/design/img/portfolio/01-thumbnail.jpg" alt="">
										</a>
										<div class="portfolio-caption">
											<h4>${item.tour_name}</h4>
											<p class="text-muted">${item.div_seg_area}</p>
										</div>
										
									</div> --%>
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
	<div class="portfolio-hover">
		<div class="portfolio-hover-content"></div>
		<div class="portfolio-modal modal fade" id="seg_Data" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="close-modal" data-dismiss="modal">
						<div class="lr">
							<div class="rl"></div>
						</div>
					</div>
					<div class="container">
						<div class="row" id="tour_Data">
							<%-- <div class="col-lg-8 mx-auto">
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
									<a class="btn btn-success" data-toggle="modal" href="#seg_Data${i}" type="submit" >
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
							</div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>