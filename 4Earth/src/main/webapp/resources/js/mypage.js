/* ----------------------------------
        kakao unlink
---------------------------------- */
 window.Kakao.init("d33d858d13446389bd9ff29763e3a882");
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
    let menuPath = ['/4earth/point', '/4earth/order','/4earth/wishlist', '/4earth/my_ongoing_list', '/4earth/profile_view'];
    let menuName = ['포인트', '주문·배송', '찜한 상품', '참여 중인 챌린지', '내정보'];
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

function unregisterSNS() {
	if(confirm("정말로 탈퇴하시겠습니까?")){
		location.replace("member_delete_SNS")
	}else{
		location.replace("profile_view")
	}
};

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


/* ----------------------------------
       	정규식 확인
---------------------------------- */
let idCheck = RegExp(/^[a-zA-Z][a-zA-Z\d]{5,12}$/);
$('#userId').keyup(function() {
  if (!idCheck.test($('#userId').val())) {
    $('#member-id').css('color', 'red').text("형식에 맞지 않음");
    
  } else {
    $('#member-id').css('color', 'green').text("OK");
    
  }
});


// 비밀번호
let passwordCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[!@#$%)^~(*+=-])(?=.*\d).{8,16}$/);
$('#userPwd').keyup(function() {
  if (!passwordCheck.test($('#userPwd').val())) {
    $('#member-password').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-password').css('color', 'green').text("OK");
  }
});


// 비밀번호 확인체크
$('#userPwCheck').keyup(function(){
  let passwd = $('#userPwd').val();
  let passwdcheck = $('#userPwCheck').val();

  if(passwd == passwdcheck){
    passCheck = true;
    $('#member-passwordcheck').text('OK');
    $('#member-passwordcheck').css('color', '#08a600');
  }else{
    passCheck = false;
    $('#member-passwordcheck').text('동일하지 않습니다.');
    $('#member-passwordcheck').css('color', 'red');
  }
});


// 이름
let nameCheck = RegExp(/^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,16}$/);
$('#userName').keyup(function() {
  if (!nameCheck.test($('#userName').val())) {
    $('#member-name').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-name').css('color', 'green').text("OK");
  }
});


// 이메일
let email_result = 'true';
let emailCheck = RegExp(/^[\w-]+@([\w-]+)\.([A-Za-z\.]{2,3})$/);
$('#userEmail').change(function () {
	$('#userEmail').attr("check_result", "fail");
});
	
$('#userEmail').keyup(function() {
	if (!emailCheck.test($('#userEmail').val())) {
		$('#member-email').css('color', 'red').text("형식에 맞지 않음");
		email_result = 'fail';
		} else {
		let userEmail = $("#userEmail").val().trim();
			$.ajax({
				type: "post",
				url: "emailCheckForEdit",
				dataType: "JSON",
				data: {
					userEmail
				},
				success: (data) => {
					console.log(data);
					let email=document.getElementById('userEmail');
					
					if(data.duplicate == true) {
						$('#member-email').css('color', 'red').text("이미 등록된 이메일입니다.");
						email_result = 'fail';
					}else {
						$('#member-email').css('color', 'green').text("OK");
						$('#userEmail').attr("check_result", "true");
						email_result = 'true';
					}
				},
				error: (error) => {
					console.log(error);
				}	
			});
    }
});


// 전화번호
let phone_result = 'true';
let phoneCheck = RegExp(/^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/);
$('#userPhone').change(function () {
	$('#userPhone').attr("check_result", "fail");
});

$('#userPhone').keyup(function() {
	if (!phoneCheck.test($('#userPhone').val())) {
		$('#member-phone').css('color', 'red').text("형식에 맞지 않음");
		$('#userPhone').attr("check_result", "fail");
		phone_result = 'fail';
		} else {
		let userPhone = $("#userPhone").val().trim();
			$.ajax({
				type: "post",
				url: "phoneCheckForEdit",
				dataType: "JSON",
				data: {
					userPhone
				},
				success: (data) => {
					console.log(data);
					let phone=document.getElementById('userPhone');
					
					if(data.duplicate == true) {
						$('#member-phone').css('color', 'red').text("이미 등록된 번호입니다.");
						$('#userPhone').attr("check_result", "fail");
						phone_result = 'fail';
					}else {
						$('#member-phone').css('color', 'green').text("OK");
						$('#userPhone').attr("check_result", "true");
						phone_result = 'true';
					}
				},
				error: (error) => {
					console.log(error);
				}	
			});
    }
});



/* ----------------------------------
      회원가입폼 제출 전 마지막 체크
---------------------------------- */
function edit_check_All() {

	if(!nameCheck.test($('#userName').val())){
		alert("형식에 맞지 않는 이름입니다.");
		$('#userName').focus();
		return false;
	}else if(!emailCheck.test($('#userEmail').val())){
		alert("형식에 맞지 않는 이메일입니다.");
		$('#userEmail').focus();
		return false;
	}else if(email_result == 'fail'){
	    alert("이미 등록된 이메일입니다. 다른 메일을 사용해주세요.");
		/* $('#userEmail').val(''); */
	    return false;
	}else if(!phoneCheck.test($('#userPhone').val())){
		alert("형식에 맞지 않는 전화번호입니다.");
		$('#userPhone').focus();
		return false;
	}else if(phone_result == 'fail'){
	    alert("이미 등록된 전화번호입니다. 다른 번호를 입력해주세요.");
		/* $('#userPhone').val(''); */
	    return false;
	}
	
	return true;
}

/* ----------------------------------
      비밀번호 변경
---------------------------------- */
// 비밀번호
$('#userPwd2').keyup(function() {
  if (!passwordCheck.test($('#userPwd2').val())) {
    $('#member-password2').css('color', 'red').text("형식 불일치");
  } else {
    $('#member-password2').css('color', 'green').text("OK");
  }
});

// 비밀번호 확인체크
$('#userPwCheck2').keyup(function(){
  let passwd = $('#userPwd2').val();
  let passwdcheck = $('#userPwCheck2').val();

  if(passwd == passwdcheck){
    passCheck = true;
    $('#member-passwordcheck').text(' OK');
    $('#member-passwordcheck').css('color', '#08a600');
  }else{
    passCheck = false;
    $('#member-passwordcheck').text('동일하지 않음');
    $('#member-passwordcheck').css('color', 'red');
  }
});

function pw_change_check() {
  let passwd = $('#userPwd1').val();
  let newpasswd = $('#userPwd2').val();
  let passwdcheck = $('#userPwCheck2').val();
  let loginpw = $('#userPwd3').val();
  console.log(loginpw);
  console.log(document.cookie);
  
	if(!passwordCheck.test($('#userPwd2').val())){
		alert("형식에 맞지 않는 비밀번호입니다.");
		return false;
	}else if(newpasswd != passwdcheck){
		alert("비밀번호 재확인 결과가 동일하지 않습니다.");
		return false;
	}
	
	// return true;

}

// 프로필 이미지 등록시 미리보기
const reader = new FileReader();

reader.onload = (readerEvent) => {
    document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
    
};

// 프로필 이미지 로딩
document.querySelector("#profileImg").addEventListener("change", (changeEvent) => {

    const imgFile = changeEvent.target.files[0];
    reader.readAsDataURL(imgFile);

});