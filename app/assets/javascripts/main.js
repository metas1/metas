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

	// To Disable Submit Button By Default
	// $("input[type=submit]").attr('disabled','disabled');
	// When User Fills Out Form Completely
	$("form").keyup(function(){
	$("input[type=submit]").removeAttr('disabled');
	});

	$(".apply-submit").attr('disabled', 'disabled');
	$("form").keyup(function() {
		// To Disable Submit Button
		$("#submit").attr('disabled', 'disabled');
		// Validating Fields
		var name = $("#phonenumber").val();
		var info = $("#additional_info").val();
		if (!(name == "" || info == "")) {
			if ((info)) {
			// To Enable Submit Button
			$(".apply-submit").removeAttr('disabled');
			}
		}
	});
	// On Click Of Submit Button
	$(".apply-submit").click(function() {
		$(".apply-modal").removeClass("fade").modal("hide");
		$("#appreceived-modal").modal("show");
		});

	$('.apply-modal').submit(function() {
	  // Disable on first click
	  $("input[type=submit]").attr('disabled','disabled');
	});
});


