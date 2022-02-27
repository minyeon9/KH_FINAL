package com.kh.earth.admin.model.service;

import java.util.List;

import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.common.util.PageInfo;

public interface ReportService {

	int getReportCount();

	List<Report> getReportList(PageInfo pageInfo);

	int delete(int no);
	
}
