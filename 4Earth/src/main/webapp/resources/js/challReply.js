window.onload = function() {
	let btnModify = $('.btn-modify-reply');
	let btnCancel = $('.btn-cancel-reply');
	let btnDelete = $('.btn-delete-reply');
	let btnNested = $('.btn-nested-reply');
	let btnNestedCancel = $('.nested-wrap').find('.btn-cancel-reply');
	
	btnModify.each(function(idx, el) { /* 댓글 수정 */
		$(el).on('click', (e) => {
			let btnWrap = $(e.currentTarget).parents('.btn-wrap');
			let originalReplyTag = btnWrap.prev().find('p');
			let originalReplyTxt = btnWrap.prev().find('p').text();
			let btnNested = btnWrap.prev().find('.btn-nested-reply');
			let $li = $(e.currentTarget).closest('li');
			let modifyBox = btnWrap.prev().find('.modify-wrap');
			
			btnWrap.hide();
			originalReplyTag.hide();
			btnNested.hide();
			$li.css('background', '#f9f9f9');
			modifyBox.show();
			modifyBox.find('textarea').val(originalReplyTxt);
			
		});
	});
	
	btnCancel.each(function(idx, el) { /* 댓글 수정 취소 */
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
	
	btnDelete.on('click', () => { /* 댓글 삭제 */
		if(confirm("댓글을 삭제하시겠습니까?")) {
			location.replace("${ path }/delete_reply?no=${ month.chalNo }");
		} else {
			return false;
		}
	})
	
	btnNested.each(function(idx, el) { /* 답글 작성 */
		$(el).on('click', (e) => {
			let nestedWrap = $(e.currentTarget).parents('.reply-wrap').siblings('.nested-wrap');
			let targetLi = $(e.currentTarget).closest('li');
			
			nestedWrap.show();
			nestedWrap.find('textarea').focus();
			targetLi.css('background', '#f9f9f9');
		});
	});
	
	btnNestedCancel.each(function(idx, el) { /* 답글 작성 취소 */
		$(el).on('click', (e) => {
			let nestedWrap = $(e.currentTarget).parents('.nested-wrap')
			let targetLi = nestedWrap.parents('li');
			
			nestedWrap.hide();
			targetLi.css('background', 'transparent');
		});
	});
	
	$('textarea').keyup(function (e) {
		let content = $(this).val(); // 글자수 세기 
		
		if (content.length == 0 || content == '') { 
			$('.count-reply em').text('0'); 
		} else { 
			$('.count-reply em').text(content.length); 
		} 
		
		// 글자수 제한 
		if (content.length > 200) { 
			$(this).val($(this).val().substring(0, 200));
			alert('글자수가 초과되었습니다.'); 
		}; 
	});
	
}