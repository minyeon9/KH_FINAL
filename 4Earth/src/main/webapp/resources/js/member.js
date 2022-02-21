/* ----------------------------------
        side bar
---------------------------------- */
 $(() => {
    let sideBarMenu = $('.side-bar ul li');
    let menuPath = ['/4earth', '/4earth/login','/4earth/signup'];
    let menuName = ['홈', '로그인', '회원가입'];
    let menuIcon = ['home', 'login', 'person_add' ]

    for( let i = 0; i < menuName.length; i++ ) {
        let menuIdx = sideBarMenu.eq(i);

        menuIdx.find('a').attr('href', menuPath[i]);
        menuIdx.find('a > i').text(menuIcon[i]);
        menuIdx.find('a > span').text(menuName[i]);
    }

    sideBarMenu.each(function(idx, el) {
        if(idx == 1) {
            $(this).addClass('current');
        }
    });
});
    