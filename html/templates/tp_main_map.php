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
<script src="js/jquery.firstVisitPopup.js"></script>
<script src="js/jquery.firstVisitPopup.min.js"></script>
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
$(function () {
		$('#my-welcome-message').firstVisitPopup({
				cookieName : 'homepage'
		});
	});
</script>

<script>
var geojson_path = "js/with_date.geojson";
var db_data = null;
var img_path = [];

function getdata(data){
  db_data = data;
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
    	$.each(data, function(i, value){
    		if (value.image_path != null){
	    		if (!(value.block_no in img_path)){
	    			img_path[value.block_no] = [];
	    		}
	    		if (!(value.parcel_no in img_path[value.block_no])){
	    			img_path[value.block_no][value.parcel_no] = [];
	    		}
	    		if (img_path[value.block_no][value.parcel_no].indexOf(value.image_path) == -1 && 
	    			(typeof(value.image_path) != "undefined")){
	    			img_path[value.block_no][value.parcel_no].push(value.image_path);
	    		}
    		}
    	});
    	// console.log(img_path);
    	getdata(data);
    });
}

$.when(load_data()).done(function() {

	// Click to close the popup
	$(document).click(function(e){                            
	    $("#my-welcome-message").hide(); 
	});  

	var delete_cookie = function(name) {
	    document.cookie = name + '=;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	};  
	delete_cookie('homepage');


	//Color 
	var hoverColor = {
	    fillColor:"#feebe2",
	    color: "#FF69B4",
	    weight: 4
	};	
		

	var highlight = {
		fillColor: "#F6931F",
		color: "#d94801",
		weight: 1,
		fillOpacity: 1
	};
			
	var c1 = {
		fillColor: "#ffffcc",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};		
	
	var c2 = {
		fillColor: "#9ecae1",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c3 = {
		fillColor: "#c7e9c0",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};

	var c4 = {
		fillColor: "#74c476",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c5 = {
		fillColor: "#4292c6",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c6 = {
		fillColor: "#238b45",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var c7 = {
		fillColor: "#08589e",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	

	var c8 = {
		fillColor: "#dadaeb",
		color: "black",
		weight: 1,
		fillOpacity: 0.7
	};	
	
	var mark="Offer Made";
	
    // Disable topleft zoom control
	var map = L.map('map',{zoomControl: false}).setView([35.5811, -82.5560], 16);

	//loading a GeoJSON file directly from the file 
	var poly = new L.GeoJSON.AJAX(geojson_path, {
		style: c8,					
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
		height: '100%', 
		width: '300px'
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
	user_year_input.innerHTML = "1950";
	
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
	search_input_1.placeholder = 'Person Name';
	var search_input_2 = L.DomUtil.create('input', 'menu-search-input', search_box);
	search_input_2.id = 'input-2';
	search_input_2.type = 'text';
	search_input_2.placeholder = 'Street Name';
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
            		$(".menu-chart").hide();
            		$(".line-chart").hide();
            		$(".chart").hide();
            		$(".chart_result").hide();
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
		var index = 0;
		for (var i = 0; i < data.length; i++) {				
			var snum = data[i].st_num.trim();
			var sname = data[i].st_name.trim();

			if (snum == "" && sname == "") continue;
			index = index+1;
			frag += "<div class=\"menu-result-row\" title=\"" + data[i].parcel_no + "," + data[i].block_no +"\">";
			frag += String(index) + ": " + snum + " " + sname;
			frag += "</div>";
		}
		$(".menu-result").append(frag);
		$(".menu-result-row").unbind('click');
		$(".menu-result-row").on('click', function() {
			moveToPoly(this.title);
		})
		$(".menu-pie").hide();
        $(".menu-chart").hide();
        $(".line-chart").hide();
        $(".chart").hide();
        $(".chart_result").hide();
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

    //Line chart
	var chart_div = L.DomUtil.create('div','menu-chart');
	mapbuttons_div.appendChild(chart_div);

	var chart_text = L.DomUtil.create('p', 'menu-chart-text', chart_div);
	chart_text.innerHTML = "Line Chart for the activity: "+mark;
	var chart = L.DomUtil.create('div', 'line-chart');
	var chart_result = L.DomUtil.create('div', 'chart_result');
	
	mapbuttons_div.appendChild(chart);
    mapbuttons_div.appendChild(chart_result);


	// Loading the Asheville Raster Layer (tilemap)
	var asheville = L.tileLayer('asheville_tiles/{z}/{x}/{y}.png', {
		tms: true, 
		opacity: 0.8, 
		attribution: ""
	});
	map.addLayer(asheville);
	
	// Year slider
	var SLIDER_VALUE = String(1950);

	// console.log(db_data);
	// When slider value is changed
	var slider = L.control.slider(function(value,feature) {		
		SLIDER_VALUE = String(value);
         
		// Pie chart
		d3.select("#piie").remove();	

		
		// Set the year following the slidebar value.
		$(".menu-year-input").html(value);	
        $(".menu-pie").show();
        $(".menu-chart").show();
        $(".line-chart").show();
        $(".chart").show();
        $(".chart_result").show();
  		$(".menu-result").hide();

		var cc1 = "#ffffcc";
		var cc2 = "#9ecae1";
		var cc3 = "#c7e9c0";				
		var cc4 = "#74c476";
		var cc5 = "#4292c6";
		var cc6 = "#238b45";
		var cc7 = "#08589e";
		var cc8 = "#dadaeb";
	
		// seems like it's possible to calculate the number of layers by 
		// looping though each layer rather than loading the JSON file one more 
		// time... need to see. If so, possible to shrink the code. Not urgent(Myeong)	

		// d3.select("#piie").remove();
		
		var type_count = Array();

		type_count["offer"] = 0;
		type_count["appraisal"] = 0;
		type_count["decision"] = 0;
		type_count["tenant"] = 0;
		type_count["awarded"] = 0;
		type_count["transfer"] = 0;
		type_count["end"] = 0;
		type_count["no_data"] = 0;
         
		


		for (var i = 0; i < db_data.length; i++) {
			name=String(db_data[i].type);
			name=name.split(" ")[0];
			year= db_data[i].date.split("-")[0];

			if (value >= year){
				switch (name){
					case "End":
						type_count["end"] += 1;						
					break;
					case "Transfer":
						type_count["transfer"] += 1;						
					break;
					case "Awarded":
						type_count["awarded"] += 1;						
					break;
					case "Tenant":
						type_count["tenant"] += 1;						
					break;
					case "Decision":
						type_count["decision"] += 1;
					break;
					case "Appraisal":
						type_count["appraisal"] += 1;						
					break;
					case "Offer":
						type_count["offer"] += 1;						
					break;
				}
			}

		}		


		//For line chart
		//Remove duplicate parcels
		function removeDuplicateUsingSet(arr){
    		let unique_array = Array.from(new Set(arr))
    		return unique_array
		};

       
     	var parcel_array = Array();
        var latest_status = Array();
        var status_count =0;


		for (var i = 0; i < db_data.length; i++) {
		
			parcel_array[i] = db_data[i].parcel_no+"-"+db_data[i].block_no;

		}
        
		parcel_array = removeDuplicateUsingSet(parcel_array);	

		//Find the ativity name and the related year. For each year, one parcel only has one activity (the latest activity status), 
		for (var j = 0; j < parcel_array.length; j++) {	
			var parcel_number = parcel_array[j].split("-")[0];
			var block_number = parcel_array[j].split("-")[1];


			for (var c=0; c < db_data.length; c++ ) {
				year= db_data[c].date.split("-")[0];
				name=String(db_data[c].type);
				name=name.split(" ")[0];

				if (db_data[c].parcel_no == parcel_number && db_data[c].block_no == block_number && value > year) {
					
                    latest_status[status_count]=name+"-"+year+"-"+parcel_number+"-"+block_number;
                    status_count = status_count+1;
					//console.log(name + " " + year + " " + db_data[c].parcel_no + " "+  db_data[c].block_no);

				}
			}
		}
        

        //For each parcel, to remove the duplicate activities which waere happened in a same year. 
        var latest_status_cleaned = Array();

        latest_status_cleaned = removeDuplicateUsingSet(latest_status);

        var appraisal_dat = [];	
        var appraisal_count = 0;				
		var offermade_dat = [];
		var offermade_count = 0;			
		var decision_dat = [];
		var decision_count = 0;			
		var award_dat = [];	
		var award_count = 0;		
		var tenant_dat = [];
		var tenant_count = 0;				
		var transferofdeed_dat = [];
		var transferofdeed_count = 0;
		var end_dat = [];	
		var end_count = 0;		


        for (var i=0; i<latest_status_cleaned.length; i++){

	        var activity_name = latest_status_cleaned[i].split("-")[0];

	        var year = latest_status_cleaned[i].split("-")[1];


		       switch (activity_name) {

		       		case "End":
		        		end_dat[transferofdeed_count]=year;
		        		end_count += 1;						
					break;
					case "Transfer":
		        		transferofdeed_dat[transferofdeed_count]=year;
		        		transferofdeed_count += 1;							
					break;
					case "Awarded":
		        		award_dat[award_count]=year;
		        		award_count += 1;					
					break;
					case "Tenant":
		        		tenant_dat[tenant_count]=year;
		        		tenant_count += 1;						
					break;
					case "Decision":
		        		decision_dat[decision_count]=year;
		        		decision_count += 1;	
					break;
					case "Appraisal":
		        		appraisal_dat[appraisal_count]=year;
		        		appraisal_count += 1;						
					break;
					case "Offer":
		        		offermade_dat[offermade_count]=year;
		        		offermade_count += 1;							
					break;

		       }
		        	
		   
        }


       
		var total = 936*7;

		type_count["no_data"] = total - latest_status.length;

		var dataset = [			
			{ label: 'Offer Made', count: type_count["offer"] }, 
			{ label: 'Appraisal', count: type_count["appraisal"] }, 
			{ label: 'Decision for Offer', count: type_count["decision"] },
			{ label: 'Tenant Moved', count: type_count["tenant"] },
			{ label: 'Awarded', count: type_count["awarded"] },
			{ label: 'Transfer of Deed', count: type_count["transfer"] },
			{ label: 'End of Case', count: type_count["end"] },
			{ label: 'No Activity/Data', count: type_count["no_data"] }
		];


		for (var key in type_count){
			type_count[key] = Math.round((type_count[key] / total) * 100);
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
 

		// New Pie chart (clickable)
		var width = 400;
		var height = 395;
		var radius = Math.min(width, height) / 2;
		var donutWidth = 85;
		var legendRectSize = 20;       
		var legendSpacing = 3; 
		var color = d3.scale.ordinal().range([cc1,cc2,cc3,cc4,cc5,cc6,cc7,cc8]);
        var arcOver = d3.svg.arc().outerRadius(radius+0.5).innerRadius(radius-70);
		var svg = d3.select('.menu-pie')
			.append("svg:svg")
			.attr("id", "piie")
			.attr("preserveAspectRatio", "xMidYMid meet")
        	.attr("viewBox", "0 0 410 400")
			.append('g')
			.attr('transform', 'translate(' + (width / 2) + 
				',' + (height / 2) + ')');
	
		var arc=d3.svg.arc()
			.outerRadius(radius-30)
			.innerRadius(radius - donutWidth+16);

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
      

        path.on("mouseenter", function (d) {
        d3.select(this)
            .attr("stroke", "white")
            .transition()
            .duration(200)
            .attr("d", arcOver)
            .attr("stroke-width", 1);
    	});
     	
     	path.on("mouseleave", function (d) {
         	d3.select(this).transition()
            .duration(200)
            .attr("d", arc)
            .attr("stroke", "none");
     	});

     	path.on("click", function (d,i) {
            
     		svg.selectAll('path')
     		.attr('fill', function(d, i) { 
				return color(d.data.label);
			})
			.style('opacity', 1);

          
            // Click a part on the pie chart
			d3.select(this)
			.transition()
			.attr("stroke", "black")
			.attr("stroke-width", 2)
			.duration(350)
			.attr("fill","#F6931F")  //orange
			.style("opacity", 1);
            
     	   	mark=d.data.label;

     	   	if (mark == 'No Activity/Data') {
     	   		 d3.select("#chart").remove();
     	   		$(".menu-chart-text").hide();
     	   		$(".chart").hide();
     	   		$(".chart_result").hide();

     	   	} else {	
               	linechart();
               	chart_text.innerHTML = "Line Chart for the activity: "+mark;
     	   	}


        });
	
		var legend = svg.selectAll('.legend')                     
			.data(color.domain())                                   
			.enter()                                                
			.append('g')                                            
			.attr('class', 'legend')
			.attr('transform', function(d, i) {                     
				var height = legendRectSize + legendSpacing;         
				var offset =  height * color.domain().length / 2;     
				//leftright
				var horz = -3.5 * legendRectSize-11;  
				//updown                    
				var vert = i * height - offset+2;                       
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
			.style('font-size', '15px')						
			.text(function(d,i) { return d+":"+ percentage[i]+"%"; });                     	
                    	
	//Line Chart 
        function arrayElemCount(arrs){
	    	var newArrs = [];
	     	if(arrs.length > 0) {
	        	for(var i = 0,ilen = arrs.length; i < ilen; i+=1) {
	            	var temp = arrs[i];
	            	var count = 0;
	            	for(var j = 0,jlen = arrs.length; j < jlen; j+=1) {
	               		if(arrs[j] == temp) {
	                    		count++;
	                    		arrs[j] = -1;
	                 	}
	           		}
	           		if (temp != -1){
	            	newArrs.push(temp+"-"+count);}
	       		}
	     	}
	     	return newArrs;
		}

		appraisal_dat = arrayElemCount(appraisal_dat);
		offermade_dat = arrayElemCount(offermade_dat);
		decision_dat = arrayElemCount(decision_dat);
		award_dat = arrayElemCount(award_dat);
		tenant_dat = arrayElemCount(tenant_dat);
		transferofdeed_dat = arrayElemCount(transferofdeed_dat);
		end_count = arrayElemCount(end_count);
		

		//Get data from begining to the selectd year	
		function line_chart_template(arras) {
			
			var total =0;
			var template=[];
			var activity_year;
			var activity_count;
			var sum=1;

			for (var j=0; j<arras.length;j++){

						activity_count=parseInt(arras[j].split("-")[1]);
						sum += activity_count;}

			for (var i=1950; i<=1978; i++){
			
				if (arras.length>0){

					for (var j=0; j<arras.length;j++){

						activity_year=arras[j].split("-")[0];
						activity_count=parseInt(arras[j].split("-")[1]);

						if (i==activity_year){
							temp_value = activity_count;
							total += temp_value;
						}

					}
	  
				  	 template.push({
    					x: parseInt(i-1900),
    					y: Number(total/(sum-1)).toFixed(2)
					});


				}
				else {
						temp_value=0;
						sum=1;
						total += temp_value;

					 	template.push({
    						x: parseInt(i-1900),
    						y: Number((total/sum)).toFixed(2)
						});
				}		 
	            
	        
			}

			return template;
		}

		// /Draw the line chart
    	function linechart() {          
    	    d3.select("#chart").remove();
    	    $(".menu-chart-text").show();
				$(".chart").show();
     	   	$(".chart_result").show();

     		
     		var height = 300;
			var width = height * 1.3;
     		
            var padding = { top: 30, right: 30, bottom: 20, left: 30 };
            var main = d3.select('.line-chart')
			.append("svg")
			.attr("id", "chart")
			.attr("preserveAspectRatio", "xMidYMid meet")
        	.attr("viewBox", "0 0 430 300")
			.append('g')
			.attr('transform', "translate(" + padding.top + ',' + padding.left + ')');



            var dataset = Array();
            var final_data = Array();
            var dataset_leng=0;

            dataset_leng=SLIDER_VALUE-1950+1;
          
            var choosed;

            if (mark == "Offer Made" || mark == "No Activity/Data") {
            	choosed=line_chart_template(offermade_dat);
            } else {
            	switch (mark){
                    case "Appraisal":
						choosed=line_chart_template(appraisal_dat);						
						break;
					case "Decision for Offer":
						choosed=line_chart_template(decision_dat);			
						break;
					case "Tenant Moved":
						choosed=line_chart_template(tenant_dat);				
						break;
					case "Awarded":
						choosed=line_chart_template(award_dat);			
						break;
					case "Transfer of Deed":
						choosed=line_chart_template(transferofdeed_dat);					
						break;
					case "End of Case":
						choosed=line_chart_template(end_count);			
						break;
            	}

            };

            for (var cc=0;cc<dataset_leng;cc++){
            	dataset[cc]=choosed[cc];
            };

            var xScale = d3.scale.linear()
                    .domain(d3.extent(dataset, function(d) {
                        return d.x;
                    }))
                    .range([0, (width - padding.left - padding.right)]);
            var yScale = d3.scale.linear()
                    .domain([0,1])
                    .range([height - padding.top - padding.bottom, 0]);
            var xAxis = d3.svg.axis()
                    .scale(xScale)
                    .tickFormat(d3.format("d"))
                    .orient('bottom');
            var yAxis = d3.svg.axis()
                    .scale(yScale)
                    .orient('left');
            main.append('g')
                    .attr('class', 'axis')
                    .attr('transform', 'translate(0,' + (height - padding.top - padding.bottom) + ')')
                    .call(xAxis);
            main.append('g')
                    .attr('class', 'axis')
                    .call(yAxis);
            	main.append("text")
			.attr("class", "x label")
			.attr('transform', 'translate('+(width*0.86) +',' + (height*0.85) + ')  ')
			.text("Year")
			.attr('fill', 'white');

			 main.append("text")
			.attr("class", "y label")
			.attr('transform', 'translate(-20,' +  '-10)  ')
			.text("Percentage")
			.attr('fill', 'white');
			
            var line = d3.svg.line()
                    .x(function(d) {
                        return xScale(d.x)
                    })
                    .y(function(d) {
                        return yScale(d.y);
                    })
                    .interpolate('linear');
            main.append('path')
                    .attr('class', 'line')
                    .attr('d', line(dataset));
            
           	var tooltip = d3.select('.chart_result');

            main.selectAll('circle')
                    .data(dataset)
                    .enter()
                    .append('circle')
                    .attr('cx', function(d) {
                        return xScale(d.x);
                    })
                    .attr('cy', function(d) {
                        return yScale(d.y);
                    })
                    .attr('r', 7)
                    .attr('fill', function(d, i) {
                        return getColor(i);
                    })
                     .on('mouseover', function(d) {
      					tooltip.transition()
          			    .duration(300)
           				.style("opacity", .9);
      					tooltip.html("In Year 19"+d.x+", "+ (d.y*100).toFixed(2) +"% of the activity was done.")
  					})
  					.on('mouseout', function(d) {
      					tooltip.transition()
           				.duration(500)
           				.style("opacity", 0);
  					});
  				
  				function getColor() {
           			 var palette = "";

	                	switch (mark){
	                    	case "Offer Made":
								palette=cc1;						
								break;
	                    	case "Appraisal":
								palette=cc2;						
								break;
							case "Decision for Offer":
								palette=cc3;			
								break;
							case "Tenant Moved":
								palette=cc4;				
								break;
							case "Awarded":
								palette=cc5;			
								break;
							case "Transfer of Deed":
								palette=cc6;					
								break;
							case "End of Case":
								palette=cc7;			
								break;

                		};
            		return palette;
        		} 
    };

    linechart();

		//poly color
		poly.eachLayer(function(layer) {
			SLIDER_VALUE=parseInt(SLIDER_VALUE);

			var properties = layer.feature.properties;				

			if (properties.events == "No data"){
				layer.setStyle(c8);
			} 
			else {
				var key = "";
				var year = 0;				
				var found = false;

				for (var i=0; i<properties.events.length; i++) {
					for (var k in properties.events[i]){
						year = parseInt(properties.events[i][k].split("-")[0]);
						if (SLIDER_VALUE > year){
							key = k;
							found=true;	
							break;
						}
					}					
				}
				if (!found){
					layer.setStyle(c8);
				} else {
					switch (key){

						case "Offer":
							layer.setStyle(c1);						
							break;
						case "Appraisal":
							layer.setStyle(c2);
							break;
						case "Decision":
							layer.setStyle(c3);
							break;
						case "Tenant":
							layer.setStyle(c4);
							break;
						case "Awarded":
							layer.setStyle(c5);
							break;
						case "Transfer":
							layer.setStyle(c6);
							break;
						case "End":
							layer.setStyle(c7);
							break;
					}
				}

			}	
		});	

	}, {
		max: 1978,
		min: 1950,
		value: 1950,
		step:1,
		size: '250px',
		orientation:'horizontal',
		id: 'slider',
		collapsed: false,
		position: "bottomleft",
		syncSlider: true,
		increment: true
	}).addTo(map); 

    // Zoom control
	L.control.zoom({
     		position:'bottomleft'
		}).addTo(map);

	// Mouse track
	function highlightDot(e){
		var layer = e.target;
		layer.setStyle(hoverColor);
	}

	function resetDotHighlight(e){
		var current_year=parseInt(SLIDER_VALUE);
		var layer = e.target;
		var properties = layer.feature.properties;

	 	if ( properties.events == "No data"){
			layer.setStyle(c8);
		}
		else if (current_year==1950){
             layer.setStyle(c8);
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
				layer.setStyle(c8);
			} else {
				switch (key){
					case "Offer":
							layer.setStyle(c1);						
							break;
						case "Appraisal":
							layer.setStyle(c2);
							break;
						case "Decision":
							layer.setStyle(c3);
							break;
						case "Tenant":
							layer.setStyle(c4);
							break;
						case "Awarded":
							layer.setStyle(c5);
							break;
						case "Transfer":
							layer.setStyle(c6);
							break;
						case "End":
							layer.setStyle(c7);
							break;
					// default:
					// 	layer.setStyle(c1);
					
				}
			}

		}
    
	}

	function get_people_names(block, parcel) {
	    return $.ajax({
	        type:"GET",
	        async:true,
	        url:"get.php",
	        dataType:'json',
	        data: {
            	action: 'owner',
            	parcel: parcel,
            	block: block
            },
	        error: function(err) {            	
            }
        }).done(function(data){   
        	$("div.people").empty();  
        	var names = "";
        	var role = "";

        	for (var i=0; i<data.length; i++){
        		if (data[i].name==null || data[i].role==null) continue;
        		if (data[i].name.trim()=="Redevelopment Commission of the City") continue;

        		if (role != data[i].role){
        			names += "<div class='role'>" +data[i].role+ "</div>";
        			role = data[i].role;
        		}

        		names += "<div class='name'>" + data[i].name + "</div>";
        	}        	
        	$("div.people").html(names);
        	$("div.people").show();
        });
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

			    	
					var cc1 = "#ffffcc";
					var cc2 = "#9ecae1";
					var cc3 = "#c7e9c0";				
					var cc4 = "#74c476";
					var cc5 = "#4292c6";
					var cc6 = "#238b45";
					var cc7 = "#08589e";

			    	switch(key) {
					    case "Transfer":
					        type = "Transfer of Deed";
					        circle = "<div class='circle' style='background-color:#238b45;'></div>";
					        break;
					    case "Offer":
					        type = "Offer Made";
					        circle = "<div class='circle' style='background-color:#ffffcc;'></div>";
					        break;
					    case "Appraisal":
					    	type = key;
					        circle = "<div class='circle' style='background-color:#9ecae1;'></div>";
					        break;
					    case "Decision":
					        type = "Decision for the Offer (" + feature.properties.events[i].response + ")" ;
					        circle = "<div class='circle' style='background-color:#c7e9c0;'></div>";
					        break;
					    case "Tenant":
					        type = "Tenant Moved";
					        circle = "<div class='circle' style='background-color:#74c476;'></div>";
					        break;
					    case "Awarded":
					    	type = key;
					    	circle = "<div class='circle' style='background-color:#4292c6;'></div>";
					    	break;
					    case "End":
					        type = "End of Case";
					        circle = "<div class='circle' style='background-color:08589e;'></div>";
					        break;						    
					    default:
					        continue;
					}
					
		    		popupContent += type + ": <span class='date-list'>" + feature.properties.events[i][key] + "</span></p>";
		    		circles += circle;
		    		
		    	}	    	
		    	
		    }
		}
		

		var parcel_num = feature.properties.parcel;
    	var block_num = feature.properties.block;
    	
    	layer.on('click', function (e) {
	      // e = event
	       get_people_names (block_num, parcel_num);
	      // You can make your ajax call declaration here
	      //$.ajax(... 
	    });

    	// need to check on this (performance)
   		get_people_names (block_num, parcel_num);



		var noData="<p>Sorry, No data</p>";		
		var zero=String('No data');
				
		//Popup info			
		var block_parcel = null;
		
		
		if( !(img_path[block_num]) || !(img_path[block_num][parcel_num]) 
			|| img_path[block_num][parcel_num].length == 0) {
			block_parcel = "images/default_image.jpg";		 		
		} else {
			block_parcel = img_path[block_num][parcel_num][0];
		}
		var address = (feature.properties.st_num == null ? "" : feature.properties.st_num) + " "+
					(feature.properties.st_name == null ? "" : feature.properties.st_name);
		
		var container = $('<div />');
		container.on('click', '.img-click', function() {				
		    $(".img-cont").html("<img src='" + $(this)[0].currentSrc + "' />");
		});
		var customPopup= "<div class='popup-title'>" +"<p>"+address+"</p></div>"  						
						+"<div class='popup-table'>"
							+"<div class='img-cont'>"
								+"<img src='"+  block_parcel  + "' />"
								
							+"</div>" 
							+"<div class='date-cont'style='width: 40%;display:inline-flex;padding-top:10px;height:250px;'>"
								+"<div style='margin-left:15px;margin-right:10px;width:20px;'>"
									+circles
								+"</div>"
								+"<div style='width:100%;line-height:16px;'"
									+popupContent
								+"</div>"
							+"</div>"
							+"<div class='people' style='width:20%;'></div>" 
						+"</div>"
						+"<div class='thumb-images'>";
		if (block_num in img_path && parcel_num in img_path[block_num]){
			for (var i = 0; i<img_path[block_num][parcel_num].length; i++){			
			customPopup += "<img class='img-click' src='" + img_path[block_num][parcel_num][i] + "'/>";
			}
		}	
		// if (img_path[value.block_no][value.parcel_no] != null){
		// 		for (var i = 0; i<img_path[value.block_no][value.parcel_no].length; i++){			
		// 			console.log(value.block_no + " " + value.parcel_no);
		// 			console.log(img_path[value.block_no][value.parcel_no][i]);
		// 			console.log();
		// 		}
		// 	}
		
		customPopup += "</div>";
		
		container.html(customPopup);
		var customOptions =
		{
			'maxWidth': 'auto',
			'className': 'map-pop-up'
		}
	
		layer.on({
	        mouseover: highlightDot,
	        mouseout: resetDotHighlight
	    });
		layer.bindPopup(container[0],customOptions);		
			
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
	<div id="my-welcome-message">
			<img src="images/guide.png">
	</div>

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
