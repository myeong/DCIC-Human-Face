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
<script src="/js/leaflet-slider.js"></script>
<script src="/js/L.Control.SlideMenu.js"></script>
<script src="/js/leaflet-search.js"></script>
<script src="/js/leaflet.ajax.min.js"></script>

<!-- Data -->
<!--<script src="js/with_date.js"> </script> -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="/css/leaflet-search.css" />
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="/css/L.Control.SlideMenu.css">
<link rel="stylesheet" href="/css/leaflet-slider.css"/>

<script>
var geojson_path = "js/with_date.geojson";
var db_data = null;
var image_path = null;

function getdata(data){
	db_data = data;
}

function getimagedata(data){
	image_path = data;
}
   
function load_data() {
    // NOTE:  This function must return the value 
    //        from calling the $.ajax() method.
    return $.ajax({
        type:"GET",
        async:true,
        url:"get.php",
        dataType:'json',
        data: {
        	action: 'all'
        },
        error: function(err) {
        	console.log(err);        	
        }
    }).done(function(data){
    	// console.log(data);
    	getdata(data);
    });
}

function get_image_paths() {
    // NOTE:  This function must return the value 
    //        from calling the $.ajax() method.
    return $.ajax({
        type:"GET",
        async:true,
        url:"get_image_paths.php",
        dataType:'json',        
        error: function(err) {
        	console.log(err);        	
        }
    }).done(function(data){
    	// console.log(data);
    	getimagedata(data);
    });
}


