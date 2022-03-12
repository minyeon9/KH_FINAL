package com.kh.earth.notice.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.notice.model.dao.NoticeMapper;
import com.kh.earth.notice.model.vo.Notice;

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
			
		} else {
			result = mapper.insertNotice(notice);
		}
		
		
		return result;
	}

}
