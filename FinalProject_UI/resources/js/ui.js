$(() => {
    /* ----------------------------------
        main visual
    ---------------------------------- */
    let btnAnimate = $('.btn-visual');
    let btnUndo = $('.btn-visual-undo');

    btnAnimate.each(function(idx, el) {
        let $this = $(el);
        let visualTit = $('.visual > strong');
        let wrap = $this.closest('.visual');               // 최상단 .visual
        let box = $this.closest('.visual-box');            // left / right 각 최상단 div
        let boxTIt = $this.siblings('strong');
        let centerImg = $this.siblings('.center-img');     // 중앙 이미지
        let bestMain = $this.siblings('.best-main');       // 베스트 챌린지 or 상품
        let bestList = $this.siblings('.best-list-main');  // 베스트 list
        let btnUndo = $this.siblings('.btn-visual-undo');  // 되돌리기 버튼

        $this.on('click', () => {
            if( box.hasClass('campain') ) {
                // 최상단 .visual
                wrap.animate({
                    marginRight: '-90%'
                }, 'easeOutBounce');
                

                visualTit.css('opacity', '0');
                boxTIt.css('display', 'block');
                
                // 중앙 이미지
                centerImg.animate(
                    { deg: -135 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'translateY(-50%) rotate(' + now + 'deg)' });
                        }
                    }
                );

                // 베스트 챌린지 or 상품
                bestMain.animate({
                    left: '50%', right: 'auto', transform: 'translateY(-50%)', opacity: '1'
                }, 1200);
                
                // 베스트 list
                bestList.animate({
                    left: '120px'
                }, 1200);

                // 클릭한 버튼
                $this.animate({
                    left: '-10%', opacity: '.5'
                });
                
                // 되돌리기 버튼
                btnUndo.animate({
                    left: '30px', opacity: '1'
                }, 800);
            } else {
                // 최상단 .visual
                wrap.animate({
                    marginRight: '0',
                    marginLeft: '-90%'
                }, 'easeOutBounce');

                visualTit.css('opacity', '0');
                boxTIt.css('display', 'block');
                
                // 중앙 이미지
                centerImg.animate(
                    { deg: 225 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'translateY(-50%) rotate(' + now + 'deg)' });
                        }
                    }
                );

                // 베스트 챌린지 or 상품
                bestMain.animate({
                    right: '50%', left: 'auto', transform: 'translateY(-50%)', opacity: '1'
                }, 1200);

                // 베스트 list
                bestList.animate({
                    right: '-270px'
                }, 1200);

                // 클릭한 버튼
                $this.animate({
                    right: '-10%', opacity: '.5'
                });
                
                // 되돌리기 버튼
                btnUndo.animate({
                    right: '30px', opacity: '1'
                }, 500);
            }
        }); // click event
    }); // undo click event

    btnUndo.each(function(idx, el){
        let $this = $(el);
        let visualTit = $('.visual > strong');
        let wrap = $this.closest('.visual');               // 최상단 .visual
        let box = $this.closest('.visual-box');            // left / right 각 최상단 div
        let centerImg = $this.siblings('.center-img');     // 중앙 이미지
        let boxTIt = $this.siblings('strong');
        let bestMain = $this.siblings('.best-main');       // 베스트 챌린지 or 상품
        let bestList = $this.siblings('.best-list-main');  // 베스트 list
        let btnAnimate = $this.siblings('.btn-visual');    // 버튼

        $this.on('click', () => {
            if( box.hasClass('campain') ) {
                // 최상단 .visual
                wrap.animate({
                    marginRight: '0'
                }, 'easeOutBounce');

                visualTit.css({opacity: '1'}, 600);
                boxTIt.css('display', 'none');
                
                // 중앙 이미지
                centerImg.animate(
                    { deg: 45 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'translateY(-50%) rotate(' + now + 'deg)' });
                        }
                    }
                );

                // 베스트 챌린지 or 상품
                bestMain.animate({
                    left: '-100%', right: 'auto', transform: 'translateY(-50%)', opacity: '.5'
                }, 1200);
                
                // 베스트 list
                bestList.animate({
                    left: '-500px'
                }, 500);

                // 되돌리기 버튼
                $this.animate({
                    left: '-20%', opacity: '.5', border: '1px solid red'

                });
                
                // 영역 슬라이드 버튼
                btnAnimate.animate({
                    left: '30px', opacity: '1'
                }, 800);
            } else {
                // 최상단 .visual
                wrap.animate({
                    marginRight: '0',
                    marginLeft: '0'
                }, 'easeOutBounce');

                visualTit.css({opacity: '1'}, 600);
                boxTIt.css('display', 'none');
                
                // 중앙 이미지
                centerImg.animate(
                    { deg: 45 },
                    {
                        duration: 1200,
                        step: function(now) {
                            $(this).css({ transform: 'translateY(-50%) rotate(' + now + 'deg)' });
                        }
                    }
                );

                // 베스트 챌린지 or 상품
                bestMain.animate({
                    right: '-100%', left: 'auto', transform: 'translateY(-50%)', opacity: '.5'
                }, 1200);

                // 베스트 list
                bestList.animate({
                    right: '-890px'
                }, 500);

                // 되돌리기 버튼
                $this.animate({
                    right: '-20%', opacity: '.5'
                });
                
                // 영역 슬라이드 버튼
                btnAnimate.animate({
                    right: '30px', opacity: '1'
                }, 800);
            }
        }); // click event
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
    let inputFile = $('#file');
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



