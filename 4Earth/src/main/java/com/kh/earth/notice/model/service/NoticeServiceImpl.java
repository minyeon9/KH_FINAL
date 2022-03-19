package com.kh.earth.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.notice.model.dao.NoticeMapper;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper mapper;

	@Override
	public int getNoticeCount() {

		return mapper.getNoticeCount();
	}

	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAll(rowBounds);
	}

	@Override
	@Transactional
	public int save(Notice notice) {
		int result = 0;
		
		if(notice.getNo() != 0) {
			result = mapper.modifyNotice(notice);
		} else {
			result = mapper.insertNotice(notice);
		}
		
		return result;
	}

	@Override
	public Notice findNoticeByNo(int no) {
		
		return mapper.selectNoticeByNo(no);
	}
	

	@Override
	@Transactional
	public int delete(int no) {
		return mapper.modifyStatus(no, "N");
	}
	
	

	@Override
	public List<Qna> getQnaList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAllQna(rowBounds);
	}

	@Override
	public int getQnaCount() {
		return mapper.getQnaCount();
	}

	@Override
	@Transactional
	public int qnaSave(Qna qna) {
		int result = 0;
				
		if(qna.getNo() != 0) {
			result = mapper.qnaModify(qna);
		} else {
			result = mapper.qnaInsert(qna);
		}
		
		return result;
	}

	@Override
	public Qna findQnaByNo(int no) {
		
		return mapper.selectQnaByNo(no);
	}



}
