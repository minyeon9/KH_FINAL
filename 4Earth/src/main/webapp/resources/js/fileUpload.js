/* ----------------------------------
    upload images
---------------------------------- */
$(() => {
    let inputFile = $('#inputFileOrigin');
    let inputName = $('.input-file');

    inputFile.on('change',function(e){
        let fileName = inputFile.val();

        inputName.val(fileName);

        // if( inputName.val != null ) {
        //     inputName.addClass('filled');
        // }
    });
    
    function handleFileSelect(event) {
        var input = this;
        
        if (input.files && input.files.length) {
            var reader = new FileReader();
            this.enabled = false;
            reader.onload = (function (e) {
            
            console.log(e)
                $(".upload-img").html(['<img src="', e.target.result, '" title="', escape(e.name), '"/>'].join(''))
            });
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    $('#inputFileOrigin').change(handleFileSelect);
    
});


document.addEventListener('DOMContentLoaded', function(){
    var validateType = function(img){
        return (['image/jpeg','image/jpg', 'image/gif', 'image/png'].indexOf(img.type) > -1);
    }

    /* var validateName = function(fname){
        let extensions = ['jpeg','jpg', 'gif', 'png'];
        let fparts = fname.split('.');
        let fext = '';
    
        if(fparts.length > 1){
            fext = fparts[fparts.length-1];
        }
    
        let validated = false;
        
        if(fext != ''){
            extensions.forEach(function(ext){
                if(ext == fext){
                    validated = true;
                }
            });
        }
    
        return validated;
    } */

    document.getElementById('inputFileOrigin').addEventListener('change', function(e){
        let elem = e.target;
        let inputName = $('.input-file');
        if( validateType(elem.files[0]) ) {
            let preview = document.querySelector('.upload-img img');
            preview.src = URL.createObjectURL(elem.files[0]);
            preview.onload = function() {
                URL.revokeObjectURL(preview.src);
            }

            let inputFile = $('#inputFileOrigin');
            let inputName = $('.input-file');

            inputFile.on('change',function(e){
                let fileName = inputFile.val();

                inputName.val(fileName);
            });
        } else {
            let inputName = $('.input-file');
            alert("gif, png, jpg 형식의 파일만 업로드 가능합니다.\n사진을 다시 업로드해주세요.");
            $('#inputFileOrigin').val("");
        }
    });
	
    document.querySelector('.btn-delete-img').addEventListener('click', function(e){
        let preview = document.querySelector('.upload-img img');
        let inputName = $('.input-file');
        preview.src = '';
        inputName.val("파일을 선택해주세요.");
        $(".upload-img").empty()
        $("#inputFileOrigin").val("");
    });
});