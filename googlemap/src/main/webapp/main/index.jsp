<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#map {
        width: 100%;
        height: 600px;
      }
 </style>
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD1i_Tqv78JbdxSefDQ0cm3gwJJN5BRQ_U&callback=initMap"></script>
 <script>
 	
      function initMap() { // 지도 요청시 callback으로 호출될 메서드 부분으로 지도를 맨처음 초기화하고, 표시해주는 함수
      	var latVal = 37.566536; // 게시글 DTO에서 위도값을 가져옴
    	var lngVal = 126.97797; // 게시글 DTO에서 경도값을 가져옴
        var mapLocation = {lat: latVal, lng: lngVal}; // 위도, 경도를 가지는 객체를 생성
    	/*     var map = new google.maps.Map(document.getElementById('map'), { // 위의 div id="map" 부분에 지도를 추가하는 부분
          zoom: 18, // 확대 정도(ZOOM)
          center: uluru // 지도에 표시해주는 중심이 우리가 만든 객체의 위치를 지정해주도록 함
        });
         */
         /*
         var map = new google.maps.Map(document.getElementById('map'), {
        	zoom: 15,
        	center: mapLocation
         });
         var marker = new google.maps.Marker({
        	 position: mapLocation,
        	 title: "Hello Marker"        	 
         });
         marker.setMap(map);
         */
        
        var mapOptions = {
                center: mapLocation, // 지도에서 가운데로 위치할 위도와 경도(변수)
                zoom: 18, // 지도 zoom단계
                mapTypeId: google.maps.MapTypeId.ROADMAP
              };
              var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body에 있는 div태그의 id와 같아야 함
                  mapOptions);
               
              var size_x = 60; // 마커로 사용할 이미지의 가로 크기
              var size_y = 60; // 마커로 사용할 이미지의 세로 크기
               
              // 마커로 사용할 이미지 주소
              var image = new google.maps.MarkerImage( 'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
                                  new google.maps.Size(size_x, size_y),
                                  '',
                                  '',
                                  new google.maps.Size(size_x, size_y));
               
              var marker;
              marker = new google.maps.Marker({
                     position: mapLocation, // 마커가 위치할 위도와 경도(변수)
                     map: map,
                     icon: image, // 마커로 사용할 이미지(변수)
                     title: "현재 위치" // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
              });
               
              var content = "근처에서 거래를 희망합니다."; // 말풍선 안에 들어갈 내용
               
              // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
              var infowindow = new google.maps.InfoWindow({ content: content});
       
              google.maps.event.addListener(marker, "click", function() {
                  infowindow.open(map,marker);
              });
               
       
        /*
         단순한 마커로 default로 표시할 때 쓰는 마커 세팅
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
          });
        
         */
      }
</script>
    <!-- 
    	아래는 서버로부터 지도를 로딩하기 위해 요청하는 경로 async는 비동기로 로딩하도록해 지도 로딩 중 다른 웹 부분들이 열릴 수 있도록하기 위함
    	key부분에는 자신의 키를 넣고, 로딩이 완료되면 callback에 지정한 함수를 수행하게 됨.
     --> 
</head>
<body>
	<p>Google Map</p>
	<div id=mapdiv">
		<div id="map"></div>
	</div>

</body>
</html>