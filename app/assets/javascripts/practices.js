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
      path = window.location.pathname
      hostname = window.location.origin
      $.ajax({
          type: "POST",
          url: hostname + path + '/practice_sort',
          data: { order: updated_order }
      });
  });
}


/**
 * if using turbolinks
 */
$(document).on('ready turbolinks:load page:load', ready);

$(document).on('click', '.panel-heading span.clickable', function(e){
    var $this = $(this);
	if($this.hasClass('panel-collapsed')) {
    $this.parents('.panel').find('.panel-body').slideDown();
    $this.removeClass('panel-collapsed');
    $this.removeClass('collapse');
    $this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
	} else {
		$this.parents('.panel').find('.panel-body').slideUp();
		$this.addClass('panel-collapsed');
		$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
	}
})
