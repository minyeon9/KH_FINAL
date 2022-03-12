/* ----------------------------------
        side bar
---------------------------------- */

$(() => {
    let sideBarMenu = $('.side-bar ul li');
    let menuPath = ['/4earth/today_main', '/4earth/month_list', '/4earth/ongoing_list'];
    let menuName = ['오늘의 챌린지', '이달의 챌린지', '참여 중인 챌린지'];
    let menuIcon = ['task_alt', 'public', 'bookmark_border' ]

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