$(() => {
    /* ----------------------------------
        main visual
    ---------------------------------- */
    let btnAnimate = $('.btn-visual');
    let btnUndo = $('.btn-visual-undo');

    btnAnimate.each(function(idx, el) {
        let $this = $(el);
        let visualTit = $('.visual > strong');
        let wrap = $this.closest('.visual');
        let box = $this.closest('.visual-box');
        let boxTIt = $this.siblings('strong');
        let centerImg = $this.siblings('.center-img');
        let bestMain = $this.siblings('.best-main');
        let bestList = $this.siblings('.best-list-main');
        let btnUndo = $this.siblings('.btn-visual-undo');

        $this.on('click', () => {
            if( box.hasClass('campain') ) {
                wrap.animate({
                    marginRight: '-90%',
                    marginLeft: '-15%'
                }, 'easeOutBounce');
                
                visualTit.css('opacity', '0');

                boxTIt.css('display', 'block');
                
                centerImg.animate(
                    { deg: -40 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'skew(17deg, 0) rotate(' + now + 'deg)' });
                        }
                    }
                );

                bestMain.animate({
                    left: '50%', right: 'auto', transform: 'translateY(-50%)', opacity: '1'
                }, 1200);
                
                bestList.animate({
                    left: '400px'
                }, 600);

                $this.animate({
                    left: '-10%', opacity: '.5'
                });
                
                btnUndo.animate({
                    left: '17%'
                });

            } else {
                wrap.animate({
                    marginRight: '0',
                    marginLeft: '-100%'
                }, 'easeOutBounce');

                visualTit.css('opacity', '0');

                boxTIt.css('display', 'block');
                
                centerImg.animate(
                    { deg: 40 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'skew(17deg, 0) rotate(' + now + 'deg)' });
                        }
                    }
                );

                bestMain.animate({
                    right: '50%', left: 'auto', transform: 'translateY(-50%)', opacity: '1'
                }, 1200);

                bestList.animate({
                    right: '-320px'
                }, 1200);

                $this.animate({
                    right: '-10%', opacity: '.5'
                });
                
                btnUndo.animate({
                    right: '30px', opacity: '1'
                }, 500);
            }
        });
    }); // click event

    btnUndo.each(function(idx, el){
        let $this = $(el);
        let visualTit = $('.visual > strong');
        let wrap = $this.closest('.visual');
        let box = $this.closest('.visual-box');
        let centerImg = $this.siblings('.center-img');
        let boxTIt = $this.siblings('strong');
        let bestMain = $this.siblings('.best-main');
        let bestList = $this.siblings('.best-list-main');
        let btnAnimate = $this.siblings('.btn-visual');

        $this.on('click', () => {
            if( box.hasClass('campain') ) {
                wrap.animate({
                    marginLeft: '-50%'
                }, 'easeOutBounce');

                visualTit.css({opacity: '1'}, 600);

                boxTIt.css('display', 'none');
                
                centerImg.animate(
                    { deg: 0 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'skew(17deg, 0) rotate(' + now + 'deg)' });
                        }
                    }
                );

                bestMain.animate({
                    left: '-100%', right: 'auto', transform: 'translateY(-50%)', opacity: '.5'
                }, 1200);
                
                bestList.animate({
                    left: '300px'
                }, 500);

                $this.animate({
                    left: '40%'
                });
                
                btnAnimate.animate({
                    left: '52%', opacity: '1'
                }, 800);
            } else {
                wrap.animate({
                    marginRight: '0',
                    marginLeft: '-66.5%'
                }, 'easeOutBounce');

                visualTit.css({opacity: '1'}, 600);
                boxTIt.css('display', 'none');
                
                centerImg.animate(
                    { deg: 0 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'skew(17deg, 0) rotate(' + now + 'deg)' });
                        }
                    }
                );

                bestMain.animate({
                    right: '-100%', left: 'auto', transform: 'translateY(-50%)', opacity: '.5'
                }, 1200);

                bestList.animate({
                    right: '-340px'
                }, 500);

                $this.animate({
                    right: '-100%', opacity: '.5'
                });
                
                btnAnimate.animate({
                    right: '520px', opacity: '1'
                }, 800);
            }
        });
    }); // undo click event

    

    /* ----------------------------------
        gnb
    ---------------------------------- */
    let nav = $('.nav');
    let navHead = nav.find('.nav-list > li > h2 > a');
    let navDepth = nav.find('.nav-list > li > ul');
    let navDepth2 = nav.find('.nav-list > li > ul > li > a');
    let navBg = $('.bg-nav');

    nav.on('mouseenter', () => {

        navBg.stop().animate({
            height: '220px'
        }, 300);

        navDepth.css({
            display: 'block',
            opacity: '1'
        }, 500);
    });

    nav.on('mouseleave', () => {
        navBg.stop().animate({
            height: '0'
        }, 300);

        navDepth.css({
            display: 'none',
            opacity: '0'
        }, 00);
    });



    /* ----------------------------------
        accordian
    ---------------------------------- */
    let accoLi = $('.accordian ul li');
    let accoAnswer = accoLi.find('div');

    accoLi.each(function(idx, el){
        $(el).find('a').on('click', () => {

            if( !$(el).hasClass('active') ) {
                // 닫혀 있을 경우
                accoLi.removeClass('active');
                accoAnswer.slideUp();

                $(this).addClass('active');
                $(this).find('div').slideDown();
            } else {
                // 열려 있을 경우
                $(this).removeClass('active');
                $(this).find('div').slideUp();
            }
        });
    });




    /* ----------------------------------
        button scroll top
    ---------------------------------- */
    let scrollTop = $('.scroll-top');
    scrollTop.on('click', () => {
        $( 'html, body' ).animate( { scrollTop : 0 }, 400 );
        return false;
    });




    /* ----------------------------------
        side bar
    ---------------------------------- */
    let btnToggle = $('.toggle-nav');
    let sideBar = $('.side-bar');
    let sideBarDepth = sideBar.find('ul li span');

    btnToggle.on('click', (e) => {
        let text = $(e.currentTarget).text();

        sideBar.toggleClass('is-open');
        
        if( !sideBar.hasClass('is-open') ) {
            sideBarDepth.css({
                display: 'none'
            }, 100);

            sideBar.animate({
                width: '50px'
            }, 100);

        } else {
            sideBar.animate({
                width: '300px'
            }, 100, () => {

                sideBarDepth.css({
                    display: 'inline-block'
                }, 300);
            });
            
        }
    });



    /* ----------------------------------
        input with icon
    ---------------------------------- */
    let iconInputWrap = $('.input-with-icon');
    let inputTarget = iconInputWrap.find('input');

    inputTarget.on('focus', (e) => {
        $(e.currentTarget).closest(iconInputWrap).addClass('focus').find('i').css({
            color: '#669948'
        });
    });

    inputTarget.on('focusout', (e) => {
        $(e.currentTarget).closest(iconInputWrap).removeClass('focus').find('i').css({
            color: '#ccc'
        });
    });



    /* ----------------------------------
        input upload file
    ---------------------------------- */
    let inputFile = $('#inputFileOrigin');
    let inputName = $('.input-file');

    inputFile.on('change',function(e){
        let fileName = inputFile.val();

        inputName.val(fileName);

        // if( inputName.val != null ) {
        //     inputName.addClass('filled');
        // }
    });




    /* ----------------------------------
        tab
    ---------------------------------- */
    let tabTit = $('.tab-title > a');

    tabTit.each(function(idx, el){
        $(el).on('click', function(e){
            $(e.currentTarget).addClass('is-open').siblings().removeClass('is-open');
            $( $(e.currentTarget).attr('href') ).addClass('is-open').siblings().removeClass('is-open');
        });
    });



    /* ----------------------------------
        layer popup
    ---------------------------------- */
    let btnOpenPopup = $('.btn-open-pop');
    let btnClosePopup = $('.btn-close-pop');
    let dimed = $('.dimed');
    let popupWidth = $('.layer-popup').width();
    let popupHeight = $('.layer-popup').height();
    let winX = ( $(window).width() - popupWidth) / 2;
    let winY = ( $(window).height() - popupHeight) / 2;

    btnOpenPopup.each(function(idx, el) {
        $(el).on('click', (e) => {

            $('.container').on('scroll touchmove mousewheel', function(event) { 
                event.preventDefault();
                event.stopPropagation();
                return false; 
            });

            dimed.css({display: 'block'}, 400);

            $( $(e.currentTarget).attr('href') ).addClass('is-open').css({
                left: winX + 'px',
                top: winY + 'px' 
            });
            

        });
    });

    // $(window).resize(() => {
    //     $('.layer-popup').css({
    //         left: winX + 'px',
    //         top: winY + 'px' 
    //     });
    // });

    btnClosePopup.on('click', (e) => {
        $('html, body').css({'overflow': 'auto', 'height': '100%'});
        $('.container').off('scroll touchmove mousewheel');

        dimed.css({display: 'none'}, 400);

        $(e.currentTarget).closest('.layer-popup').removeClass('is-open');
    });




    /* ----------------------------------
        odd thumb list
    ---------------------------------- */
    let oddThumbList = $('.thumb-list.col-2 ul');
    
    if( oddThumbList.length % 2 != 0 ) {
        let liItem = `<li>&nbsp;</li>`
        oddThumbList.append(liItem);
    }
    




});



