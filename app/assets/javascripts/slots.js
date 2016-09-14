var ready, set_positions;

set_positions = function(){
    // loop through and give each task a data-pos
    // attribute that holds its position in the DOM
    $('.panel.panel-default').each(function(i){
        $(this).attr("data-pos",i+1);
    });
}

ready = function(){
    // call sortable on our div with the sortable class
    sortable('.sortable');
    
    // after the order changes
    $(".sortable").on('sortupdate', function(e, ui) {
      // array to store new order
      updated_order = []
      // set the updated positions
      set_positions();

      // populate the updated_order array with the new task positions
      $('.panel.panel-default').each(function(i){
          updated_order.push({ id: $(this).data("id"), position: i+1 });
      });

      // send the updated order via ajax
      path = window.location.pathname.split("/").slice(0,-1).join("/")
      hostname = window.location.origin
      $.ajax({
          type: "POST",
          url: hostname + path + '/practice_sort',
          data: { order: updated_order }
      });
  });
}

$(document).ready(ready);
/**
 * if using turbolinks
 */
$(document).on('page:load', ready);
