<html>
<head>
<title>Human Face</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" type="text/css" href="source/style.css" />
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
			var parcels = new L.LayerGroup();
			// 1960 blue one 
			var poly = new L.LayerGroup();
			var baseMap;
			var map;
			var geojsonURL ='source/with_date.geojson';					
    		
			// load polygon and map
			// Basic color (Blue)
			var basic = {
			   "color":"#F46E42",
			   "fillColor":"#808080",
				"opacity": 1,
			};	
			
			
			// Turn the color to lime green when click the polygon
			var fillColor = {
				"fillColor": "#00FF00",
			};	
			
			
			var fill = {
				"fillColor": "#808080",
				"opacity": 1,
			};	
			
			function myFunction(){
				poly.clearLayers();
				parcels.clearLayers();
				var year;
				var input
				input = document.getElementById('fname').value;
				document.getElementById('demo').value=input;
				year=input;
				console.log(year);
				var polygonC= $.getJSON(geojsonURL,function(data) {
					var property= L.geoJson(data, {
						style: function(feature) {
			
						if (year>=feature.properties.offer_made &  year< feature.properties.offer_accepted) {
				            return {"color":"#FFFF00",
									"opacity": 1,}; 
							}
						else if (year>=feature.properties.offer_accepted  && year< feature.properties.rejected) {
				        	return {"color":"#008000",
									"opacity": 1,};
							}
						else if (year>=feature.properties.rejected && year< feature.properties.final_title)	{
							return {"color":"#FF0000",
									"opacity": 1,};	
							}
						else if (year>=feature.properties.final_title && year<feature.properties.removed)	{
							return {"color":"#9542F4",
									"opacity": 1,};
							}
						else if (year>=feature.properties.removed)	{
							return {"color":"#000000",
									"opacity": 1,};	
							}	
						else {
							return {"color":"#F46E42",
							"opacity": 1,};	
					
							}
						}
					});
					property.on('click', function (e) {
						// Reset
						if (property) {
							
						// Reset selected to default style
						e.target.setStyle(fill);
						};

						// Assign new selected
						property = e.layer;
						// Bring selected to front
						property.bringToFront();	
						property.bindPopup(property.feature.properties.st_num  + ' ' +property.feature.properties.st_name); 
						property.setStyle(fillColor);
						});
						
					// Bring popup on the top	
					$(".leaflet-map-pane svg").css("z-index", 0);
					property.addTo(parcels);
				});		
			
			
			
			};
			
			// Blue layer 1960
			
			var polygon= $.getJSON(geojsonURL,function(data) {
				var selected= L.geoJson(data, {
					style: function(feature) {
					return  basic;
					}
				});
				selected.on('click', function (e) {
						// Reset
						if (selected) {
							
						// Reset selected to default style
						e.target.setStyle(basic);
						};

						// Assign new selected
						selected = e.layer;
						// Bring selected to front
						selected.bringToFront();	
						selected.bindPopup(selected.feature.properties.st_num  + ' ' +selected.feature.properties.st_name); 
						selected.setStyle(fillColor);
						});
						
					selected.addTo(poly);
					// Bring popup on the top	
					$(".leaflet-map-pane svg").css("z-index", 0);
						
				//Legend
				//var legend = L.control({position: 'bottomleft'});

				//legend.onAdd = function (map) {

					//var div = L.DomUtil.create('div', 'info legend'),
					//grades = [" "],
					//labels = ["source/1.png"];

					// loop through our density intervals and generate a label with a colored square for each interval
					//for (var i = 0; i < grades.length; i++) {
						//div.innerHTML +=
						//grades[i] + (" <img src="+ labels[i] +" height='200' width='200' style='opacity:0.8'>") +'<br>';
					//}

					//return div;
				//};

				//legend.addTo(map);
				
					
			});
			
			
			baseMap = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
							{				
								center:[35.5861, -82.5554],
							    //Zoom level
								maxZoom: 19,
								minZoom: 14
							});
			
			map = L.map('map',{
				center:[35.5861, -82.5554], 
				zoom:17,
				layers: [baseMap,poly,parcels]
			});
			
			
			
			
			
		
			
			
			
			
			
			
			
			
		
			
			
			
			
			

			
			
				
</script>

				</div>
			
				<div id="sidebar">
					<div class="year">
						<ul id="slid">
							<li><label>Year:</label></li>
							<li>
							<input type="text" id="demo" style="background-color:transparent;border:0;  font-size:18px;color:#f6931f; font-weight:bold;">
							</li>
						</ul>
						<input type="range" id="fname" min="1960" max="1976" value="1960" step="1" onchange="myFunction()">
	                    <script>
						document.getElementById("demo").value=1960;
						
						</script>	
					
					</div>
				</div>
		
				<div class="search">
				<?php
					require('db.php');
					
					// If form submitted, insert values into the database.
					$name = stripslashes($_REQUEST['name']); // removes backslashes
					$name = mysqli_real_escape_string($con,$name); //escapes special characters in a string
					$address = stripslashes($_REQUEST['address']);
					$address = mysqli_real_escape_string($con,$address);
		
					//Checking is information existing in the database or not
					$query = "SELECT * FROM `tablename` WHERE name='$name' or address='$address'";
					$result = mysqli_query($con,$query) or die(mysql_error());
					$rows = mysqli_num_rows($result);
					if($rows>=1){
					header("Location: index.php"); // Redirect user to index.php
					}else{
					echo "<div class='form'><h3>Username/password is incorrect.</h3><br/>Click here to <a href='login.php'>Login</a></div>";
					}	
				?>

				<div class="form">
					<h1>Search</h1>
					<form action="" method="post" name="post">
					<p> 
					<label> Name：</label>
					<input type="text" name="name" placeholder="Name" required />
					</p>
					<p>	
					<label> Address：</label>
					<input type="text" name="address" placeholder="Address" required />
					</p>	
					<input name="search" type="submit" value="Search" />
				 </form>

				</div>

				</div>



				
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
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