/* ----------------------------------
    button scroll top
---------------------------------- */
$( window ).scroll( function() {
    if ( $( this ).scrollTop() > 200 ) {
        $( '.scroll-top' ).fadeIn();
    } else {
        $( '.scroll-top' ).fadeOut();
    }
});




/* ----------------------------------
    upload images
---------------------------------- */
document.addEventListener('DOMContentLoaded', function(){
    var validateType = function(img){
        return (['image/jpeg','image/jpg', 'image/gif', 'image/png'].indexOf(img.type) > -1);
    }

    var validateName = function(fname){
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
    }

    document.getElementById('inputFileOrigin').addEventListener('change', function(e){
        let elem = e.target;
        if( validateType(elem.files[0]) ) {
            let preview = document.querySelector('.upload-img img');
            preview.src = URL.createObjectURL(elem.files[0]);
            document.querySelector('.btn-delete-img').style.display = 'block';
            preview.onload = function() {
                URL.revokeObjectURL(preview.src);
            }
        } else {
            alert("잘못된 형식의 파일입니다.\n사진을 다시 업로드해주세요.");
        }
    });

    document.querySelector('.btn-delete-img').addEventListener('click', function(e){
        let preview = document.querySelector('.upload-img img');
        preview.src = '';
        document.querySelector('.btn-delete-img').style.display = 'none';
    });
});


