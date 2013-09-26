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