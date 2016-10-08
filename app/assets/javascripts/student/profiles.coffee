# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(".edit-profile").click ->
	$(".profile-text").addClass("hide")
	$(".profile-input").removeClass("hide")

$(".cancel-profile").click ->	
	$(".profile-input").addClass("hide")
	$(".profile-text").removeClass("hide")