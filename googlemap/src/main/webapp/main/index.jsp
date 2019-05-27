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
 	
      function initMap() { // ���� ��û�� callback���� ȣ��� �޼��� �κ����� ������ ��ó�� �ʱ�ȭ�ϰ�, ǥ�����ִ� �Լ�
      	var latVal = 37.566536; // �Խñ� DTO���� �������� ������
    	var lngVal = 126.97797; // �Խñ� DTO���� �浵���� ������
        var mapLocation = {lat: latVal, lng: lngVal}; // ����, �浵�� ������ ��ü�� ����
    	/*     var map = new google.maps.Map(document.getElementById('map'), { // ���� div id="map" �κп� ������ �߰��ϴ� �κ�
          zoom: 18, // Ȯ�� ����(ZOOM)
          center: uluru // ������ ǥ�����ִ� �߽��� �츮�� ���� ��ü�� ��ġ�� �������ֵ��� ��
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
                center: mapLocation, // �������� ����� ��ġ�� ������ �浵(����)
                zoom: 18, // ���� zoom�ܰ�
                mapTypeId: google.maps.MapTypeId.ROADMAP
              };
              var map = new google.maps.Map(document.getElementById("map"), // id: map-canvas, body�� �ִ� div�±��� id�� ���ƾ� ��
                  mapOptions);
               
              var size_x = 60; // ��Ŀ�� ����� �̹����� ���� ũ��
              var size_y = 60; // ��Ŀ�� ����� �̹����� ���� ũ��
               
              // ��Ŀ�� ����� �̹��� �ּ�
              var image = new google.maps.MarkerImage( 'http://www.weicherthallmark.com/wp-content/themes/realty/lib/images/map-marker/map-marker-gold-fat.png',
                                  new google.maps.Size(size_x, size_y),
                                  '',
                                  '',
                                  new google.maps.Size(size_x, size_y));
               
              var marker;
              marker = new google.maps.Marker({
                     position: mapLocation, // ��Ŀ�� ��ġ�� ������ �浵(����)
                     map: map,
                     icon: image, // ��Ŀ�� ����� �̹���(����)
                     title: "���� ��ġ" // ��Ŀ�� ���콺 ����Ʈ�� ���ٴ��� �� �ߴ� Ÿ��Ʋ
              });
               
              var content = "��ó���� �ŷ��� ����մϴ�."; // ��ǳ�� �ȿ� �� ����
               
              // ��Ŀ�� Ŭ������ ���� �̺�Ʈ. ��ǳ�� ��~
              var infowindow = new google.maps.InfoWindow({ content: content});
       
              google.maps.event.addListener(marker, "click", function() {
                  infowindow.open(map,marker);
              });
               
       
        /*
         �ܼ��� ��Ŀ�� default�� ǥ���� �� ���� ��Ŀ ����
        var marker = new google.maps.Marker({
            position: uluru,
            map: map
          });
        
         */
      }
</script>
    <!-- 
    	�Ʒ��� �����κ��� ������ �ε��ϱ� ���� ��û�ϴ� ��� async�� �񵿱�� �ε��ϵ����� ���� �ε� �� �ٸ� �� �κе��� ���� �� �ֵ����ϱ� ����
    	key�κп��� �ڽ��� Ű�� �ְ�, �ε��� �Ϸ�Ǹ� callback�� ������ �Լ��� �����ϰ� ��.
     --> 
</head>
<body>
	<p>Google Map</p>
	<div id=mapdiv">
		<div id="map"></div>
	</div>

</body>
</html>