$(document).ready(function(){

	$(".type-filter, .range-filter, .location-filter").change(function(){
	    concatenated_string = $(".type-filter").val() + "+" + $(".range-filter").val() + "+" + $(".location-filter").val();

	    $("#submit-filters").val(concatenated_string);
	   		console.log(concatenated_string)	  
	})

	$("#clear-filters").click(function(){
		$(this).closest("form").find("select").val("-1");
		// e.preventDefault();
		console.log("filters clear")
	})

});