// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require paloma
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require jcarousellite_1.0.1.min
//= require jquery.bxslider.min
//= require bootstrap.min.js
//= require answers
//= require summernote
//= require jquery-ui-1.10.3.custom.min

$(document).ready(function() {
	// Family Site link event function
	$("#footer-familysite").bind("change", function() {
		console.log("dd");
		var anchor = $(this).find(":selected").val();
		if(anchor == "http://www.gosunchang.com/" || anchor == "http://www.refarm.org/") {
			window.open(anchor, "popupWindow", "width=600,height=600,scrollbars=yes");
		} else {
			// Do-Nothing
		}
	});
});