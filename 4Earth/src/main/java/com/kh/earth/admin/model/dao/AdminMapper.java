package com.kh.earth.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductImgs;

@Mapper
public interface AdminMapper {

	int getProductCount(Map<String, String> name);

	List<Report> getReportList(RowBounds rowBounds, Map<String, String> name);

	int deleteReport(int no);
	
	int deleteMember(int no);

	int getMemberCount(Map<String, String> name);

	List<Product> getProductList(RowBounds rowBounds, Map<String, String> name);

	List<Member> findMember(RowBounds rowBounds, Map<String, String> name);

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
}
