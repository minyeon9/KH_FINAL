package com.kh.earth.notice.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

@Mapper
public interface NoticeMapper {


	int getNoticeCount();
	
	int getQnaCount();

	List<Notice> findAll(RowBounds rowBounds);
	
	List<Qna> findAllQna(RowBounds rowBounds);

	int insertNotice(Notice notice);
	
	int qnaInsert(Qna qna);

	Notice selectNoticeByNo(@Param("no") int no);
	
	Qna selectQnaByNo(@Param("no") int no);
	
	int modifyNotice(Notice notice);

	int qnaModify(Qna qna);

	int modifyStatus(@Param("no") int no, @Param("status") String status);

	int getCategoryNo(String category);

}
