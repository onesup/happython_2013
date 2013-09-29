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
  var _l = _L['notices'];


  Paloma.callbacks['notices']['index'] = function(params){
	  $(document).ready(function() {
		  $(".expdable-table .row .mother").click(function() {
			  $(this).next().toggle();
			  if($(this).find(".pointer img").attr("src").indexOf('droppointer-down.png')>-1) {
			  	$(this).find(".pointer img").attr("src", '/assets/droppointer-up.png');
			  } else {
			  	$(this).find(".pointer img").attr("src", '/assets/droppointer-down.png');
			  }
			  
		  });
	  });
  };
})();