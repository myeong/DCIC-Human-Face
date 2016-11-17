<html>
<head>
<title>Human Face</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="style.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type='text/javascript' src='http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js'></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.1/dist/leaflet.css" />
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

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
				
				
			function myFunction(){  
				var input = document.getElementById('fname').value;

				document.getElementById('demo').value=input;
				
				var MaxCount=input;
				console.log(MaxCount);
				
				$("svg g path").attr("fill", "blue");
				
			}
				
			var map = L.map('map').setView([35.5861, -82.5554], 17);
			
			// load a main layer
			L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
				{				
				center:[35.5861, -82.5554],
			    //Zoom level
				maxZoom: 19,
				minZoom: 14
				}).addTo(map);
				
        	
				
				
				
		// Turn the color to green when click the polygon
				var fillColor = {
				"fillColor": "#00FF00",
				};			
			    // Basci color of the polygon layer
				var basicColor = {
			    "color":"#800080",
				"fillColor":"#800080",
				"opacity": 1,
				};			
	 
			
				
			// load polygons
	
		var geojsonURL ='geojson.geojson';	
	
	
		var MaxCount=$('fname').value;
		console.log(MaxCount);
	
		var promise= $.getJSON(geojsonURL,function(data) {

			// Year filter
	
			var selected= L.geoJson(data, {
					style: function(feature) {
					return  basicColor;
					}
				});
	
			
		
			// Add to map
			selected.on('click', function (e) {
				selected = e.layer;
			
				// Check for selected
					if (selected) {
					// Reset selected to default style
					e.target.setStyle(basicColor);
					};
					// Assign new selected
					selected = e.layer;
					// Bring selected to front
					selected.bringToFront();	
			
					selected.bindPopup(selected.feature.properties.st_num  + ' ' +selected.feature.properties.st_name);
					selected.setStyle(fillColor);
	
			});

			selected.addTo(map);
			
			
		
		$(".leaflet-map-pane svg").css("z-index", 0);
		});
		
				
				</script>
	
				</div>
			
			<div id="sidebar">
				
					<div class="year">
					
					
					
					<ul id="slid">
					<li><label>Year：</label></li>
					<li>
					<input type="text" id="demo" style="background-color:transparent;border:0; color:#f6931f; font-weight:bold;">
					</li>
					</ul>
					<input type="range" id="fname" min="1960" max="1972" step="1" value="1960" onchange="myFunction()">
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
	</div>
	<div id="footer">
		<div>
			<span>Copyright &copy;. All rights reserved. Design from <a href="http://dcicblog.umd.edu/human-face-of-big-data/" class="bft" >Human-Face Team</a></span>
			
		</div>
	</div>
</body>
</html>
