package com.kh.earth.challenge.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.NestedReply;
import com.kh.earth.challenge.model.vo.Point;
import com.kh.earth.challenge.model.vo.Reply;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.vo.Product;

@Transactional
public interface ChallengeService {
	// 오늘의 챌린지 목록 조회
	List<Today> getTodayList(String formatedNow);

	// 오늘의 챌린지 상세 조회
	Today findTodayListByNo(int chalNo);

	// 오늘의 챌린지 인증 완료 및 저장
	int saveTodayMemberList(Map<String, Object> map);
	List<TodayMember> findChalTitle(Map<String, Object> map);
	
	// 오늘의 챌린지 모두 달성 시 포인트 저장
	int savePoint(Point point);
	
	// 오늘의 챌린지 참여 회원 조회(내가 참여한 챌린지 체크)
	List<TodayMember> findTodayMemberListByNo(int no);
	

	
	
	
	
	
	// 이달의 챌린지 상세 조회 
	Month findMonthListByNo(int chalNo);

	
	// 이달의 챌린지 목록 조회 + 페이징
	int getBoardCount();
	List<Month> getMonthList(PageInfo pageInfo);
	
	// 이달의 챌린지 목록 조회 + 페이징 + 정렬
	List<Month> getMonthList(PageInfo pageInfo, String arrange);

	// 이달의 챌린지 참여 회원 저장
	int saveMonthMemberList(Map<String, Object> map);
	
	// 이달의 챌린지 완료
	List<MonthMember> findMonthCompleteList(Map<String, Object> map);
	
	// 참여 중인 사용자 목록 조회
	List<MonthMember> findOngoingUser(Map<String, Object> map);

	// 참여 중인 사용자 목록 갯수 조회
	int findOngoingUserCount(Map<String, Object> mapCount);

	// 이달의 챌린지 참여 횟수 조회
	List<MonthMember> getMonthGuage(Map<String, Object> completeCount);

	// 댓글 작성
	int saveReply(Reply reply);
	
	// 댓글 삭제
	Reply findReplyByNo(int replyNo);
	int deleteReply(int replyNo);
	


	

	// 참여 중인 챌린지 목록 조회
	List<MonthMember> findOngoingListByMemNo(int no, PageInfo pageInfo);
	// 참여 중인 챌린지 목록 갯수 조회
	int getOngoingListCount(int no);
	
	
	
	

	// 메인 - 챌린지 목록
	List<Month> findMonthBestList();
	// 메인 - 상품 목록
	List<Product> findProductList();

	
	// 오늘의 챌린지 - 인증 완료 챌린지 상세 접근 제한
	List<TodayMember> findTodayCompleteList(int no);

	
	// 대댓글 저장
	int saveNestedReply(NestedReply nestedReply);
	// 대댓글 삭제
	NestedReply findNestedReplyByNo(int nestedReplyNo);
	int deleteNestedReply(int nestedReplyNo);
	
	// 댓글 신고
	int saveReport(Report report);

	
	
	
	
	
	
	// 포인트 - 적립 목록 조회
	List<Point> findSavePointByNo(int no);
	// 포인트 - 적립 목록 갯수 조회
	int findSavePointCount(int no);

	// 포인트 - 사용 목록 조회
	List<Point> findSpendPointByNo(int no);
	// 포인트 - 사용 목록 갯수 조회
	int findSpendPointCount(int no);

	// 포인트 - 소멸 예정 목록 조회
	List<Point> findDisapearPointByNo(int no);
	// 포인트 - 소멸 예정 목록 갯수 조회
	int findDisapearPointCount(int no);

	
	
	
	
	// 적립, 사용, 소멸 내역 조회
	// List<Point> findPointListByNo(int no, PageInfo pageInfo, String arrange);
	List<Point> findPointListByNo(Map<String, Object> map);
	// 적립, 사용, 소멸 내역 갯수 조회
	int getPointCount(int no);



	 







	
}
