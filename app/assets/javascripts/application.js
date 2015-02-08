//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require twitter/bootstrap/modal  
//= require create_new_project
//= require edit_project
//= require edit_task
//= require fadeOutFlash
//= require complete_tasks
//= require task_prioritise

$(function() {
	window.showFlashMesage = function(flash_layout){
		var flash = $('.flash');
		
		flash.html(flash_layout);
		flash.fadeOut(3000, function(){
			flash.html('').show();
		});
	};
});

