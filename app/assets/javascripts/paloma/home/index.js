function SetDateForSearch(targetDate) {
	var today = new Date();
	$("#today-month").html(today.getMonth()+1);
	$("#today-date").html(today.getDate());
	today.setDate(today.getDate() + targetDate);
	$("#target-month").html(today.getMonth()+1);
	$("#target-date").html(today.getDate());
	
}

function CloseJoinPopup() {
	$("#join-popup").hide();
}
function JoinConfirm() {
	if(confirm("참여하시겠습니까?")) {
		alert("Somthing to do");
	}
	CloseJoinPopup();
}
function MoveMentorDetailView(position) {
	$("#join-popup").hide();
	var detailPosition = $("#mentor-detail-wrapper").index();
	// position 보정
	if(position>=detailPosition) {
		position --;
	}
	// 디테일 뷰 맨 끝으로 초기화 -> after position의 정확성 올리기 위해
	$("#mentor-detail-wrapper").insertAfter(".mentor-item:last");
	
	console.log(position, detailPosition);
	
	var index = (Math.floor(position/6)+1)*6 - 1 ;
	console.log(index);
	
	$(".mentor-indicator.selected").hide();
	
	// 다른 아이템들 활성화/비활성화 초기화
	$(".mentor-item").each(function() {
		if(position == $(this).index()) {
			$(this).find(".mentor-indicator.disabled").hide();
			$(this).find(".mentor-indicator.selected").show();
		} else {
			$(this).find(".mentor-indicator.selected").hide();
			$(this).find(".mentor-indicator.disabled").show();
		}
		
	});
	// 선택된 아이템 활성화 효과 적용
	$(".mentor-item").eq(position).find(".mentor-indicator.selected").show();
	// 디테일 뷰 이동
	$("#mentor-detail-wrapper").insertAfter(".mentor-item:eq("+index+")");
	// 디테일 뷰 표시
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
		//date picker init
		SetDateForSearch(7);
		
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
		
		$(".mentor-category ul.category-tab li").click(function() {
			$(".mentor-category ul.category-tab li").removeClass("selected")
			$(this).addClass("selected");
		});
		
		$("#detail-close").click(function() {
			$("#join-popup").hide();
			$("#mentor-detail-wrapper").slideUp(500);
			$(".mentor-indicator.selected").hide();
			$(".mentor-indicator.disabled").hide();
		});
		$("#join-btn").click(function() {
			$("#join-popup").show();
		});
		
		$("#datepicker").change(function() {
			var today = new Date();
			var target = new Date($(this).val());
			
			var diff = Math.floor((target-today)/(24*3600*1000));
			if(diff<0) {
				alert("지난 날짜를 선택할 수 없습니다.");
				return false;
			}
			SetDateForSearch(diff);
		});
    });
  };
})();