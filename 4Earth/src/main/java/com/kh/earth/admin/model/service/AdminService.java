package com.kh.earth.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.vo.Product;

public interface AdminService {

	int getReportCount(Map<String, String> name);

	List<Report> getReportList(PageInfo pageInfo, Map<String, String> name);

	int deleteReport(int no);
	
	int getMemberCount(Map<String, String> name);
	
	List<Member> getMemberList(PageInfo pageInfo, Map<String, String> name);
	
	int deleteMember(int no);
	
	int getProductCount();

	List<Product> getProductList(PageInfo pageInfo);

	List<Reported> getReportedList(PageInfo pageInfo, Map<String, String> name);

	Report getReportDetail(int no);

	int getReportedCount();

}
