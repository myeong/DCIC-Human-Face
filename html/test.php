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
				var map = L.map('map').setView([35.5861, -82.5554], 17);
			
			// load a main layer
			L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
				{				
				center:[35.5861, -82.5554],
			    //Zoom level
				maxZoom: 19,
				minZoom: 14
				}).addTo(map);
				
        	
				
				// load polygons
	
				var geojsonURL ='with_date.geojson';		
				// Turn the color to green when click the polygon
				var fillColor = {
				"fillColor": "#00FF00",
				};			
			    // Basci color of the polygon layer
				var basicColor = {
			    "color":"#0000FF",
				"fillColor":"#0000FF",
				"opacity": 1,
				};				
			
			
				var promise= $.getJSON(geojsonURL,function(data) {
					
	
					var selected= L.geoJson(data, {
						style: function(feature) {
						return  basicColor;
						}
					});
	
			
		
			
			
				// Add to map
				selected.on('click', function (e) {
				
			
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
				
				
				//Legend
				var legend = L.control({position: 'bottomleft'});

				legend.onAdd = function (map) {

					var div = L.DomUtil.create('div', 'info legend'),
					grades = [" "],
					labels = ["1.png"];

					// loop through our density intervals and generate a label with a colored square for each interval
					for (var i = 0; i < grades.length; i++) {
						div.innerHTML +=
						grades[i] + (" <img src="+ labels[i] +" height='200' width='200' style='opacity:0.8'>") +'<br>';
					}

					return div;
				};

				legend.addTo(map);
				// Bring popup on the top	
				$(".leaflet-map-pane svg").css("z-index", 0);
				});
				
				
				function myFunction(){  
					var input = document.getElementById('fname').value;
					document.getElementById('demo').value=input;
					// Get slider value
					var count=input;
				
					final_title=[];
					offer_made=[];
					offer_accepted=[];
					rejected=[];
					removed=[];

				
					var hu=promise.responseJSON.features;

					
				
					var length=promise.responseJSON.features.length;
					var colors;
					
					for (var i = 0; i <length; i++) {
						//Store different year data
						final_title[i]=hu[i].properties.final_title;
						offer_made[i]=hu[i].properties.offer_made;
						offer_accepted[i]=hu[i].properties.offer_accepted;
						rejected[i]=hu[i].properties.rejected;
						removed[i]=hu[i].properties.removed;
		
						// Find the color 
						if (count>=offer_made[i] &&  count< offer_accepted[i]) {colors='yellow'} 
						else if (count>=offer_accepted[i]  && count< rejected[i] ) {colors='green'}
						else if (count>=rejected[i] && count< final_title[i]) {colors='red'}
						else if (count>=final_title[i] && count<removed[i]) {colors='grey'}
						else if (count>removed[i]) {colors='black'}
						else {colors='blue'};
						
						var cc={ "fillColor":"colors"};
						
						//Set the  Color ?????
						
						
			
					};		
			
			


						
				};
					
			

			
				</script>
	
				</div>
			
			<div id="sidebar">
				
					<div class="year">
					
					
					
					<ul id="slid">
					<li><label>Year：</label></li>
					<li>
					<input type="text" id="demo" style="background-color:transparent;border:0;  font-size:18px;color:#f6931f; font-weight:bold;">
					</li>
					</ul>
					<input type="range" id="fname" min="1960" max="1976" step="1" value="1960" onchange="myFunction()">
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
