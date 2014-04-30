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
//= require foundation
//= require turbolinks
//= require_tree .

$(function(){
	$(document).foundation();

	//character counter
	//pulled from "http://www.yourinspirationweb.com/en/jquery-tips-tricks-how-to-limit-characters-inside-a-textarea/"
	var characters = 140;
    $("#counter").append(characters);
    $("#switinput").keyup(function(){
        if($(this).val().length > characters){
        $(this).val($(this).val().substr(0, characters));
        }
    var remaining = characters -  $(this).val().length;
    $("#counter").html(remaining);
    if(remaining <= 10){
        $("#counter").css("color","#E60288");
        if(remaining < 0)
        	$("#postbutton").attr("disabled", "disabled");
    }
    else{
        $("#counter").css("color","#A6A6A6");
        $("#postbutton").removeAttr("disabled");
    }
    });

    $(document).scroll(function(){
    	$(function(){
			if(!($('#banner').visible())){
				$('#banner').css("position", "fixed");
				$('#banner').html("<h1 id=\"brand\">switter</h1>");
			}
			else if(!$(window).scrollTop()){
				$('#banner').css("position", "");
				$('#banner').html("<h1 id=\"brand\"><brackets>{</brackets>switter<brackets>}</brackets></h1>");
			}
		});
    });

    $('.commentinput').on('keyup', function(e) {
	  // e.which is monitoring the key pressed 
	  // and 13 is code for enter key
	  if(e.which == 13 && $.trim(this.value).length) {
	    $(this).next(".commentbutton").click(); // triggering click event on button
	  }
	});

});