# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
sendMessage = () ->
	$(".sendMessageForm :input").prop("disabled", true);
	messagePost = $("#messagePost")						
	msgError = $("#message_err")
	messageRId = $("#mid").val()
	type = $("#msgtype").val()
	messagePostVal = messagePost.val()

	msgError.addClass("hide")
	messagePost.val("")
	if messagePostVal is ""
		msgError.html("Message Field is required.");
		msgError.removeClass("hide");
		$(".sendMessageForm :input").prop("disabled", false);
		return false;

	dataPost = {
		messageRId: messageRId,
		type: type,
		message: messagePostVal
	};

	$.ajax "/messages",
		type: "post"
		data: dataPost
		dataType: "json"
		success: (response, textStatus, jqXHR) ->	
			if response.status is 1				
				$( ".messageBlock" ).append( "<div class='pull-right m-t-10'>" + response.messageBlock + "</div>")
			else
				alert("123")
		error: (response, textStatus, jqXHR) ->
			messagePost.val(messagePostVal);
			msgError.html("Comment is not Added.");
			msgError.removeClass("hide");	
		complete: ->			
			$(".sendMessageForm :input").prop("disabled", false);
			




jQuery ->
	$("#messagePost").keyup (event) ->
		$("#message_err").addClass("hide")
		if (event.keyCode or event.which) is 13
			event.preventDefault()
			sendMessage()
		else
			return false
	$("#sendMessage").click (event) ->
		sendMessage()
		return false

