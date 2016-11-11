<html>
<head>
<title>Human Face</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
	 
			var ab = {

				"fillColor": "#00FF00",
				
				};			
			
			var cd = {
			    "color":"#800080",
				"fillColor":"#800080",
				"opacity": 1,
				};			
	  
				// load polygons
			var geojsonURL ='source/geojson.geojson';	
			$.getJSON(geojsonURL,function(data){ 
				L.geoJson(data, {
					style: function (feature) {
						return feature.properties;
					},
				
				
				onEachFeature:function (feature, layer){
					 // Fill the color for all properities
					 layer.setStyle(cd);
					 
					// Popup
					layer.bindPopup(feature.properties.st_num  + ' ' +feature.properties.st_name);
					// Highlight the target properity and history
                    layer.on('click', function () {
                        layer.setStyle(ab);
							}
						);
                    
					}
					
					
				}
				).addTo(map);
				
				$(".leaflet-map-pane svg").css("z-index", 0);
				
				
			});		
					

				</script>
	
				</div>
			
			<div id="sidebar">
				
					<div class="year">
					
					 <label for="years">&nbsp;&nbsp;&nbsp;Year：</label>
					<input type="text" id="years" style="background-color:transparent;border:0; color:#f6931f; font-weight:bold;">
				
							
						<div id="slid">
						<script>
							$(function() {
								$( "#slid" ).slider({
								range: "min",
								value: 1960,
								min: 1960,
								max: 1972,
								step: 1,
								slide: function( event, ui ) {
									$( "#years" ).val( ui.value );
									}
								});
								$( "#years" ).val($( "#slid" ).slider( "value" ) );
							});
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
