package com.kh.earth.notice.model.service;

import java.util.List;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.notice.model.vo.Notice;

public interface NoticeService {

	int getNoticeCount();

	List<Notice> getNoticeList(PageInfo pageInfo);

	int save(Notice notice);

}
