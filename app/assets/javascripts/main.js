$(document).ready(function($){

	$('.password-field > input').focus(function() {
	    $(this).attr('placeholder', '6 characters minimum')
	}).blur(function() {
	    $(this).attr('placeholder', 'Password Confirmation')
	})

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


