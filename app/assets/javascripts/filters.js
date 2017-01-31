$(document).ready(function(){

	$(".type-filter, .location-filter").change(function(){
	    concatenated_string = $(".type-filter").val() + "+" + $(".location-filter").val();
	    console.log($(".type-filter").val() + " " + $(".location-filter").val())

	    $("#submit-filters").val(concatenated_string);
	    // console.log($("#submit-filters").val(concatenated_string));

	    $("#temp_display").text(concatenated_string)
	})

});