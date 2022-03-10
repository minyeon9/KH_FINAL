/* ----------------------------------
        kakao unlink
---------------------------------- */
// window.Kakao.init("d33d858d13446389bd9ff29763e3a882");
 window.Kakao.isInitialized(); 
 function unlinkWithKakao() {
     Kakao.API.request({
         url: '/v1/user/unlink',
         success: res => {
             // console.log("unlink :" + JSON.stringify(res));
             // console.log(Object.keys(res));
             
             $.ajax({ 
                 type: "post", 
                 url: "kakao_unlink",
                 data: res,
                 datatype: 'JSON',
                 success: function(data) {
                     
                	 location.replace(data.location);
                
                	 alert(data.msg);

                     // console.log(res);
                     // console.log(Object.keys(kakao_account));
                     // console.log(Object.values(kakao_account));
                     // location.replace("http://localhost:8088/4earth/");
                 }, 
                 error: function(error) {
                     console.log("error", error );
                 },
                 complete: function() {
                     console.log("complete");
                 }
             });
         }
     });
 }


/* ----------------------------------
        side bar
---------------------------------- */
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['/4earth/point', '/4earth/order','/4earth/wishlist', '#', '#', '/4earth/profile_view'];
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
/*
//회원탈퇴 버튼
$(document).ready(()=>{
	$("#delete_btn, #unregister-btn").on("click", ()=>{
		if(confirm("정말로 탈퇴하시겠습니까?")){
			location.replace("member_delete")
		}else{
			location.replace("profile_view")
		}
	});
});
*/



