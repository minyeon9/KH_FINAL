package com.kh.earth.admin.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.admin.model.dao.ReportMapper;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.common.util.PageInfo;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportMapper mapper;
	
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
	public int delete(int no) {
		
		return mapper.deleteReport(no);
	}

	

}
