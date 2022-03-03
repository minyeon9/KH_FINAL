package com.kh.earth.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.admin.model.dao.AdminMapper;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.vo.Product;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int getReportCount() {
		
		return mapper.getProductCount();
	}

	@Override
	public List<Report> getReportList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getReportList(rowBounds);
	}
	
	@Override
	public int deleteReport(int no) {
		
		return mapper.deleteReport(no);
	}
	
	@Override
	public int deleteMember(int no) {
		
		return mapper.deleteMember(no);
	}
	
	@Override
	public int getMemberCount() {
		
		return mapper.getMemberCount();
	}
	
	@Override
	public List<Member> getMemberList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findMember(rowBounds);
	}
	
	@Override
	public int getProductCount() {
		
		return mapper.getProductCount();
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getProductList(rowBounds);
	}

	@Override
	public List<Reported> getReportedList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getReportedList(rowBounds);
	}

	@Override
	public Report getReportDetail(int no) {
		
		return mapper.getReportDetail(no);
	}

	

}
