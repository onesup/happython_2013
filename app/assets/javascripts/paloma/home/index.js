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
    });
  };
})();