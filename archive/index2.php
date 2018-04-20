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
<script src="https://unpkg.com/leaflet-easybutton@2.0.0/src/easy-button.js"></script>

<!-- Data -->
<!--<script src="js/with_date.js"> </script> -->

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"> 
<link rel="stylesheet" href="css/leaflet-search.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/L.Control.SlideMenu.css">
<link rel="stylesheet" href="css/leaflet-slider.css"/>
<link rel="stylesheet" href="https://unpkg.com/leaflet-easybutton@2.0.0/src/easy-button.css">

<script>
var geojson_path = "js/with_date2.geojson";
var db_data = null;

function getdata(data){
	db_data = data;
}
   
function ajax1() {
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

$.when(ajax1()).done(function() {
// $(document).ready(function(){
	
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
		fillColor: "#f00",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	var c3 = {
		fillColor: "#ff7f00",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c4 = {
		fillColor: "#ff0",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c5 = {
		fillColor: "#0f0",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	

	var c6 = {
		fillColor: "#0ff",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	var c7 = {
		fillColor: "#8b00ff",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	var c8 = {
		fillColor: "#000000",
		color: "white",
		weight: 1,
		fillOpacity: 1
	};	
	
	

	var highlight = {
		fillColor: "#fba4f1",
		color: "#fba4f1",
		weight: 1,
		fillOpacity: 1
	};
   
	var map = L.map('map').setView([35.5861, -82.5554], 17);

	
	//loading a GeoJSON file directly from the file 
	var poly = new L.GeoJSON.AJAX(geojson_path, {
		style: c1,					
		onEachFeature: onEachFeature,
	});
	
	//console.log(db_data);
	
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
		height: '680px', 
		width: '355px'
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
	

	
	// Empty blank
	function trim(str) {
		return str.replace(/^\s+|\s+$/g,"");
	};
	 
	
	
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
    function parsePoly(feature, data) {

    	var parcel_num = feature.properties.parcel;
    	var block_num = feature.properties.block;
    	console.log(data);

    	for (var i = 0; i< data.length; i++){
    		// console.log(parseInt(data[i].block_no));
    		if (parseInt(data[i].block_no) == block_num && parseInt(data[i].parcel_no) == parcel_num){

    			var type = String(data[i].type);
    			type = type.replace(/\s+/g, '');

    			if (type) {
    				if (data[i].date){
    					feature.properties[type] = String(data[i].date);    					
    					console.log(feature.properties);
    				} 
    			} 
    		}
    	}
		
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
	var SLIDER_VALUE = 1960;
	var slider = L.control.slider(function(value) {
		SLIDER_VALUE = value;
		// Pie chart
		d3.select("#piie").remove();	
		$(".menu-year-input").html(value);	
        
		var cc1 = "#f00";
		var cc2 = "#ff7f00";		
		var cc3 = "#ff0";		
		var cc4 = "#0f0";
		var cc5 = "#0ff";
		var cc6 = "#8b00ff";
		var cc7 = "#000000";
		var cc8 = "#0000FF";
		
		
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
		var nda=0;
			
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
			nda=936-(xom+xoa+xor+xft+xro);
			dataset = [
				{ label: 'Transfer of Deed', count: xom },
				{ label: 'Offer Made', count: xoa }, 
				{ label: 'Appraisal', count: xor }, 
				{ label: 'Offer Accepted', count: xft },
				{ label: 'Tenant Moved', count: xro },
				{ label: 'Awarded', count: nda },
				{ label: 'End of Case', count: nda },
				{ label: 'No data', count: nda }

			];
			// Percentage calculation
			var total=936;
			var pom=0;
			pom=Math.floor((xom / total) * 100)
			var poa=0;
			poa=Math.floor((xoa / total) * 100)
			var por=0;
			por=Math.floor((xor / total) * 100)
			var pft=0;
			pft=Math.floor((xft / total) * 100)
			var pro=0;
			pro=Math.floor((xro / total) * 100)
			var pda=Math.floor((nda / total) * 100)
			
			// Percentage array
			var percentage=[pom,poa,por,pft,pro,pda];
			
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
		
		});
		
		$(".menu-result").hide();
		$(".menu-pie").show();
	
		

		//pie chart color
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
		var i = 1;
		// When a polygon is clicked
		function onEachFeature(feature, layer) {
	
		    if (db_data){
		    	parsePoly(feature, db_data);
		    }
		   	
		
			var popupContent = "<p>Transfer of Deed:"+feature.properties.TransferofDeed+"</p>"
					+"<p>Offer Made:"+feature.properties.OfferMade+"</p>"
					+"<p>Appraisal:"+feature.properties.Appraisal+"</p>"
					+"<p>Offer Accepted:"+feature.properties.OfferAccepted+"</p>"
					+"<p>Tenant Moved:"+feature.properties.TenantMoved+"</p>"
					+"<p>Awarded:"+feature.properties.Awarded+"</p>"
					+"<p>End of Case:"+feature.properties.EndofCase+"</p>";
			
			
			var noData="<p>Sorry, No data</p>";

			//var  pic_url='images/test.jpg';
			
			//Popup info
			var customPopup;
			//if (feature.properties.offer_made ="undefined" ){
			//customPopup= 
							//"<p>"+feature.properties.st_num+" "+feature.properties.st_name+"</p>"
							//+"<div style='float:right;width: 50%;display:inline-flex;'>"
								//+"<div style='margin-left:15px;margin-right:10px;width:20px;'>"
									//+"<div class='circle' style='background-color:yellow;'></div>"
							//+"</div>"
							//+"<div style='width:calc(100% - 45px);line-height:16px;'"
									//+noData
								//+"</div>"
							//+"</div>";
			//}
			//else {
				customPopup= "<span style='float:left;width: 50%;'>"
								+"<img src="+  feature.properties.img_path  + " style='width: 100%; max-height: 80%;' />"
								+"<p>"+feature.properties.st_num+" "+feature.properties.st_name+"</p>"
							+"</span>" 
							+"<div style='float:right;width: 50%;display:inline-flex;padding-top:10px;'>"
								+"<div style='margin-left:15px;margin-right:10px;width:20px;'>"
									+"<div class='circle' style='background-color:#f00;'></div>"
									+"<div class='circle' style='background-color:#ff7f00;'></div>"
									+"<div class='circle' style='background-color:#ff0;'></div>"
									+"<div class='circle' style='background-color:#0f0;'></div>"
									+"<div class='circle' style='background-color:#0ff;'></div>"
									+"<div class='circle' style='background-color:#8b00ff;'></div>"
									+"<div class='circle' style='background-color:black;'></div>"
								+"</div>"
								+"<div style='width:calc(100% - 45px);line-height:16px;'"
									+popupContent
								+"</div>"
							+"</div>" ;
		    //}

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
		
			//database manage button
		L.easyButton( '<strong>M</strong>', function(){
			alert('For administrator only');
			window.open('../phppgadmin/index.php');
		}).addTo(map);
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
