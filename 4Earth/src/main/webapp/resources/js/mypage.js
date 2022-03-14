/* ----------------------------------
        side bar
---------------------------------- */

$(() => {
    let sideBarMenu = $('.side-bar ul li');
    let menuPath = ['/4earth/point', '/4earth/order','/4earth/wishlist', '#', '#', '/4earth/profile_view'];
    let menuName = ['포인트', '주문·배송', '찜한 상품', '1:1문의', '참여 중인 챌린지', '내정보'];
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

/* ----------------------------------
      다음 우편번호 찾기
---------------------------------- */
	// 우편번호 찾기 (Daum Postcode Sevice)
	function execution_daum_address_edit(){ 
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.    
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode1').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").value = '';
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();  
	}




