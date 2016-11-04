<html>
<head>
<title>Human Face</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js'></script>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.1/dist/leaflet.css" />
</head>
<body>
	<div id="site">
		<div id="header">																										
			<div id="menu">
				<ul>
					<li><a href="#" class="but1"><img src="images/spacer.gif" alt="" width="106" height="42" /></a></li>
					<li><a href="#" class="but2"><img src="images/spacer.gif" alt="" width="118" height="42" /></a></li>
					<li><a href="#" class="but3"><img src="images/spacer.gif" alt="" width="106" height="42" /></a></li>
					<li><a href="#" class="but4"><img src="images/spacer.gif" alt="" width="99" height="42" /></a></li>
					<li><a href="#" class="but6"><img src="images/spacer.gif" alt="" width="129" height="42" /></a></li>
				</ul>
			</div>
		</div>
		
		
		
		
		
		<div id="content">	
			<div id="main">
				<div id="map">
				</div>
				
				<script>

				var map = L.map('map').setView([35.5861, -82.5554], 16);
			
				// load a main layer
				L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
					{				
					center:[35.5861, -82.5554],
					maxZoom: 18,
					minZoom: 13
					}).addTo(map);
				
				// load polygons
				$.getJSON("source/geojson.geojson",function(data){ 
				
				 L.geoJson(data,
				 {
					//popups ,not finish
					pointToLayer: function (feature, latlng) {
					return L.Marker(latlng, geojsonMarkerOptions);	}
	
				 }
				 
				 ).addTo(map);
				});

				
	
	

				</script>
	
				</div>
			
			<div id="sidebar">
				
					<div class="year">
							<p> Year</p>
							
					</div>
		
				<div class="search">
					<p> Search </p>
				</div>
				<div class="dynamic">
					
				<p> Dynamic </p>
				
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<div>
			<span>Copyright &copy;. All rights reserved. Design from <a href="http://dcicblog.umd.edu/human-face-of-big-data/" class="bft" >Human-Face Team</a></span>
			
		</div>
	</div>
</body>
</html>
