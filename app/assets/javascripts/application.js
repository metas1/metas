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
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function($){

	$(".open-signup").click(function(){
		$("#login-modal").removeClass("fade").modal("hide");
	});

	$(".open-login").click(function(){
		$("#signup-modal").removeClass("fade").modal("hide");
	});


	(function() {
	    $('.apply-modal').keyup(function() {

	        var empty = false;

	        empty = $(this).find("input").filter(function() {
	            return this.value === "";
	            empty = true;
	        });

	        if(empty.length) {
	            console.log('empty')
	            // $('.sub-application-btn').attr('disabled', 'disabled');
	            $('.sub-application-btn').removeAttr('disabled');
           		$(this).val() == empty;
	        }else{
	        	console.log('filled')
	        	$('.sub-application-btn').removeAttr('disabled');
	        }

	      });
	})()

	$(".apply-modal").bind("ajax:complete", function(){

		$.ajax({
		 url:'/jobemails',     
		 type:'POST', 
		 data: {formData: $(".apply-modal").serialize()},
		 dataType: 'script',
		 success:function(data){
		 	$(".apply-modal").removeClass("fade").modal("hide");
		 	$("#appreceived-modal").modal("show");
		 	$('input[type="text"], textarea').val('');
		 	$('input[type="tel"], textarea').val('');
		 	console.log("on success");
		 },
		 error: function(){
		 	console.log("failure");
		 }

	  });

	});
});