$.when(load_data(), get_image_paths()).done(function() {
	
	//Color 
	var hoverColor = {
	    fillColor:"#ffffb3",
	    color: "#FF69B4",
	    weight: 4
	};	
			
	var c1 = {
		fillColor: "#0000FF",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c2 = {
		fillColor: "#f00",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var c3 = {
		fillColor: "#ff7f00",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c4 = {
		fillColor: "#ff0",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c5 = {
		fillColor: "#0f0",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c6 = {
		fillColor: "#0ff",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var c7 = {
		fillColor: "#8b00ff",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var c8 = {
		fillColor: "#000000",
		color: "white",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var highlight = {
		fillColor: "#fba4f1",
		color: "#fba4f1",
		weight: 1,
		fillOpacity: 1
	};
   
	var map = L.map('map').setView([35.5811, -82.5560], 16);

	//loading a GeoJSON file directly from the file 
	var poly = new L.GeoJSON.AJAX(geojson_path, {
		style: c1,					
		onEachFeature: onEachFeature,
	});

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
		height: '700px', 
		width: '355px'
	}).addTo(map);

	slideMenu.setContents('<div id=\'menu_slider\'></div>');
	
	
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
	search_box_text.innerHTML = 'Search';
	var search_box = L.DomUtil.create('div', 'menu-search', search_box_div);
	search_box.setAttribute('id', 'menu-search-div');
	var search_input_1 = L.DomUtil.create('input', 'menu-search-input', search_box);
	search_input_1.id = 'input-1';
	search_input_1.type = 'text';
	search_input_1.placeholder = 'owner_name';
	var search_input_2 = L.DomUtil.create('input', 'menu-search-input', search_box);
	search_input_2.id = 'input-2';
	search_input_2.type = 'text';
	search_input_2.placeholder = 'st_name';
	var search_btn = L.DomUtil.create('div', 'menu-search-btn', search_box);
	search_btn.innerHTML = 'Search';
	
	// Search check
	search_btn.onclick = function() {
		//console.log();
		var owner = $("#input-1").val();
		var name = $("#input-2").val();
		var mode;
		if (owner != '' && name != '') {
			mode = 'full';
		} else if (owner != '') {
			mode = 'owner_name';
		} else if (name != '') {
			mode = 'st_name';
		} else {
			alert("Empty search!");
		}
		$.ajax({
            type:"GET",
            async:true,
            url:"get.php",
            dataType:'json',
            data: {
            	action: 'search',
            	mode: mode,
            	st_name: name,
            	owner_name: owner
            },
            error: function(err) {
            	if (err.responseText == "Zero result") {
            		$(".menu-result").empty();
            		$(".menu-result").html("No Data");
            		$(".menu-result").show();
            		$(".menu-pie").hide();
            	}
            }
        }).done(function(data){
        	
        	parseResult(data);
        });
	}

	// Result Click 
	function parseResult(data) {
		$(".menu-result").empty();
		var frag = "";
		for (var i = 0; i < data.length; i++) {
			var index = i + 1;
			frag += "<div class=\"menu-result-row\" title=\"" + data[i].parcel_no + "," + data[i].block_no +"\">";
			frag += index + ": " + data[i].st_num + " " + data[i].st_name;
			frag += "</div>";
		}
		$(".menu-result").append(frag);
		$(".menu-result-row").unbind('click');
		$(".menu-result-row").on('click', function() {
			moveToPoly(this.title);
		})
		$(".menu-pie").hide();
  		$(".menu-result").show();
	}

	
		//Property Zoom in & Highlight
 	function moveToPoly(selector) {
		var parcel_no = selector.split(',')[0];
		var block_no = selector.split(',')[1];
		for (var i = 0; i < poly.getLayers().length; i++) {
			var temp = poly.getLayers()[i].feature.properties;
			if (parcel_no == temp.parcel && block_no == temp.block) {
				var layer = poly.getLayers()[i];
				layer.setStyle(highlight);
				map.fitBounds(layer.getBounds());
			}
		}
	}	

	
	// Data from database and store in "Poly"
	// Event data's structure look like this (two-dimensional array):
	// 		Array[index] {event_type, date}
    function parsePoly(feature, data) {

    	var parcel_num = feature.properties.parcel;
    	var block_num = feature.properties.block;
		var zero=String('No data');

    	var events = [];
    	var index = 0;

		feature.properties['events'] = zero; 

		
		// Search gthough Data
    	for (var i = 0; i< data.length; i++){
			var type = String(data[i].type);
    		// type = type.replace(/\s+/g, '');

    		// Only taking the first token for the array. (e.g., Transfer of Deed --> Transfer)
    		type = type.split(" ")[0];
		 
    		if (parseInt(data[i].block_no) == block_num && parseInt(data[i].parcel_no) == parcel_num){
    			if (type && data[i].date){					
					var obj = {};
					obj[type] = data[i].date;
					if (type == "Decision"){
						obj["response"] = data[i].response.replace(/\s+/g, '');;
					}
					events.push(obj);    				
    			}
    		}

    	}
    	if (events.length >0) feature.properties['events'] = events;
    };

	var result_div = L.DomUtil.create('div','menu-result-container');	
	mapbuttons_div.appendChild(result_div);

	var result_text = L.DomUtil.create('p', 'menu-search-text', result_div);
	result_text.innerHTML = "Analysis & Results";

	var result = L.DomUtil.create('div', 'menu-result', result_div);	
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
	var SLIDER_VALUE = String(1959);
	
	// console.log(db_data);
	// When slider value is changed
	var slider = L.control.slider(function(value,feature) {		
		SLIDER_VALUE = String(value);

		// Pie chart
		d3.select("#piie").remove();	

		// Set the year following the slidebar value.
		$(".menu-year-input").html(value);	
        
		var cc1 = "#f00";
		var cc2 = "#ff7f00";		
		var cc3 = "#ff0";		
		var cc4 = "#0f0";
		var cc5 = "#0ff";
		var cc6 = "#8b00ff";
		var cc7 = "#000000";
		var cc8 = "#0000FF";
	
		// seems like it's possible to calculate the number of layers by 
		// looping though each layer rather than loading the JSON file one more 
		// time... need to see. If so, possible to shrink the code. Not urgent(Myeong)	

		// d3.select("#piie").remove();
		
		var type_count = Array();

		type_count["no_data"] = 0;
		type_count["offer"] = 0;
		type_count["transfer"] = 0;
		type_count["appraisal"] = 0;
		type_count["decision"] = 0;
		type_count["tenant"] = 0;
		type_count["awarded"] = 0;
		type_count["end"] = 0;

		
		for (var i = 0; i < db_data.length; i++) {
			name=String(db_data[i].type);
			name=name.split(" ")[0];
			year= db_data[i].date.split("-")[0];

			if (value >= year){
				switch (name){
					case "Transfer":
						type_count["transfer"] += 1;						
						break;
					case "Offer":
						type_count["offer"] += 1;						
						break;
					case "Appraisal":
						type_count["appraisal"] += 1;						
						break;
					case "Tenant":
						type_count["tenant"] += 1;						
						break;
					case "Awarded":
						type_count["awarded"] += 1;						
						break;
					case "End":
						type_count["end"] += 1;						
						break;
					case "Decision":
						type_count["decision"] += 1;
						break;
				}
			}

		}		

		var total = 936;
		type_count["no_data"] = 936 - (type_count["transfer"] + type_count["offer"]
									+ type_count["appraisal"] + type_count["tenant"]
									+ type_count["awarded"] + type_count["end"]
									+ type_count["decision"]);

		var dataset = [			
			{ label: 'Offer Made', count: type_count["offer"] }, 
			{ label: 'Appraisal', count: type_count["appraisal"] }, 
			{ label: 'Decision for Offer', count: type_count["decision"] },
			{ label: 'Tenant Moved', count: type_count["tenant"] },
			{ label: 'Awarded', count: type_count["awarded"] },
			{ label: 'Transfer of Deed', count: type_count["transfer"] },
			{ label: 'End of Case', count: type_count["end"] },
			{ label: 'No data', count: type_count["no_data"] }
		];

		for (var key in type_count){
			type_count[key] = Math.floor((type_count[key] / total) * 100);
		}		

		var percentage = [
			type_count["offer"], 
			type_count["appraisal"],
			type_count["decision"],
			type_count["tenant"],
			type_count["awarded"],
			type_count["transfer"],
			type_count["end"],
			type_count["no_data"]
		]

		var width = 340;
		var height = 340;
		var radius = Math.min(width, height) / 2;
		var donutWidth = 58;
		var legendRectSize = 18;       
		var legendSpacing = 4; 
		var color = d3.scale.ordinal().range([cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]);

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
				var horz = -3.5 * legendRectSize;                      
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


		//poly color
		poly.eachLayer(function(layer) {
			SLIDER_VALUE=parseInt(SLIDER_VALUE);

			var properties = layer.feature.properties;				

			if (properties.events == "No data"){
				layer.setStyle(c1);
			} 
			else {
				var key = "";
				var year = 0;				
				var found = false;

				for (var i=0; i<properties.events.length; i++) {
					for (var k in properties.events[i]){
						year = parseInt(properties.events[i][k].split("-")[0]);
						if (SLIDER_VALUE >= year){
							key = k;
							found=true;	
							break;
						}
					}					
				}
				if (!found){
					layer.setStyle(c1);
				} else {
					switch (key){
						case "Transfer":
							layer.setStyle(c7);						
							break;
						case "Offer":
							layer.setStyle(c2);
							break;
						case "Appraisal":
							layer.setStyle(c3);
							break;
						case "Decision":
							layer.setStyle(c4);
							break;
						case "Tenant":
							layer.setStyle(c5);
							break;
						case "Awarded":
							layer.setStyle(c6);
							break;
						case "End":
							layer.setStyle(c8);
							break;
						// default:
						// 	layer.setStyle(c1);
						
					}
				}

			}	
		});	

	}, {
		max: 1978,
		min: 1959,
		value: 1959,
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
		var properties = layer.feature.properties;

		if (properties.events == "No data"){
				layer.setStyle(c1);
		} 
		else {
			var key = "";
			var year = 0;				
			var found = false;

			for (var i=0; i<properties.events.length; i++) {
				for (var k in properties.events[i]){
					year = parseInt(properties.events[i][k].split("-")[0]);
					if (SLIDER_VALUE >= year){
						key = k;
						found=true;						
						break;
					}
				}				
			}
			if (!found){
				layer.setStyle(c1);
			} else {
				switch (key){
					case "Transfer":
						layer.setStyle(c7);						
						break;
					case "Offer":
						layer.setStyle(c2);
						break;
					case "Appraisal":
						layer.setStyle(c3);
						break;
					case "Decision":
						layer.setStyle(c4);
						break;
					case "Tenant":
						layer.setStyle(c5);
						break;
					case "Awarded":
						layer.setStyle(c6);
						break;
					case "End":
						layer.setStyle(c8);
						break;
					// default:
					// 	layer.setStyle(c1);
					
				}
			}

		}
    
	}
	
	// When a polygon is clicked
	function onEachFeature(feature, layer) {

	    if (db_data){
	    	parsePoly(feature, db_data);		    	
	    }
		
	    var popupContent = "";
	    var circles = "";
	    
	    
	    if (feature.properties.events == "No data"){
	    	popupContent = "<p>No Data</p>";
	    } else {		    	
		    for (var i=0; i<feature.properties.events.length; i++){		    	
		    	popupContent += "<p>";

		    	for (var key in feature.properties.events[i]){
		    		var type = "";
		    		var circle = "";

			    	switch(key) {
					    case "Transfer":
					        type = "Transfer of Deed";
					        circle = "<div class='circle' style='background-color:#f00;'></div>";
					        break;
					    case "Offer":
					        type = "Offer Made";
					        circle = "<div class='circle' style='background-color:#ff7f00;'></div>";
					        break;
					    case "Appraisal":
					    	type = key;
					        circle = "<div class='circle' style='background-color:#ff0;'></div>";
					        break;
					    case "Decision":
					        type = "Decision for the Offer (" + feature.properties.events[i].response + ")" ;
					        circle = "<div class='circle' style='background-color:#0f0;'></div>";
					        break;
					    case "Tenant":
					        type = "Tenant Moved";
					        circle = "<div class='circle' style='background-color:#0ff;'></div>";
					        break;
					    case "Awarded":
					    	type = key;
					    	circle = "<div class='circle' style='background-color:#8b00ff;'></div>";
					    	break;
					    case "End":
					        type = "End of Case";
					        circle = "<div class='circle' style='background-color:black;'></div>";
					        break;						    
					    default:
					        continue;
					}
					
		    		popupContent += type + ": " + feature.properties.events[i][key] + "</p>";
		    		circles += circle;
		    		
		    	}	    	
		    	
		    }
		}

		// console.log(popupContent);		    

		var noData="<p>Sorry, No data</p>";
		
		var zero=String('No data');

		//var  pic_url='images/test.jpg';
		
		//Popup info			
		var block_parcel = "B" + feature.properties.block + "_P" + feature.properties.parcel;
		var images = Array();
		
		for (var i = 0; i < image_path.length; i++){
			if (image_path[i].indexOf(block_parcel) !== -1){
				images.push(image_path[i]);
			}	
		}
		
		if(images.length >0) {
			block_parcel = "images/properties/" + images[0];
		} else {
			block_parcel = "images/default_image.jpg"; 
		}
		
		var customPopup= "<span style='float:left;width: 50%;'>"
							+"<img src="+  block_parcel  + " style='width: 100%; max-height: 80%;' />"
							+"<p>"+feature.properties.st_num+" "+feature.properties.st_name+"</p>"
						+"</span>" 
						+"<div style='float:right;width: 50%;display:inline-flex;padding-top:10px;'>"
							+"<div style='margin-left:15px;margin-right:10px;width:20px;'>"
								+circles
							+"</div>"
							+"<div style='width:calc(100% - 45px);line-height:16px;'"
								+popupContent
							+"</div>"
						+"</div>" ;

		var customOptions =
		{
			'maxWidth': 'auto',
			'className': 'map-pop-up'
		}
	
		layer.on({
	        mouseover: highlightDot,
	        mouseout: resetDotHighlight
	    });

		layer.bindPopup(customPopup,customOptions);

	}
	
	map.addLayer(poly);
		
	//database manage button
	// L.easyButton( '<strong>M</strong>', function(){
	// 	alert('For administrator only');
	// 	window.open('../phppgadmin/index.php');
	// }).addTo(map);
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
