window.onload = function() {
	let btnModify = $('.btn-modify-reply');
	let btnCancel = $('.btn-cancel-reply');
	let btnDeleteParents = $('.btn-delete-parents-reply'); // 모댓글 삭제
	let btnDelete = $('.btn-delete-reply');
	let btnNested = $('.btn-nested-reply');
	let btnReport = $('.btn-report-reply');
	let btnNestedCancel = $('.nested-wrap').find('.btn-cancel-reply');
	
	// 댓글 수정
	btnModify.each(function(idx, el) {
		$(el).on('click', (e) => {
			let btnWrap = $(e.currentTarget).parents('.btn-wrap');
			let originalReplyTag = btnWrap.prev().find('p');
			let originalReplyTxt = btnWrap.prev().find('p').text();
			let btnNested = btnWrap.prev().find('.btn-nested-reply');
			let $li = $(e.currentTarget).closest('li');
			let modifyBox = btnWrap.prev().find('.modify-wrap');
			let count = btnWrap.prev('.reply-cont').find('.count-reply > em');
			
			btnWrap.hide();
			originalReplyTag.hide();
			btnNested.hide();
			$li.css('background', '#f9f9f9');
			modifyBox.show();
			modifyBox.find('textarea').val(originalReplyTxt).focus();
			$(e.currentTarget).closest('.reply-item').find('.nested-wrap').hide();
			count.text(originalReplyTxt.length);
			
		});
	});
	
	// 댓글 수정 취소
	btnCancel.each(function(idx, el) {
		$(el).on('click', (e) => {
			let btnWrap = $(e.currentTarget).parents('.reply-cont').next('.btn-wrap');
			let originalReplyTxt = $(e.currentTarget).parents('.reply-cont').find('p');
			let btnNested = $(e.currentTarget).parents('.reply-cont').find('.btn-nested-reply');
			let $li = $(e.currentTarget).closest('li');
			let $textArea = $(e.currentTarget).parents('.reply-cont').find('.modify-wrap').find('textarea');
			let modifyBox = $(e.currentTarget).parents('.reply-cont').find('.modify-wrap');
			
			btnWrap.show();
			originalReplyTxt.show();
			btnNested.show();
			$li.css('background', 'transparent');
			$textArea.val("");
			modifyBox.hide();
		});
	});
	
	// 댓글 삭제 - 모댓글
	btnDeleteParents.each(function(idx, el) {
		$(el).on('click', (e) => {
			$this = $(e.currentTarget); 
			nested = $this.closest('.reply-item').find('.nested-reply-list');
			
			if( nested.length > 0 ) {
				alert('답글이 있는 댓글은 삭제할 수 없습니다.');
				return false;
			} else {
				if(confirm('댓글을 삭제하시겠습니까?')) {
					location.replace("${ path }/delete_reply?no=${ month.chalNo }");
				} else {
					return false;
				}	
			}
			
		});
	});
	
	// 댓글 삭제 - 답글
	btnDelete.each(function(idx, el) {
		$(el).on('click', () => {
			if(confirm('댓글을 삭제하시겠습니까?')) {
				location.replace("${ path }/delete_reply?no=${ month.chalNo }");
			} else {
				return false;
			}	
		});
	});
	
	
	// 답글 작성
	btnNested.each(function(idx, el) {
		$(el).on('click', (e) => {
			let nestedWrap = $(e.currentTarget).parents('.reply-wrap').siblings('.nested-wrap');
			let targetLi = $(e.currentTarget).closest('li');
			
			nestedWrap.show();
			nestedWrap.find('textarea').focus();
			targetLi.css('background', '#f9f9f9');
		});
	});
	
	// 답글 작성 취소
	btnNestedCancel.each(function(idx, el) {
		$(el).on('click', (e) => {
			let nestedWrap = $(e.currentTarget).parents('.nested-wrap')
			let targetLi = nestedWrap.parents('li');
			let textBox = targetLi.find('textarea');
			
			nestedWrap.hide();
			targetLi.css('background', 'transparent');
			textBox.val('');
		});
	});
	
	// 신고하기
	btnReport.each(function(idx, el){
		$(el).on('click', (e) => {
			let $this = $(e.currentTarget);
			let targetBtnWrap = $this.parents('.btn-wrap');
			let popup = $('.layer-popup');
			
			// 팝업에 출력
			// 신고 받은 회원 아이디
			let userIdEl = targetBtnWrap.siblings('.user-info').find('.reply-user-id'); 
			let userId = userIdEl.text();
			
			// 신고 댓글 내용
			let replyTxtEl = targetBtnWrap.siblings('.reply-cont').find('p');
			let replyTxt = replyTxtEl.text();
			
			
			// 컨트롤러에 전달
			// 신고 받은 회원 번호
			let reportedUserNo = targetBtnWrap.siblings('.user-info').find('.reported-user-no').val(); 
			
			// 팝업 출력용
			popup.find('.reply-user-id').text(userId); // 신고 받은 회원 아이디
			popup.find('.reply-content').text(replyTxt); // 신고 댓글 내용
			
			// 컨드롤러에 전달
			$("input[name=reportedMemberNo]").val(reportedUserNo); // 신고 받은 회원 번호
			$("input[name=reportTitle]").val(replyTxt); // 신고 사유 작성 내용
			
			// 신고 사유 라디오 버튼 선택
			$("input[type=radio]").on('change', () => {
				let reportChecked = $("input[type=radio]:checked").val();
				$("input[name=reportCategory]").val(reportChecked);
			});
		});
	});
	
	// 글자수 제한
	$('textarea').each(function(idx, el) {
		$(el).keyup((e) => {
			let content = $(this).val();
			let thisCount = $(el).siblings('.count-reply').find('em');
		
			if (content.length == 0 || content == '') { 
				thisCount.text('0'); 
			} else { 
				thisCount.text(content.length); 
			} 
		
			if ( content.length > 200 ) { 
				$(this).val($(this).val().substring(0, 200));
				alert('글자수가 초과되었습니다.'); 
			}; 	
		
		});
	});
	
}