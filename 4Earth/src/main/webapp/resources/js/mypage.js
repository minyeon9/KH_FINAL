/* ----------------------------------
        side bar
---------------------------------- */
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['#', '#','#', '#', '#', '#'];
        let menuName = ['포인트 내역', '주문/배송 내역', '찜한 상품', '1:1문의 내역', '참여 중인 챌린지', '회원정보'];
        let menuIcon = ['savings', 'local_shipping', 'favorite', 'headset_mic', 'bookmark_border', 'person']

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
    }

    sideBarMenu.each(function(idx, el) {
        if(idx == idxNum) {
            $(this).addClass('current');
        }
    });
});