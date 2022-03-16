package com.kh.earth.notice.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

public interface NoticeService {

	int getNoticeCount();
	
	int getQnaCount();

	List<Notice> getNoticeList(PageInfo pageInfo);
	
	List<Qna> getQnaList(PageInfo pageInfo);

	int save(Notice notice);
	
	int qnaSave(Qna qna);

	Notice findNoticeByNo(int no);
	
	Qna findQnaByNo(int no);

	int delete(int no);

}
