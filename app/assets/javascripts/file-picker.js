$(document).ready(function(){
    $('.js-admin-fp-button').click(function(e){
        e.preventDefault();

        var el = $(this);

        filepicker.setKey(el.data('fp-apikey'));
        filepicker.pickAndStore(
            {},
            {
                path: el.data('fp-store-path'),
                storeContainer: $(this).data('fp-bucket')
            },
            function(blobs){
                $.post('upload_file', blobs[0])
                    .done(function () {
                        location.reload();
                    })
                    .fail(function () {
                        alert('Something went wrong.');
                    });
            }
        );

    });

});