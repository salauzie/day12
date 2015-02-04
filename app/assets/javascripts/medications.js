$(document).ready( function(){

$( ".form-control").blur(function() {
	console.log( $(this).val());
	if ($('.form-control').val().length > 0){
			$('.button').removeAttr("disabled");
	}
	else {
		$('.button').attr("disabled");
	}
});
});