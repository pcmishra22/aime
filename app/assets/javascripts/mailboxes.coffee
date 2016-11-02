# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
replyMail = () ->
	$(".sendMessageForm :input").prop("disabled", true);
	messagePost = $("#mailPost")						
	msgError = $("#message_err")
	parent_id = $("#parent_id").val()
	messagePostVal = messagePost.val()

	msgError.addClass("hide")
	messagePost.val("")
	if messagePostVal is ""
		msgError.html("Message Field is required.");
		msgError.removeClass("hide");
		$(".sendMessageForm :input").prop("disabled", false);
		return false;

	dataPost = {
		parent_id: parent_id,
		message: messagePostVal
	};

	$.ajax "/createAjaxMail",
		type: "post"
		data: dataPost
		dataType: "json"
		success: (response, textStatus, jqXHR) ->	
			if response.status is 1				
				$( ".messageBlock" ).append( "<div class='clearfix m-t-10'><div class='pull-right'>" + response.messageBlock + "</div></div>")
			else
				messagePost.val(messagePostVal);
				msgError.html("Message not sent.");
				msgError.removeClass("hide");
		error: (response, textStatus, jqXHR) ->
			messagePost.val(messagePostVal);
			msgError.html("Message not sent.");
			msgError.removeClass("hide");	
		complete: ->	
			messagePost.focus()		
			$(".sendMessageForm :input").prop("disabled", false);
			




jQuery ->
	$("#mailPost").keyup (event) ->
		$("#message_err").addClass("hide")
		if (event.keyCode or event.which) is 13
			event.preventDefault()
			replyMail()
		else
			return false

	$("#sendReply").click (event) ->
		replyMail()
		return false

	$('.file-picker-parent').on 'click', '.clear-file-pic', ->
		$("#file_pic_attached").val("")
		$(".file-stack-file").html("File not attached.")
		$(".clear-file-pic").addClass("hide")
