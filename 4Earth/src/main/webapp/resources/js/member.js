/* ----------------------------------
        Kakao Login
---------------------------------- */
// 어떤 애플리케이션이 연동될 것인지 설정(설정 사이트의 js키)
window.Kakao.init("d33d858d13446389bd9ff29763e3a882");

function kakaoLogin(){
    window.Kakao.Auth.login({
        // 동의 항목에서 설정한 정보들의 ID를 scope에 설정해준다. 
        scope:'profile_nickname, profile_image, account_email',
        success: function(authObj){
            // console.log(authObj);
            window.Kakao.API.request({
                url:'/v2/user/me',
                success: res => {
                    const kakao_account = res.kakao_account;
                    // console.log(kakao_account);
                    
                    $.ajax({ 
                        type: "post", 
                        url: "kakao_login",
                        data: res,
                        datatype: 'JSON',
                        success: function(data) {
                            
                        	if(data.result == 'login'){
                        		console.log(data);
                        		location.replace(data.location);	
                        	}else if(data.result == 'login_fail'){
                        		location.replace(data.location);
                        		alert("로그인에 실패하셨습니다.");
                        	}else{
                        		// 처음 가입한 경우
                        		location.replace(data.location);
                        	}
                        	
                        	
//                          location.replace("http://localhost:8088/4earth/");
//                        	location.replace("http://localhost:8088/4earth/signup_finish");

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
    });
}

/* ----------------------------------
        Google Login
---------------------------------- */
function loginWithGoogle() {
    $.ajax({
        url: 'getGoogleAuthUrl',
        type: 'get',
    }).done(function (res) {
        location.href = res;
    });
}

/* ----------------------------------
        Naver Login
---------------------------------- */
function loginWithNaver() {
    $.ajax({
        url: 'getNaverAuthUrl',
        type: 'get',
    }).done(function (res) {
        location.href = res;
    });
}


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
        if(idx == idxNum) {
            $(this).addClass('current');
        }
    });
});


/* ----------------------------------
        아이디 중복 확인
---------------------------------- */
$(document).ready(() => {
let idCheck = RegExp(/^[a-zA-Z][a-zA-Z\d]{5,12}$/);
	$("#userId").change(function () {
		$("#userId").attr("check_result", "fail");
	})

	$("#checkDuplicate").on("click", () => {
		let userId = $("#userId").val().trim();

		if (userId == '') {
	      alert('아이디를 입력해주세요.')
	      
	    }else{		
		$.ajax({
			type: "post",
			url: "idCheck",
			dataType: "JSON",
			data: {
				userId
			},
			success: (data) => {
				console.log(data);
				let id=document.getElementById('userId');
				
				if(data.duplicate == true) {
					alert("이미 사용중인 아이디 입니다.");
					id.value=null;					
					
				}else if(!idCheck.test($('#userId').val())){ 
					alert("형식에 맞지 않는 아이디 입니다.");
					id.value=null;
				}else {
					alert("사용 가능한 아이디 입니다.");
					$('#userId').attr("check_result", "true");
				}
			},
			error: (error) => {
				console.log(error);
			}	
		});
		}
	});
});

  
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
let email_result = 'fail';
let emailCheck = RegExp(/^[\w-]+@([\w-]+)\.([A-Za-z\.]{2,3})$/);
$('#userEmail').change(function () {
	$('#userEmail').attr("check_result", "fail");
});
	
$('#userEmail').keyup(function() {
	if (!emailCheck.test($('#userEmail').val())) {
		$('#member-email').css('color', 'red').text("형식에 맞지 않음");
		} else {
		let userEmail = $("#userEmail").val().trim();
			$.ajax({
				type: "post",
				url: "emailCheck",
				dataType: "JSON",
				data: {
					userEmail
				},
				success: (data) => {
					console.log(data);
					let email=document.getElementById('userEmail');
					
					if(data.duplicate == true) {
						$('#member-email').css('color', 'red').text("이미 등록된 이메일입니다.");

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
let phone_result = 'fail';
let phoneCheck = RegExp(/^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/);
$('#userPhone').change(function () {
	$('#userPhone').attr("check_result", "fail");
});

$('#userPhone').keyup(function() {
	if (!phoneCheck.test($('#userPhone').val())) {
		$('#member-phone').css('color', 'red').text("형식에 맞지 않음");
		$('#userPhone').attr("check_result", "fail");
		} else {
		let userPhone = $("#userPhone").val().trim();
			$.ajax({
				type: "post",
				url: "phoneCheck",
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
      다음 우편번호 찾기
---------------------------------- */
	// 우편번호 찾기 (Daum Postcode Sevice)
	function execution_daum_address(){ 
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
                document.getElementById('sample5_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();  
	}



/* ----------------------------------
      회원가입폼 제출 전 마지막 체크
---------------------------------- */
function check_All() {
  let passwd = $('#userPwd').val();
  let passwdcheck = $('#userPwCheck').val();

	if ($('#userId').attr("check_result") == "fail"){
	    alert("아이디 중복체크를 해주시기 바랍니다.");
	    $('#userId').focus();
	    return false;	    
	}else if(!idCheck.test($('#userId').val())){
		alert("형식에 맞지 않는 아이디입니다.");
		$('#userId').focus();
		return false;
	}else if(!passwordCheck.test($('#userPwd').val())){
		alert("형식에 맞지 않는 비밀번호입니다.");
		$('#userPwd').focus();
		return false;
	}else if(passwd != passwdcheck){
		alert("비밀번호 재확인 결과가 동일하지 않습니다.");
		$('#userPwCheck').focus();
		return false;
	}else if(!nameCheck.test($('#userName').val())){
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

/* ----------------------------------
      비밀번호 찾기
---------------------------------- */
$(document).ready(()=>{
	$("#findPw").on("click", ()=>{
		let id = $("#id").val().trim();
		let name = $("#name").val().trim(); 
        let email = $("#email").val().trim();
		// alert("버튼클릭 : "+id+", "+email+", "+name);
		$.ajax({
			type: "post",
			url: "find_pw", 
			dataType: "json",
			data: {
				id, name, email
			},
			success: (data)=>{
			
			console.log(data.result);
			console.log(data.msg);

			if(data.result == 'success'){
			    let dimed = $('.dimed');
				let popupWidth = $('.layer-popup').width();
			    let popupHeight = $('.layer-popup').height();		
			    let winX = ( $(window).width() - popupWidth) / 2;
			    let winY = ( $(window).height() - popupHeight) / 2;
	    
	            $('.container').on('scroll touchmove mousewheel', function(event) { 
	                event.preventDefault();
	                event.stopPropagation();
	                return false; 
	            });
				
				dimed.css({display: 'block'}, 400);
				
	            $( '#popup02' ).addClass('is-open').css({
	                left: winX + 'px',
	                top: winY + 'px' 
	            });
	         
	            // let memberNum = data.memberNum;
	            // sessionStorage.setItem("memberNo", memberNum);
				
	            // alert(memberNum);
	            // alert(sessionStorage.getItem("memberNo"));
			}else{
				alert(data.msg);
			}


			},
			error: (error)=>{
				console.log(error);
				console.log('에러야 에러');
			}
		});
	});
});


/* ----------------------------------
      비밀번호 찾기 - 재설정
---------------------------------- */
function pw_reset_check() {
  let newpasswd = $('#userPwd2').val();
  let passwdcheck = $('#userPwCheck2').val();
   console.log(newpasswd);
   console.log(passwdcheck);
  
	if(!passwordCheck.test($('#userPwd2').val())){
		alert("형식에 맞지 않는 비밀번호입니다.");
		return false;
	}else if(newpasswd != passwdcheck){
		alert("비밀번호 재확인 결과가 동일하지 않습니다.");
		return false;
	}
	
	return true;
}

/* ----------------------------------
      아이디 찾기
---------------------------------- */
$(document).ready(()=>{
	$("#findId").on("click", ()=>{
		let name = $("#userName").val().trim(); 
        let phone = $("#userPhone").val().trim();
//		 alert("버튼클릭 : "+phone+", "+name);
		$.ajax({
			type: "post",
			url: "find_id", 
			dataType: "json",
			data: {
				name, phone
			},
			success: (data)=>{
			
			console.log(data.result);
			console.log(data.msg);

			if(data.result == 'success'){
			    let dimed = $('.dimed');
				let popupWidth = $('.layer-popup').width();
			    let popupHeight = $('.layer-popup').height();		
			    let winX = ( $(window).width() - popupWidth) / 2;
			    let winY = ( $(window).height() - popupHeight) / 2;
	    
	            $('.container').on('scroll touchmove mousewheel', function(event) { 
	                event.preventDefault();
	                event.stopPropagation();
	                return false; 
	            });
				
				dimed.css({display: 'block'}, 400);
				
	            $( '#popup02' ).addClass('is-open').css({
	                left: winX + 'px',
	                top: winY + 'px' 
	            });
	         
	            // let memberNum = data.memberNum;
	            // sessionStorage.setItem("memberNo", memberNum);
				
	            // alert(memberNum);
	            // alert(sessionStorage.getItem("memberNo"));
			}else{
				alert(data.msg);
			}


			},
			error: (error)=>{
				console.log(error);
			}
		});
	});
});

/*
$(window).load(function(){
	$('.loader').delay('3000').fadeOut();
});
*/



// 프로필 이미지 등록시 미리보기
const reader = new FileReader();

reader.onload = (readerEvent) => {
    document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
    
};


// 회원가입 - 프로필 이미지 로딩
document.querySelector("#profileImg").addEventListener("change", (changeEvent) => {

    const imgFile = changeEvent.target.files[0];
    reader.readAsDataURL(imgFile);

});


/*document.getElementById("checkbox1").setCustomValidity("개인정보 수집 및 이용약관을 체크해주세요."); */




