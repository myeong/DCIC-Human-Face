  //JavaScript & jQuery Table Pagination, Sort, & Filter
  window.onerror = function(msg, url, line) {
                 alert("An error occurred.");
                 alert("Message: " + msg);
                 alert("url" + url);
                 alert("line number" + line);
              }
//Table pagination
  function pagination() {
    $("table").each(function(){
      //Variables
      var page = 0;
      var numpage = 10;
      var $pagi = $(this);
      $pagi.bind('repaginate', function(){
        $pagi.find('tbody tr').hide().slice(page * numpage, (page + 1) * numpage).show();
      });
      $pagi.trigger('repaginate');
      var numrows = $pagi.find('tbody tr').length;
      var numpages = Math.ceil(numrows/numpage);
      var $pager = $('<div class = "pager float-md-right"></div>');
      for(var curpage = 0; curpage < numpages; curpage++){
        $('<button class="page-number"></button>').text(curpage + 1).bind('click',
        {newPage: curpage},
        function(event) {
          page = event.data['newPage'];
          console.log(page); //Prints selected page number onto the console
          $pagi.trigger('repaginate');
          $(this).addClass('active').siblings().removeClass('active');
        }).appendTo($pager).addClass('clickable');
      }
      $pager.insertBefore($pagi).find('button.page-number:first').addClass('active');
    });
  }

//Table Sort
  function sort(){
    var table, rows, switching, the_switch, dir;
    table = document.getElementById("table");
    switching = true;
    while(switching){
      switching = false;
      rows = table.rows;
      for(var i = 1; i < (rows.length - 1); i++){
        the_switch = false;
        x = rows[i].getElementsByTagName("TD")[1];
        y = rows[i].getElementsByTagName("TD")[2];
        console.log(y);
        if(x.innerHTML > y.innerHTML){
          the_switch = true;
          break;
        }
      }
      if(the_switch){
        rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
        switching = true;
        break;
      }
    }
}
//Search filter
  function filter(){
    var input, filter, table, tr, td, x, q;
      input = document.getElementById("input");
      filter = input.value;
      table = document.getElementById("table");
      tr = table.getElementsByTagName("tr");

      //Loop through all the table rows, and hide those that do not match the search query
      for(x = 0; x < tr.length; x++){
        f = tr[x].getElementsByTagName("td"); //Table filter
        if(f[1]){
          if(f[1].innerHTML.indexOf(filter) > -1 || f[2].innerHTML.indexOf(filter) > -1
              || f[3].innerHTML.indexOf(filter) > -1 || f[4].innerHTML.indexOf(filter) > -1
              || f[5].innerHTML.indexOf(filter) > -1){
            tr[x].style.display = "";
          }
          else{
            tr[x].style.display = "none";
          }
        }
        }
      }

  //Refreshes the webpage
  function refresh(){
    location.reload(); //Pagination refresh button onclick function
  } //Not intended to be loaded when the document object model is ready.

  //jQuery Code

  //Bootstrap Popover
  $(function () {
    $('[data-toggle="popover"]').popover();
  });

  $(document).ready(function(){
    pagination();
    sort();
    filter();
  }); //Waits until DOM elements are loaded and ready to execute

  //User Interface functions

  // Show/Hide Button Function
  $('#table-pagi').click(function(){
    $("table").toggle();
  });
  //Show/Hide Pagination Function
  $('#pagi').on("click", function(){
    $('#pagination').toggle();
    $('#postgres').toggle();
  });
  //Bootstrap alert
  $('.alert').alert();
