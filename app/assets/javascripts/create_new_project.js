$(function() {
	$('#new_project_submit').on("click", function(){
		var project_title;
		project_title = $('#new_project_title').val();




		$.ajax({
      type: "POST",
      url: "/projects",
      data: { title: project_title }
    });

		$('#myModal').modal('hide')


	});
});