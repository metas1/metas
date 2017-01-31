$(document).ready(function(){
	var options = $('.states-filter');

	options.change(function(){
	    // $(this) references the current <select>
	    var stateOption = $(this).val();
	    console.log(stateOption);
	    // console.log($(this).val());

	    $('#submit-filters').click(function(){
	       $(this).val(stateOption)
	       console.log(this.val(stateOption) + " " + "state");
	    })
	})
	// var submitDefaultVal = $('#submit-filters')
	// console.log(submitDefaultVal.val() + " " + "default is submit");
});