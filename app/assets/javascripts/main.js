$(document).ready(function($){

	$(".open-signup").click(function(){
		$("#login-modal").removeClass("fade").modal("hide");
	});

	$(".open-login").click(function(){
		$("#signup-modal").removeClass("fade").modal("hide");
	});


	// (function() {
	//     $('.apply-modal').keyup(function() {

	//         var empty = false;

	//         empty = $(this).find("input").filter(function() {
	//             return this.value === "";
	//             empty = true;
	//         });

	//         if(empty.length) {
	//             console.log('empty')
	//             // $('.sub-application-btn').attr('disabled', 'disabled');
	//             $('.sub-application-btn').removeAttr('disabled');
 //           		$(this).val() == empty;
	//         }else{
	//         	console.log('filled')
	//         	$('.sub-application-btn').removeAttr('disabled');
	//         }

	//       });
	// })()

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


	// $(function () {
	//     $("#contactus-modal").submit(function (e) {
	//         e.preventDefault(); //STOP default action
	//         $.ajax({
	//             url: "/contactforms",
	//             type: "POST",
	//             data: {formData: $("#contactus-modal").serialize()},
	//             success: function (data, textStatus, jqXHR) {
	//                 console.log('ajax works')
	//             },
	//             error: function (jqXHR, textStatus, errorThrown) {
	//                 // Doing things here too
	//                 alert('error');
	//             }
	//         });
	//         return false;
	//     });
	// });

	// $('#contactus-modal').on('ajax:success', function(event, data, status, xhr) {
	// 	event.preventDefault();
	// 	$('#contactus-modal').removeClass("fade").modal("hide");
	// 	console.log('bien')
	// });

	$(function() {
	   $('.alert').delay(500).fadeIn('normal', function() {
	      $(this).delay(2500).fadeOut();
	   });
	});
});




