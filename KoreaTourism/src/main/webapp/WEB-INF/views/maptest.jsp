<%@page import="com.saem.domain.TourVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
  
  <title>네이버 지도 API - 주소로 지도 표시하기</title>
  <script src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=lN3APOAVWfk96iNDnU6F&submodules=geocoder"></script>
  <script type="text/javascript" src="resources/mapCluster/src/MarkerClustering.js"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.0.min.js" ></script>
</head>
<body>
	<%
		List<TourVO> list = new ArrayList<>();
		String sql = "SELECT * FROM the_sight_tourdata";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cos?useSSL=false&serverTimezone=Asia/Seoul", "root", "bitc5600");
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				TourVO tvo = new TourVO();
				
				tvo.setTour_name(rs.getString("tour_name"));
				tvo.setTour_div(rs.getString("tour_div"));
				tvo.setAddr_street(rs.getString("addr_street"));
				tvo.setAddr_location(rs.getString("addr_location"));
				tvo.setLocation_x(rs.getString("location_x"));
				tvo.setLocation_y(rs.getString("location_y"));
				tvo.setLocation_area(rs.getString("location_area"));
				tvo.setPb_store_info(rs.getString("pb_store_info"));
				tvo.setPb_play_info(rs.getString("pb_play_info"));
				tvo.setPb_cul_info(rs.getString("pb_cul_info"));
				tvo.setPb_peo_info(rs.getString("pb_peo_info"));
				tvo.setPb_sp_info(rs.getString("pb_sp_info"));
				tvo.setSt_date(rs.getString("st_date"));
				tvo.setCa_peo(rs.getString("ca_peo"));
				tvo.setCa_car(rs.getString("ca_car"));
				tvo.setTour_info(rs.getString("tour_info"));
				tvo.setTour_com_tel(rs.getString("tour_com_tel"));
				tvo.setTour_com_name(rs.getString("tour_com_name"));
				tvo.setRec_update(rs.getString("rec_update"));
				tvo.setDiv_seg_area(rs.getString("div_seg_area"));
				tvo.setDiv_seg_name(rs.getString("div_seg_name"));
				tvo.setDiv_area_count(rs.getInt("div_area_count"));
				
				list.add(tvo);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		pageContext.setAttribute("list", list);
		
	%>
	<!-- <div id="map" style="width:100%;height:100%;padding:0;margin:0;"></div> -->
	
		<div id="map2">
			<div class="buttons">
				<input id="NORMAL" type="button" value="일반지도" class="control-btn control-on">
				<input id="TERRAIN" type="button" value="지형도" class="control-btn">
				<input id="SATELLITE" type="button" value="위성지도" class="control-btn">
				<input id="HYBRID" type="button" value="겹쳐보기" class="control-btn">
			</div>
		</div>
		<script>
			var btns = $(".buttons > input");
			btns.on("click", function(e) {
			    e.preventDefault();
	
			    var mapTypeId = this.id;
	
			    if (map.getMapTypeId() !== naver.maps.MapTypeId[mapTypeId]) {
			        map.setMapTypeId(naver.maps.MapTypeId[mapTypeId]); // 지도 유형 변경하기
	
			        btns.removeClass("control-on");
			        $(this).addClass("control-on");
			    }
			});
			
			var map = new naver.maps.Map('map2', {
				size: new naver.maps.Size(1024, 500),
			    center: new naver.maps.LatLng(37.3595704, 127.105399),
			    mapTypeId: naver.maps.MapTypeId.HYBRID,
			    zoom: 10
			});
		</script>
	<script>
	
	//---------- 페이지 시작부터 불러오기로 맵을 만든다. markers는 marker를 넣기위한 배열틀이다.
    var map = new naver.maps.Map("map", {
    	size: new naver.maps.Size(1024, 500),
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
	
	//------------------------for문을 이용한 마킹찍어서 설명 보이기------
	//<c:forEach var="i" begin="1" end="${list.size()-1}" step="1">
	//	document.getElementById("map").onload = onload2(${list.get(i).location_x}, ${list.get(i).location_y}, '${list.get(i).tour_name }');
	//</c:forEach>
	
	//------------------------클러스터 기법 foreach사용
	function onLoad() {
			<c:set var="i" value="1"/>
	    <c:forEach var="item" items="${list}">
	        var marker = new naver.maps.Marker({
	            position: new naver.maps.LatLng(${item.location_x}, ${item.location_y}),
	        });
  		 	
			naver.maps.Event.addListener(marker, "click", function(e) {
				if (infowindow.getMap()) {
				  infowindow.close();
				} else {
				  infowindow.open(map, marker);
				  window.setTimeout(function () { infowindow.close(); }, 2000);//2초뒤 정보 사라짐
				}
			});
			
  		// 마크 클릭시 인포윈도우 오픈
			var infowindow = new naver.maps.InfoWindow({
				content: '${item.tour_name } '
			});
  			
			markers.push(marker);
			<c:set var="i" value="${i = i + 1}" />
	    </c:forEach>
	    //for (var i = 0, ii = data.length; i < ii; i++) {   }
		
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
	    
	       
	}
	// endof onLoad();
	
    //----------------------------------------------------------------------------------------
    function onload2(x,y,info) {
	   	var marker = new naver.maps.Marker({
	   	    position: new naver.maps.LatLng(x, y)
	   	});
	   	markers.push(marker);
	    // 마커 클릭 이벤트 처리
       naver.maps.Event.addListener(marker, "click", function(e) {
         if (infowindow.getMap()) {
           infowindow.close();
         } else {
           infowindow.open(map, marker);
           //window.setTimeout(function () { infowindow.close(); }, 2000);//2초뒤 정보 사라짐
         }
       });
       // 마크 클릭시 인포윈도우 오픈
       var infowindow = new naver.maps.InfoWindow({
         content: '소개합니다. info' + info
       });
       
       //MarkerCluster();
	}// end of onload(x,y,info)
    
	//------------------------------------------MarkerClustering-------------------------------------
	 function MarkerCluster(){
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
	}
	
	//-------------------------------------------------------------------------------------------
    function fn() {//검색한곳에 핀찍기
     myaddress = document.getElementById("addr").value; 
     
      //var myaddress = '양지로 42 번길 66-24';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
      naver.maps.Service.geocode({address: myaddress}, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
          return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
        }
        
        var result = response.result;
          // 검색 결과 갯수: result.total
          // 첫번째 결과 결과 주소: result.items[0].address
          // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
          var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
          map.setCenter(myaddr); // 검색된 좌표로 지도 이동

          map.setZoom(12);
          
          // 마커 표시
          var marker = new naver.maps.Marker({
            position: myaddr, // 검색한 곳.
            map: map	 	  // map에 찍는다.
          });
          
          // 마커 클릭 이벤트 처리
          naver.maps.Event.addListener(marker, "click", function(e) {
            if (infowindow.getMap()) {
              infowindow.close();
            } else {
              infowindow.open(map, marker);
              window.setTimeout(function () { infowindow.close(); }, 2000);//2초뒤 정보 사라짐
            }
          });
          // 마크 클릭시 인포윈도우 오픈
          var infowindow = new naver.maps.InfoWindow({
            content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
          });

        });
    }
	
//---------------------------아래는 혹시나 필요로 할까 몰라서 남겨둔 자잘한 코드들입니다.----------------------------------------------
	   /*  var map = new naver.maps.Map('map', {
		   	 size: new naver.maps.Size(1024, 500),
		   	 center: new N.LatLng(36.490692,128.0897413),
		   	 zoom: 2
		    }); */		
		<%-- var cityHall = new naver.maps.LatLng(<%= list.get(1).getLocation_x()%>,<%= list.get(1).getLocation_y()%>); --%>
	    
 /* naver.maps.Event.addListener(marker, "click", function(e) {
     if (infowindow.getMap()) {
       infowindow.close();
     } else {
       infowindow.open(map, marker);
       window.setTimeout(function () { infowindow.close(); }, 2000);//2초뒤 정보 사라짐
     }
   });
 var infowindow = new naver.maps.InfoWindow({
     content: '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
   }); */
 //map.setOptions("minZoom", 1);
	//map.setOptions("maxZoom", 10);
		 
 //var bounds = map.getBounds();
 //map.fitBound(bounds);

 //map.panBy(new naver.maps.Point(15, -30));
 

 
  </script>
  <input type="text" id="addr">
  <input type="button" value="전송" onclick="fn()">

</body>
</html>