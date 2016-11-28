$(document).ready(function () {

    //make first message thread selected
    makeMessageThreadSelected($("#user-list a").first());
    // load messgae for selected thread
    loadMessage();

    setInterval(function(){ ping(); }, 5000);

    $('#user-list a').click(function(e){
        e.preventDefault();
        var el = $(this);
        makeMessageThreadSelected(el);
        loadMessage();
    });

    $('#reply').click(function(e){
        var message = $('#message').val();
        if(message.trim()){
            postMessage(message);
        }

        ping();
    })
});

function makeMessageThreadSelected(thread){
    thread.parent().find('li').removeClass('selected');
    thread.parent().find('a').removeClass('selected');
    thread.addClass('selected');
    $('li', thread).addClass('selected');
}

function getSelectedConversationId(){
    return $('#user-list>a.selected').attr('data-id');
}

function getSelectedConversationElement(){
    return $('#user-list>a.selected');
}

function getLastMessageId(){
    return getSelectedConversationElement().attr('last-id');
}

function setLastMessageId(id){
    getSelectedConversationElement().attr('last-id', id);
}

function postMessage() {
    $.post($("#mform").attr('action'), $("#mform").serialize())
        .done(function (data) {
            // append message to message wall
            $('.display-message').append(messageJsonToHtml(data));
            // make message input box blank
            $('#message').val('');
            setLastMessageId(data.id)
        });
}

function loadMessage(lastMessageId){

    var messageUrl = '/student/conversations/' + getSelectedConversationId() + '/messages.json';
    if(lastMessageId){
        messageUrl += '?after=' + lastMessageId;
    }
    else{
        $('.display-message').html('');
    }

    $("#mform").attr('action', '/student/conversations/' + getSelectedConversationId() + '/messages')

    var last_id = false;
    $.get(messageUrl, function(result){
        $.each(result, function(i, thread) {
            $('.display-message').append(messageJsonToHtml(thread));
            last_id = thread.id
        });

        if(last_id){
            setLastMessageId(last_id);
        }


    });
}

function ping(){
    loadMessage(getLastMessageId());
}



function messageJsonToHtml(jsonObj){
    return ""
     + "<div class='message'>"
     + "    <div class='img-con'>"
     + "        <img src='http://fze.uni-trier.de/wp-content/themes/weta/images/useravatar.png'>"
     + "    </div>"
     + "    <div class='text-con'>"
     + "        <a href='#''>User Name</a>"
     + "        <p>" + jsonObj.message + "</p>"
     + "    </div>"
     + "</div>"
     + "<hr>";
}