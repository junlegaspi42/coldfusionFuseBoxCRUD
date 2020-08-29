$(document).ready(function(){
	var form = $('#comment_form');

	$('#cmtsubmit').click(function(event){
		event.preventDefault();
		$.ajax({
        type:"POST",
        url:form.attr("action"),
        data:form.serialize(),
        success: function(data){
        	$("#comment_form_view").html(data);
        }
    });

	});

});

