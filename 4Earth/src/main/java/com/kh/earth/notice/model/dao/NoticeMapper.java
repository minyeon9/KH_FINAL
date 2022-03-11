package com.kh.earth.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.notice.model.vo.Notice;

@Mapper
public interface NoticeMapper {

	int getNoticeCount();

	List<Notice> findAll(RowBounds rowBounds);

	int insertNotice(Notice notice);

}
