package com.kh.earth.challenge.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.challenge.model.dao.ChallengeMapper;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.NestedReply;
import com.kh.earth.challenge.model.vo.Point;
import com.kh.earth.challenge.model.vo.Reply;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Product;


@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	private ChallengeMapper mapper;

	// 오늘의 챌린지 목록 조회
	@Override
	public List<Today> getTodayList(String formatedNow) {
		return mapper.findAllToday(formatedNow);
	}
	
	// 오늘의 챌린지 상세 및 작성
	@Override
	public Today findTodayListByNo(int chalNo) {
		return mapper.selectTodayListByNo(chalNo);
	}
	
	// 오늘의 챌린지 인증 저장
	@Override
	public int saveTodayMemberList(Map<String, Object> map) {
		return mapper.insertTodayMember(map);
	}
	
	// 오늘의 챌린지 달성 시 포인트 저장
	@Override
	public int savePoint(Point point) {
		int result = 0;
		
		if( point.getNo() != 0 ) {
			// result = mapper.updateBoard(board);
		} else {
			result = mapper.insertPoint(point);
		}
		
		return result;
	}
	
	// 오늘의 챌린지 인증 완료
	@Override
	public List<TodayMember> findChalTitle(Map<String, Object> map) {
		return mapper.findChalTitle(map);
	}
	
	// 오늘의 챌린지 참여 회원 목록 조회
	@Override
	public List<TodayMember> findTodayMemberListByNo(int no) {
		return mapper.selectTodayMemberListByNo(no);
	}
	
	
	
	
	
	
	

	// 이달의 챌린지 상세 조회
	@Override
	public Month findMonthListByNo(int chalNo) {
		return mapper.selectMonthListByNo(chalNo);
	}
	
	// 이달의 챌린지 목록 조회 + 페이징
	@Override
	public int getBoardCount() {
		return mapper.getBoardCount();
	}

	@Override
	public List<Month> getMonthList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAllMonth(rowBounds);
	}

	// 이달의 챌린지 목록 조회 + 정렬
	@Override
	public List<Month> getMonthList(PageInfo pageInfo, String arrange) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAllMonthArrange(rowBounds, arrange);
	}
	
	// 이달의 챌린지 참여 회원 저장
	@Override
	public int saveMonthMemberList(Map<String, Object> map) {
		return mapper.insertMonthMember(map);
	}
	
	// 이달의 챌린지 완료
	@Override
	public List<MonthMember> findMonthCompleteList(Map<String, Object> map) {
		return mapper.findMonthCompleteList(map);
	}

	// 참여 중인 사용자 목록 조회
	@Override
	public List<MonthMember> findOngoingUser(Map<String, Object> map) {
		return mapper.findOngoingUserList(map);
	}

	// 참여 중인 사용자 목록 갯수 조회
	@Override
	public int findOngoingUserCount(Map<String, Object> mapCount) {
		return mapper.findOngoingUserCount(mapCount);
	}

	// 이달의 챌린지 참여 횟수 조회
	@Override
	public List<MonthMember> getMonthGuage(Map<String, Object> completeCount) {
		return mapper.getMonthGuage(completeCount);
	}

	// 댓글 작성
	@Override
	@Transactional
	public int saveReply(Reply reply) {
		int result = 0;
		
		if( reply.getReplyNo() != 0 ) {
			result = mapper.updateReply(reply);
		} else {
			result = mapper.insertReply(reply);
		}
		
		return result;
	}

	// 댓글 번호 조회(삭제)
	@Override
	public Reply findReplyByNo(int replyNo) {
		return mapper.findReplyByNo(replyNo);
	}
	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return mapper.deleteReply(replyNo);
	}
	
	
	
//	@Override
//	public List<Month> getMonthList(PageInfo pageInfo) {
//		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		int limit = pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return mapper.findAllMonth(rowBounds);
//	}
	
	
	
	// 참여 중인 챌린지 목록 조회
	@Override
	public List<MonthMember> findOngoingListByMemNo(int no, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findOngoingListByMemNo(no, rowBounds);
	}
	
	// 참여 중인 챌린지 목록 갯수 조회
	@Override
	public int getOngoingListCount(int no) {
		return mapper.getOngoingListCount(no);
	}
	
	
	
	
	

	// 메인 - 챌린지 목록
	@Override
	public List<Month> findMonthBestList() {
		return mapper.findMonthBestList();
	}

	// 메인 - 상품 목록
	@Override
	public List<Product> findProductList() {
		return mapper.findProductBestList();
	}

	@Override
	public List<TodayMember> findTodayCompleteList(int no) {
		return mapper.findTodayCompleteList(no);
	}

	
	// 대댓글 저장
	@Override
	@Transactional
	public int saveNestedReply(NestedReply nestedReply) {
		int result = 0;
		
		if( nestedReply.getNestedReplyNo() != 0 ) {
			result = mapper.updateNestedReply(nestedReply);
		} else {
			result = mapper.insertNestedReply(nestedReply);
		}
		
		return result;
	}
	
	// 대댓글 삭제
	@Override
	public NestedReply findNestedReplyByNo(int nestedReplyNo) {
		return mapper.findNestedReplyByNo(nestedReplyNo);
	}
	// 대댓글 삭제
	@Override
	public int deleteNestedReply(int nestedReplyNo) {
		return mapper.deleteNestedReply(nestedReplyNo);
	}

	// 댓글 신고
	@Override
	public int saveReport(Report report) {
		int result = 0;
		
		if( report.getReportNo() != 0 ) {
			// result = mapper.updateNestedReply(nestedReply);
		} else {
			result = mapper.insertReport(report);
		}
		
		return result;
	}

	
	
	
	// 포인트 - 적립 목록 조회
	@Override
	public List<Point> findSavePointByNo(int no) {
		return mapper.findSavePointByNo(no);
	}
	// 포인트 - 적립 목록 갯수 조회
	@Override
	public int findSavePointCount(int no) {
		return mapper.findSavePointCount(no);
	}
	
	// 포인트 - 사용 목록 조회
	@Override
	public List<Point> findSpendPointByNo(int no) {
		return mapper.findSpendPointByNo(no);
	}
	// 포인트 - 사용 목록 갯수 조회
	@Override
	public int findSpendPointCount(int no) {
		return mapper.findSpendPointCount(no);
	}
	

	// 포인트 - 소멸 예정 목록 조회
	@Override
	public List<Point> findDisapearPointByNo(int no) {
		return mapper.findDisapearPointByNo(no);
	}
	// 포인트 - 소멸 예정 목록 갯수 조회
	@Override
	public int findDisapearPointCount(int no) {
		return mapper.findDisapearPointCount(no);
	}

	
	
	
	
	
	
	// 적립, 사용, 소멸 내역 조회
//	@Override
//	public List<Point> findPointListByNo(int no, PageInfo pageInfo, String arrange) {
//		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
//		int limit = pageInfo.getListLimit();
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return mapper.findPointListByNo(no, rowBounds, arrange);
//	}
	@Override
	public List<Point> findPointListByNo(Map<String, Object> map) {
		return mapper.findPointListByNo(map);
	}

	// 적립, 사용, 소멸 내역 갯수 조회
	@Override
	public int getPointCount(int no) {
		return mapper.getPointCount(no);
	}

	
	

	

	


	

	

	

	

}
