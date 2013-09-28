function MoveMentorDetailView(position) {
	var detailPosition = $("#mentor-detail-wrapper").index();
	if(detailPosition<=position) {
		position--;
	}
	var addon = position%6;
	var index = position+(5-addon);
	$(".mentor-indicator.selected").hide();
	
	$(".mentor-item").each(function() {
		if(position == $(this).index()) {
			$(this).find(".mentor-indicator.disabled").hide();
			$(this).find(".mentor-indicator.selected").show();
		} else {
			$(this).find(".mentor-indicator.selected").hide();
			$(this).find(".mentor-indicator.disabled").show();
		}
		
	});
	$(".mentor-item").eq(position).find(".mentor-indicator.selected").show();
	$("#mentor-detail-wrapper").insertAfter(".mentor-item:eq("+index+")");
	$("#mentor-detail-wrapper").slideDown(1000);
}
(function(){
  // You access variables from before/around filters from _x object.
  // You can also share variables to after/around filters through _x object.
  var _x = Paloma.variableContainer;

  // We are using _L as an alias for the locals container.
  // Use either of the two to access locals from other scopes.
  //
  // Example:
  // _L.otherController.localVariable = 100;
  var _L = Paloma.locals;

  // Access locals for the current scope through the _l object.
  //
  // Example:
  // _l.localMethod(); 
  var _l = _L['home'];




  Paloma.callbacks['home']['index'] = function(params){
    $(document).ready(function(){
    	$(".bxslider").bxSlider({
    		mode : 'fade',
    		captions: true,
    		auto : true,
    		controls:false
    	});
	
    	var ticker = function()
    	{
    		setTimeout(function(){
    			$('.notice-contents').animate( {marginTop: '-46px'}, 800, function()
    			{
    				$('.notice-contents li:first').detach().appendTo('ul.notice-contents');	
    				$('ul.notice-contents').css({'margin-top':'0px'});
    			});
    			ticker();
    		}, 4000);
    	};
    	ticker();
		
		$(".mentor-item").mouseenter(function() {
			$(".mentor-summary").each(function() {
				$(this).hide();
			});
			$(this).find(".mentor-summary").show();
		});
		$(".mentor-item").mouseleave(function() {
			$(".mentor-summary").each(function() {
				$(this).hide();
			});
		});
		
		$(".menu-item").click(function() {
			var imagesrc = $(this).children().attr("src");
			var regex = /assets\/search_category_[0-4]_over\.png/;
			if(regex.test(imagesrc)) {
				$(this).children().attr("src", imagesrc.replace("_over.png", ".png"));
			} else {
				$(this).children().attr("src", imagesrc.replace(".png", "_over.png"));
			}
		});
		
		$(".menu-item-all").click(function() {
			$(".menu-item").each(function() {
				var imagesrc = $(this).children().attr("src");
				var regex = /assets\/search_category_[0-4]_over\.png/;
				if(!regex.test(imagesrc)) {
					$(this).children().attr("src", imagesrc.replace(".png", "_over.png"));
				}
			});
		});
		
		$(".mentor-item").click(function() {
			$(this).find(".mentor-summary").show();
			$("#mentor-detail-wrapper").slideUp(500);
			setTimeout("MoveMentorDetailView("+$(this).index()+")", 510);
		}); 
    });
  };
})();