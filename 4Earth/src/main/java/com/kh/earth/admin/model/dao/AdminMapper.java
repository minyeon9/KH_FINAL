package com.kh.earth.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.vo.Product;

@Mapper
public interface AdminMapper {

	int getProductCount();

	List<Report> getReportList(RowBounds rowBounds);

	int deleteReport(int no);
	
	int deleteMember(int no);

	int getMemberCount();

	List<Product> getProductList(RowBounds rowBounds);

	List<Member> findMember(RowBounds rowBounds, Map<String, String> name);

	List<Reported> getReportedList(RowBounds rowBounds, String name);

	Report getReportDetail(int no);
}
