$(document).ready(function($){

	$(".open-signup").click(function(){
		$("#login-modal").removeClass("fade").modal("hide");
	});

	$(".open-login").click(function(){
		$("#signup-modal").removeClass("fade").modal("hide");
	});

	$(function() {
	   $('.alert').delay(500).fadeIn('normal', function() {
	      $(this).delay(2500).fadeOut();
	   });
	});
});	