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

/* ----------------------------------
        아이디 중복 확인
---------------------------------- */

$(document).ready(() => {
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
				
				if(data.duplicate == true) {
					alert("이미 사용중인 아이디 입니다.");
					let id=document.getElementById('userId');
					id.value=null;					
					
				} else {
					alert("사용 가능한 아이디 입니다.");
					/* $('#checkDuplicate').hide(); */
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

function id_overlap_check() {
	if ($('#userId').attr("check_result") == "fail"){
	    alert("아이디 중복체크를 해주시기 바랍니다.");
	    return false;
	    $('.username_input').focus();
	    	    
	}
	return true;
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

/*
// 비밀번호
let passwordCheck = RegExp(/^(?=.*[A-Za-z])(?=.*[!@#$%)^~(*+=-])(?=.*\d).{8,16}$/);
$('#userPwd').keyup(function() {
  if (!passwordCheck.test($('#userPwd').val())) {
    $('#member-password').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-password').css('color', 'green').text("OK");
  }
});
*/

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
let emailCheck = RegExp(/^[\w-]+@([\w-]+)\.([A-Za-z\.]{2,3})$/);
$('#userEmail').keyup(function() {
	if (!emailCheck.test($('#userEmail').val())) {
		$('#member-email').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-email').css('color', 'green').text("OK");
    }
});


// 전화번호
let phoneCheck = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
$('#userPhone').keyup(function() {
	if (!phoneCheck.test($('#userPhone').val())) {
		$('#member-phone').css('color', 'red').text("형식에 맞지 않음");
		} else {
      $('#member-phone').css('color', 'green').text("OK");
    }
});
