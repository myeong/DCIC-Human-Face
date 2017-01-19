<html>
<head>
<title>Human Face</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
<!-- <script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script src="js/leaflet.ajax.min.js"> </script>
<script src="source/with_date.js"> </script>

<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">

<!-- <script type='text/javascript' src='http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js'></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.1/dist/leaflet.css" /> -->
<script>
	function getYear(){
			var input = document.getElementById('fname').value;
			document.getElementById('demo').value=input;
			// Get slider value
			return input;
	}
</script>
<script>
$(document).ready(function(){
	var map = L.map('map').setView([35.5861, -82.5554], 16);

	var baseMapIndex = {
	  "Map": baseMap
	};
	
	// load a main layer
	var baseMap = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
					{				
						center:[35.5861, -82.5554],
					    //Zoom level
						maxZoom: 19,
						minZoom: 14,
						layers: baseMap
					}).addTo(map);

	var hoverColor = {
	    fillColor:"yellow"
	};	

	var defaultStyle = {
		fillColor: "#0000FF",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var before1970 = {
		fillColor: "#FF0000",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	function highlightDot(e){
		var layer = e.target;
		layer.setStyle(hoverColor);
	}

	function resetDotHighlight(e){
		var layer = e.target;		

		// this is the way to access propertis from "event"
		if (layer.feature.properties.offer_made < getYear()) {
            layer.setStyle(before1970);
        } else {
        	layer.setStyle(defaultStyle);
        }
	}
	
	// When a polygon is clicked
	function onEachFeature(feature, layer) {
			var popupContent = "<p>This parel's ID is " +
					feature.properties.id + ", and Block number is " + feature.properties.block +"</p>";

			if (feature.properties && feature.properties.popupContent) {
				popupContent += feature.properties.popupContent;
			}

			layer.on({
		        mouseover: highlightDot,
		        mouseout: resetDotHighlight
		    });

			layer.bindPopup(popupContent);
	}
	

	// drawing a Polygon Layer
	L.geoJSON([parcels], {

		style: function(feature) {
	        if (feature.properties.offer_made < getYear()) {
	            return before1970;
	        } else {
	        	return defaultStyle;	
	        }
	    },

		onEachFeature: onEachFeature,


	}).addTo(map);

	
});
				
</script>
</head>
<body>
	<div id="site">
		<div id="header">																										
			<!-- <div id="menu">
				<ul>
					<li><a href="#" class="but1"><img src="images/spacer.gif" alt="" width="106" height="42" /></a></li>
					<li><a href="#" class="but2"><img src="images/spacer.gif" alt="" width="118" height="42" /></a></li>
					<li><a href="#" class="but3"><img src="images/spacer.gif" alt="" width="106" height="42" /></a></li>
					<li><a href="#" class="but4"><img src="images/spacer.gif" alt="" width="99" height="42" /></a></li>
					<li><a href="#" class="but6"><img src="images/spacer.gif" alt="" width="129" height="42" /></a></li>
				</ul>
			</div> -->
		</div>
		
		
		
		<div id="content">	
			<div id="main">
				<div id="map">
				</div>

			</div>
			
			<div id="sidebar">
				<div class="year">
					<ul id="slid">
						<li><label>Year:</label></li>
						<li>
						<input type="text" id="demo" style="background-color:transparent;border:0;  font-size:18px;color:#f6931f; font-weight:bold;">
						</li>
					</ul>
					<input type="range" id="fname" name="fname" min="1960" max="1976" step="1" value="1960" onchange="getYear()">
                    <script>
						document.getElementById("demo").value=1960;							
					</script>	
				
				</div>
			</div>
		
			<div class="search">
				<p> Search </p>
			</div>
			<div class="dynamic">				
				<p> Dynamic </p>
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
