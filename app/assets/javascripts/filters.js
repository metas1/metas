$(document).ready(function(){

	$(".type-filter, .pay-range, .location-filter").change(function(){
	    concatenated_string = $(".type-filter").val() + "+" + $(".range-filter").val() + "+" + $(".location-filter").val();
	    console.log($(".type-filter").val() + " " + $(".location-filter").val())

	    $("#submit-filters").val(concatenated_string);
	    // console.log($("#submit-filters").val(concatenated_string));

	    $("#temp_display").text(concatenated_string)
	})

	$("#clear-filters").click(function(){
		$(this).closest("form").find("select").val("-1");
		e.preventDefault();
		console.log("filter test")
	})

});