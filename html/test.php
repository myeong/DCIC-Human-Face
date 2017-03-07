<html>
<head>
<title>Human Face</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta charset="UTF-8">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<script type="text/javascript" src="https://d3js.org/d3.v3.min.js" ></script> 
<script src="//d3js.org/topojson.v1.min.js"></script>
<script src="js/leaflet-slider.js"></script>
<script src="js/L.Control.SlideMenu.js"></script>
<script src="js/leaflet-search.js"></script>
<script src="js/leaflet.ajax.min.js"></script>

<!-- Data -->
<!--<script src="js/with_date.js"> </script> -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="css/leaflet-search.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/L.Control.SlideMenu.css">
<link rel="stylesheet" href="css/leaflet-slider.css"/>

<script>
var geojson_path = "js/with_date.geojson";

$(document).ready(function(){
		
	//Color 
	var hoverColor = {
	    fillColor:"#00FF00"
	};	
	
			
	var c1 = {
		fillColor: "#0000FF",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c2 = {
		fillColor: "#FFFF00",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	var c3 = {
		fillColor: "#008000",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c4 = {
		fillColor: "#FF0000",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c5 = {
		fillColor: "#9542F4",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c6 = {
		fillColor: "#000000",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	var c7 = {
		fillColor: "#B23EA8",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var map = L.map('map').setView([35.5861, -82.5554], 17);

	//loading a GeoJSON file directly from the file 
	var poly = new L.GeoJSON.AJAX(geojson_path, {
		style: c1,					
		onEachFeature: onEachFeature,
	});
	// var poly= L.geoJson(polygons, {
	// 	style: c1,					
	// 	onEachFeature: onEachFeature,
	// });

	// load a main layer
	var baseMap = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', 
					{				
						center:[35.5861, -82.5554],
					    //Zoom level
						maxZoom: 18,
						minZoom: 10,
					});

	map.addLayer(baseMap);

	// Slider menu 
	var slideMenu = L.control.slideMenu('',{
		position: 'topright', 
		height: '630px', 
		width: '330px'
	}).addTo(map);

	slideMenu.setContents('<div id=\'menu_slider\'></div>');
	
	//Slider in Slider Menu
	// slider2 = L.control.slider(function(value) {
	// }, {
	// 		max: 1976,
	// 		min: 1960,
	// 		value: 1970,
	// 		step:1,
	// 		size: '250px',
	// 		orientation:'horizontal',
	// 		id: 'slider2',
	// 		collapsed: false
	// 	}).addTo(map); 
	
	// Slider menu layout elements
	var mapbuttons_div = L.DomUtil.get('menu_slider');
	
	// Year area
	var user_year = L.DomUtil.create('div', 'menu-year');
	mapbuttons_div.appendChild(user_year);
	var user_year_text = L.DomUtil.create('p', 'menu-year-text', user_year);
	user_year_text.innerHTML = 'Year: ';
	var user_year_input = L.DomUtil.create('p1', 'menu-year-input', user_year);
	user_year_input.innerHTML = "1960";
	
	//Search & Result area
	var search_box_div = L.DomUtil.create('div', 'menu-search-container');
	mapbuttons_div.appendChild(search_box_div);
	var search_box_text = L.DomUtil.create('p', 'menu-search-text', search_box_div);
	search_box_text.innerHTML = 'Address';
	var search_box = L.DomUtil.create('div', 'menu-search', search_box_div);
	search_box.setAttribute('id', 'menu-search-div');
	
	var searchControl = new L.Control.Search({
		layer: poly,
		propertyName: 'id',
		circleLocation: false,
		container: 'menu-search-div',
		collapsed: false,
		textErr: 'No data',
		textCancel: 'Cancel',		
		textPlaceholder: 'Please enter a street name', 
		hideMarkerOnCollapse: true,
		marker: false,
		minLength: 0,
		moveToLocation: function(latlng, title, map) {

			var zoom = map.getBoundsZoom(latlng.layer.getBounds());
  			map.setView(latlng, zoom);
			var st_name = latlng.layer.feature.properties.st_name;
			var blo = latlng.layer.feature.properties.block;
			var info="This parcel's block number is " + blo+" at "+st_name ;
  			
  			$(".menu-result").html(info);
			
			//hide and show
  			$(".menu-pie").hide();
  			$(".menu-result").show();
		}});
	searchControl.on('search:locationfound', function(e) {
		
		
	

	}).on('search:collapsed', function(e) {
			featuresLayer.eachLayer(function(layer) {	//restore feature color
			featuresLayer.resetStyle(layer);
		});	
		
	});
	map.addControl( searchControl );

	var result_div = L.DomUtil.create('div','menu-result-container');
	mapbuttons_div.appendChild(result_div);
	var result_text = L.DomUtil.create('p', 'menu-search-text', result_div);
	result_text.innerHTML = "Analysis & Results";
	
	var result = L.DomUtil.create('p', 'menu-result', result_div);
	result.innerHTML = "info";
	
	var pie = L.DomUtil.create('div', 'menu-pie');
	mapbuttons_div.appendChild(pie);


	// Loading the Asheville Raster Layer (tilemap)
	var asheville = L.tileLayer('asheville_tiles/{z}/{x}/{y}.png', {
		tms: true, 
		opacity: 0.8, 
		attribution: ""
	});
	map.addLayer(asheville);
	
	
	// Year slider
	var SLIDER_VALUE = 1960;
	var slider = L.control.slider(function(value) {
		SLIDER_VALUE = value;
		d3.select("#piie").remove();	
		$(".menu-year-input").html(value);	
        
		var cc1 = "#0000FF";
		var cc2 = "#FFFF00";		
		var cc3 = "#008000";		
		var cc4 = "#FF0000";
		var cc5 = "#9542F4";
		var cc6 = "#000000";
		var cc7 = "#B23EA8";	
		
		//Offer made
		var om=[];
		// Offer accepted
		var oa=[];
		// Offer rejected
		var or=[];
		//Finial title
		var ft=[];
		//Removed
		var ro=[];

		// Number counter
		var xom=0;
		var xoa=0;
		var xor=0;
		var xft=0;
		var xro=0;
			
		// seems like it's possible to calculate the number of layers by 
		// looping though each layer rather than load the JSON file one more 
		// time... need to see. If so, possible to shrink the code. Not urgent(Myeong)
		d3.json(geojson_path, function(data) {
            d3.select("#piie").remove();				
			// var data=g2[0];
			var length=data.features.length;				
			var year=SLIDER_VALUE;
	
			for (var i=0;i<length; i++) {
				
				om[i]=data.features[i].properties.offer_made;
	
				if (om[i]>=year) {
					om[i]=1;
				}
				else {om[i]=0;};
	
				xom +=om[i];			
				oa[i]=	data.features[i].properties.offer_accepted;
	
				if (oa[i]>=year) {
					oa[i]=1;
					}
				else {oa[i]=0;};
	
				xoa +=oa[i];				
				or[i]=	data.features[i].properties.offer_accepted;
	
				if (or[i]>=year) {
					or[i]=1;
					}
				else {or[i]=0;};
	
				xor +=or[i];		
				ft[i]=data.features[i].properties.final_title;

				if (ft[i]>=year) {
					ft[i]=1;
				}
				else {ft[i]=0;};

				xft +=ft[i];
				ro[i]=data.features[i].properties.final_title;

				if (ro[i]>=year) {
					ro[i]=1;
					}
				else {ro[i]=0;};

				xro +=ro[i];
			
			};
			
			var dataset=[];
			dataset = [
				{ label: 'Offer Made', count: xom },
				{ label: 'Offer Accepted', count: xoa }, 
				{ label: 'Offer Rejected', count: xor }, 
				{ label: 'Final Title', count: xft },
				{ label: 'Removed', count: xro },

			];
			// Percentage
			var total=xom+xoa+xor+xft+xro;
			var pom=Math.floor((xom / total) * 100)
			var poa=Math.floor((xoa / total) * 100)
			var por=Math.floor((xor / total) * 100)
			var pft=Math.floor((xft / total) * 100)
			var pro=Math.floor((xro / total) * 100)
			
			// Percentage array
			var percentage=[pom,poa,por,pft,pro];
			
			var width = 320;
			var height = 320;
			var radius = Math.min(width, height) / 2;
			var donutWidth = 75;
			var legendRectSize = 18;       
			var legendSpacing = 4; 
			var color = d3.scale.ordinal().range([cc2,cc3,cc4,cc5,cc6]);

			var svg = d3.select('.menu-pie')
				.append("svg:svg")
				.attr("id", "piie")
				.attr('width', width)
				.attr('height', height)
				.append('g')
				.attr('transform', 'translate(' + (width / 2) + 
					',' + (height / 2) + ')');
		
			var arc=d3.svg.arc()
				.outerRadius(radius)
				.innerRadius(radius - donutWidth);
	
			var pie = d3.layout.pie()
				.value(function(d) { return d.count; });

			var path = svg.selectAll('path')
				.data(pie(dataset))
				.enter()
				.append('path')
				.attr('d', arc)
				.attr('fill', function(d, i) { 
					return color(d.data.label);
				});
			
			var legend = svg.selectAll('.legend')                     
				.data(color.domain())                                   
				.enter()                                                
				.append('g')                                            
				.attr('class', 'legend')                              
				.attr('transform', function(d, i) {                     
		
					var height = legendRectSize + legendSpacing;         
					var offset =  height * color.domain().length / 2;     
					var horz = -3 * legendRectSize;                      
					var vert = i * height - offset+3;                       
					return 'translate(' + horz + ',' + vert + ')';        
				});  		  

	
			legend.append('rect')                                     
				.attr('width', legendRectSize)                          
				.attr('height', legendRectSize)                         
				.style('fill', color)                                   
				.style('stroke', color);                                

			legend.append('text')                                     
				.attr('x', legendRectSize + legendSpacing)              
				.attr('y', legendRectSize - legendSpacing)
				.style('fill', 'white')							
				.text(function(d,i) { return d+":"+ percentage[i]+"%"; });                       	
		
		});
		
		$(".menu-result").hide();
		$(".menu-pie").show();
	
		

		//pie chart
		poly.eachLayer(function(layer) {
			if (value<1961) {
				layer.setStyle(c1);
			}
			else {
			
				// console.log(layer);
				var properties = layer.feature.properties;
				if (properties.offer_made > 0) {
					if (value >= properties.offer_made && value < properties.offer_accepted) {
						layer.setStyle(c2);
					} else if (value >= properties.offer_accepted && value < properties.rejected) {
						layer.setStyle(c3);
					} else if (value >= properties.rejected && value < properties.final_title) {
						layer.setStyle(c4);
					} else if (value >= properties.final_title && value < properties.removed) {
						layer.setStyle(c5);
					} else if (value >= properties.removed) {
						layer.setStyle(c6);
					}
				} else {
					layer.setStyle(c1);
				}
			};
			
		});
		}, {
			max: 1976,
			min: 1960,
			value: 1960,
			step:1,
			size: '250px',
			orientation:'vertical',
			id: 'slider',
			collapsed: false,
			position: "topleft",
			syncSlider: true,
			increment: true
		}).addTo(map); 
	

	

	
		// Mouse track
		function highlightDot(e){
			var layer = e.target;
			layer.setStyle(hoverColor);
		}

		function resetDotHighlight(e){
			var layer = e.target;		
			if (SLIDER_VALUE<1961) {
					layer.setStyle(c1);
			}
			else {
				// this is the way to access propertis from "event"
				var properties = layer.feature.properties;
				if (properties.offer_made > 0) {
					if (SLIDER_VALUE >= properties.offer_made && SLIDER_VALUE < properties.offer_accepted) {
						layer.setStyle(c2);
					} else if (SLIDER_VALUE >= properties.offer_accepted && SLIDER_VALUE < properties.rejected) {
						layer.setStyle(c3);
					} else if (SLIDER_VALUE >= properties.rejected && SLIDER_VALUE < properties.final_title) {
						layer.setStyle(c4);
					} else if (SLIDER_VALUE >= properties.final_title && SLIDER_VALUE < properties.removed) {
						layer.setStyle(c5);
					} else if (SLIDER_VALUE >= properties.removed) {
						layer.setStyle(c6);
					}
				} else {
				layer.setStyle(c1);
				}
			}
		}
	
	
		// When a polygon is clicked
		function onEachFeature(feature, layer) {
			//var div = $('<div style="width: 200px; height: 200px;"></div>')[0];
			var popupContent = "<p>This parel's ID is " +
					feature.properties.id + ", and Block number is " + feature.properties.block +
					"</br>"+"Offer Made Date:"+feature.properties.offer_made+
					"</br>"+"Offer Accepted Date:"+feature.properties.offer_accepted+
					"</br>"+"Offer Rejected Date:"+feature.properties.rejected+
					"</br>"+"Final Title Date:"+feature.properties.final_title+
					"</br>"+"Removed Date:"+feature.properties.removed+"</p>";
			
			console.log(feature.properties);
			
			if (feature.properties && feature.properties.popupContent) {
				popupContent += feature.properties.popupContent;
			}

			var  pic_url='images/test.jpg';
			
			var customPopup= "<span style='float:left;width: 50%;'>"+"<img src="+  pic_url   + " height='220px'	;width='250px' />"+"</span>" +"<span style='float:right;width: 40%;'>"+popupContent+"</span>" ;
		    

			var customOptions =
			{
			'maxWidth': 'auto'
			}
		
			layer.on({
		        mouseover: highlightDot,
		        mouseout: resetDotHighlight
		    });

			layer.bindPopup(customPopup,customOptions);
			
		}
	
	map.addLayer(poly);
	
});
				
</script>
</head>
<body>
	<div id="site">
		<div id="header">																										
			
		</div>
		
		
		
		<div id="content">	
			<div id="main">
				<div id="map">
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
