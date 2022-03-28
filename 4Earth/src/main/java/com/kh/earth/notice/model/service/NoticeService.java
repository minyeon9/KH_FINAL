package com.kh.earth.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

public interface NoticeService {

	int getNoticeCount(Map<String, String> title);
	
	int getQnaCount(Map<String, String> title);

	List<Notice> getNoticeList(PageInfo pageInfo, Map<String, String> title);
	
	List<Qna> getQnaList(PageInfo pageInfo, Map<String, String> title);

	int save(Notice notice);
	
	int qnaSave(Qna qna);

	Notice findNoticeByNo(int no);
	
	Qna findQnaByNo(int no);

	int delete(int no);
	
	int qnaDelete(int no);

	int getCategoryNo(String category);

}
