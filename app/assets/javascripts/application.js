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
//= require jquery.sticky
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $("#sticker").sticky({topSpacing:0})
	$('#save').on('click', function(e) {
		console.log($('form').serialize());
  		var formData = $('form').serialize();
  		$.ajax('/juniors/create', {
  			type: 'POST',
  			dataType: "JSON",
    		data: formData,
    		success:function(data, textStatus, jqXHR) 
        	{
        		alert('success');
            	//data: return data from server
        	},
        	error: function(jqXHR, textStatus, errorThrown) 
        	{
        		alert('failure');
            	//if fails      
        	}
  		})
  		/*
  		$.ajax({
    		type: 'POST',
    		url: '#new',
    		data: formData,
    		dataType: 'JSON',
    		success:function(data, textStatus, jqXHR) 
        	{
        		alert('success');
            	//data: return data from server
        	},
        	error: function(jqXHR, textStatus, errorThrown) 
        	{
        		alert('failure');
            	//if fails      
        	}
  		})
*/
  		e.preventDefault();
  		return false;
	});
});



