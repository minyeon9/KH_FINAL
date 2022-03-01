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

const reader = new FileReader();

reader.onload = (readerEvent) => {
    document.querySelector("#preview").setAttribute("src", readerEvent.target.result);
    
};

document.querySelector("#profileImg").addEventListener("change", (changeEvent) => {

    const imgFile = changeEvent.target.files[0];
    reader.readAsDataURL(imgFile);

});



//아이디 중복 확인
$(document).ready(() => {
	$("#checkDuplicate").on("click", () => {
		let userId = $("#userId").val().trim();
		
		$.ajax({
			type: "post",
			url: "${ path }/idCheck",
			dataType: "JSON",
			data: {
				userId
			},
			success: (data) => {
				console.log(data);
				
				if(data.duplicate == true) {
					alert("이미 사용중인 아이디 입니다.");
				} else {
					alert("사용 가능한 아이디 입니다.");
				}
			},
			error: (error) => {
				console.log(error);
			}	
		});
	});
});

let idCheck = RegExp(/^[a-zA-Z][a-zA-Z\d]{5,12}$/);
$('#userId').keyup(function() {
  if (!idCheck.test($('#userId').val())) {
    $('#member-id').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-id').css('color', 'green').text("OK!");
  }
});

/*
// 비밀번호
let passwordCheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^~*+=-])(?=.*[0-9]).{8,16}$/);
$('#userPwd').keyup(function() {
  if (!passwordCheck.test($('#userPwd').val())) {
    $('#member-password').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-password').css('color', 'green').text("형식에 맞음");
  }
});
*/

// 비밀번호 확인체크
$('#userPwCheck').keyup(function(){
  let passwd = $('#userPwd').val();
  let passwdcheck = $('#userPwCheck').val();

  if(passwd == passwdcheck){
    passCheck = true;
    $('#member-passwordcheck').text('동일한 비밀번호 입니다.');
    $('#member-passwordcheck').css('color', '#08a600');
  }else{
    passCheck = false;
    $('#member-passwordcheck').text('동일하지 않은 비밀번호 입니다.');
    $('#member-passwordcheck').css('color', 'red');
  }
});

/*
// 이름
let nameCheck = RegExp(/^[a-zA-Z가-힣]{2,}$/);
$('#userName').keyup(function() {
  if (!nameCheck.test($('#userName').val())) {
    $('#member-name').css('color', 'red').text("형식에 맞지 않음");
  } else {
    $('#member-name').css('color', 'green').text("형식에 맞음");
  }
});
*/

