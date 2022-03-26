package com.kh.earth.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.ProInqAnswer;
import com.kh.earth.admin.model.vo.QnaAnswer;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductBidding;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.twilio.rest.api.v2010.account.Application;

@Mapper
public interface AdminMapper {

	int getProductCount(Map<String, String> name);

	List<Report> getReportList(RowBounds rowBounds, Map<String, String> name);

	int deleteReport(int no);
	
	int deleteMember(int no);

	int getMemberCount(Map<String, String> name);

	List<Product> getProductList(RowBounds rowBounds, Map<String, String> name);

	List<Reported> getReportedList(RowBounds rowBounds, Map<String, String> name);

	Report getReportDetail(int no);

	int getReportCount(Map<String, String> name);

	int getReportedCount();

	int getTodayCount();

	List<Today> getTodayList(RowBounds rowBounds, Map<String, String> name);

	int getMonthCount();

	List<Month> getMonthList(RowBounds rowBounds, Map<String, String> name);

	int getMonthMemCount();

	List<MonthMember> getMonthMemList(RowBounds rowBounds, Map<String, String> name);

	int getTodayMemCount();

	List<TodayMember> getTodayMemList(RowBounds rowBounds, Map<String, String> name);

	int insertProduct(Product product);

	Product findProductByNo(int no);

	int updateProduct(Product product);

	int getNoticeCount(Map<String, String> name);

	List<Notice> getNoticeList(RowBounds rowBounds, Map<String, String> name);

	int insertToday(Today today);

	int productImgsSave(ProductImgs productImgs);

	int insertMonth(Month month);

	Today findTodayByNo(int no);

	int updateToday(Today today);

	Month findMonthByNo(int no);

	int updateMonth(Month month);

	int monthMemPoint(int no);

	List<OrderSum> getOrderListAll(RowBounds rowBounds, Map<String, String> name);

	List<OrderDetail> getDetailList(int no);

	List<OrderDetail> findDetailByNo(int no);

	int orderDelivery(int no);

	int banMember(int no);

	int getOrderDeliveryCount(Map<String, String> name);

	List<OrderSum> getOrderDeliveryList(RowBounds rowBounds, Map<String, String> name);

	int getProInqCount(Map<String, String> name);

	List<ProductInquiry> getProInqList(RowBounds rowBounds, Map<String, String> name);

	int getApplicationCount();

	List<Application> getApplicationList(RowBounds rowBounds, String select);

	int biddingSave(ProductBidding productBidding);

	int updateApplication(int appNo);

	int cancelOrder(int no);

	int getOrderCancelCount(Map<String, String> name);

	List<OrderSum> getOrderCancelList(RowBounds rowBounds, Map<String, String> name);

	int getQnaCount(Map<String, String> name);

	List<Qna> getQnaList(RowBounds rowBounds, Map<String, String> name);

	int getQnaDoneCount(Map<String, String> name);

	List<Qna> getQnaDoneList(RowBounds rowBounds, Map<String, String> name);

	Qna findQnaByNo(int no);

	int answerQna(QnaAnswer qnaAnswer);

	int qnaDone(int no);
	
	ProductInquiry findProInqByNo(int no); 

    int answerProInq(ProInqAnswer proInqAnswer);

    int updateProInq(int no);

	int updateQna(int qnaNo);

	List<QnaAnswer> getAnswerByNo(RowBounds rowBounds, Map<String, String> name);

	int deleteToday(int no);

	int deleteMonth(int no);

	int deleteMonthMem(int no);

	int todayMemPoint(int no);

	int deleteTodayMem(int no);

	int unbanMember(int no);

	int writeNotice(Notice notice);

	int updateQna(QnaAnswer qnaAnswer);

	int deleteBidding(int no);

	int reDelivery(int no);

	Notice findNoticeByNo(int no);

	int updateNotice(Notice notice);

	int deleteNotice(int no);
	
	int getOrderCount(Map<String, String> name);

	int deleteProduct(int no);

	List<Member> getMemberList(RowBounds rowBounds, Map<String, String> name);
}
