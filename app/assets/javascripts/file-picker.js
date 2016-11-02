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
                $.post(upload_path, blobs[0])
                    .done(function () {
                        location.reload();
                    })
                    .fail(function () {
                        alert('Something went wrong.');
                    });
            }
        );

    });


    $('.file-picker-parent').on('click','.js-admin-fp-button',function(e){
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
                var fileAttached = $(".file-stack-file");
                var filePicAttached = $("#file_pic_attached");
                
                var dfile = "<a href='"+blobs[0].url+"' target='_blank'>"+blobs[0].filename+"</a>";
                fileAttached.html(dfile);
                filePicAttached.val(dfile);
                $(".clear-file-pic").removeClass("hide");
                

                //blobs[0]
            }
        );

    });

});