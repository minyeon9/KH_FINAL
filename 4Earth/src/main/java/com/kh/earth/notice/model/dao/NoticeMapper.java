package com.kh.earth.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

@Mapper
public interface NoticeMapper {


	int getNoticeCount(Map<String, String> title);
	
	int getQnaCount(Map<String, String> title);

	List<Notice> findAll(RowBounds rowBounds, Map<String, String> title);
	
	List<Qna> findAllQna(RowBounds rowBounds, Map<String, String> title);

	int insertNotice(Notice notice);
	
	int qnaInsert(Qna qna);

	Notice selectNoticeByNo(@Param("no") int no);
	
	Qna selectQnaByNo(@Param("no") int no);
	
	int modifyNotice(Notice notice);

	int qnaModify(Qna qna);

	int modifyStatus(@Param("no") int no, @Param("status") String status);

	int qnaModifyStatus(@Param("no") int no, @Param("status") String status);
	
	int getCategoryNo(String category);
}
