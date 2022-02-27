package com.kh.earth.admin.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.admin.model.vo.Report;

@Mapper
public interface ReportMapper {

	int getProductCount();

	List<Report> getReportList(RowBounds rowBounds);

	int deleteReport(int no);

}
