package com.lmd.ggzy.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.domain.GgzyBidPro;
import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyBusinessTypeWay;
import com.lmd.ggzy.domain.GgzyNotice;
import com.lmd.ggzy.domain.GgzyNoticeTenders;
import com.lmd.ggzy.domain.GgzyTreeLib;
import com.lmd.ggzy.domain.assist.BusinessTypeReport;
import com.lmd.ggzy.jdbc.template.ReportDao;
import com.lmd.ggzy.service.GgzyBidProService;
import com.lmd.ggzy.service.GgzyBusinessTypeService;
import com.lmd.ggzy.service.GgzyNoticeService;
import com.lmd.ggzy.service.GgzyTreeLibService;
import com.lmd.ggzy.service.BaseService.RepoMethod;

@Service
public class BusinessReportService {

	@Autowired
	private GgzyBidProService bidProService;

	@Autowired
	private GgzyBusinessTypeService businessTypeService;

	@Autowired
	private GgzyNoticeService noticeService;

	@Autowired
	private GgzyTreeLibService areaService;

	@Autowired
	private ReportDao reportDao;

	/**
	 * 统计各业务类型交易标段数量,成交额
	 * 
	 * @param businessTypeReports
	 * @param noticeTenders
	 * @return
	 */
	@Transactional(readOnly = true)
	public BusinessTypeReport calBusinessTypeReport(List<BusinessTypeReport> businessTypeReports, GgzyNoticeTenders noticeTenders) {
		GgzyBusinessType businessType = noticeTenders.getTenders().getBidPro().getBusinessType();
		BusinessTypeReport report = findBusinessTypeReport(businessTypeReports, businessType);
		report.addCount();
		report.addPrice(noticeTenders.getBiddingCandidate().getApplyTender().getGgzyBidDocs().getPrice());
		return report;
	}

	@Transactional(readOnly = true)
	public BusinessTypeReport findBusinessTypeReport(List<BusinessTypeReport> businessTypeReports, GgzyBusinessType businessType) {
		for (BusinessTypeReport report : businessTypeReports) {
			if (report.getBusinessType().getBusinessTypeId().equals(businessType.getBusinessTypeId())) {
				return report;
			}
		}
		BusinessTypeReport report = new BusinessTypeReport(businessType, 0, BigDecimal.ZERO);
		businessTypeReports.add(report);
		return report;
	}

	/**
	 * 创建业务类型统计对象
	 * 
	 * @param businessType
	 * @return
	 */
	public BusinessTypeReport createBusinessTypeReport(GgzyBusinessType businessType) {
		return new BusinessTypeReport(businessType, 0, BigDecimal.ZERO);
	}

	/**
	 * 批量创建业务类型统计对象
	 * 
	 * @param businessTypes
	 * @return
	 */
	public List<BusinessTypeReport> createBusinessTypeReports(List<GgzyBusinessType> businessTypes) {
		List<BusinessTypeReport> businessTypeReports = new ArrayList<BusinessTypeReport>();
		if (businessTypes != null) {
			for (GgzyBusinessType businessType : businessTypes) {
				businessTypeReports.add(createBusinessTypeReport(businessType));
			}
		}
		return businessTypeReports;
	}

	/**
	 * 进场登记业务类型统计
	 */
	@Transactional(readOnly = true)
	public List<BusinessTypeReport> analysisRegister(Specification<GgzyBidPro> specification) {
		List<BusinessTypeReport> businessTypeReports = createBusinessTypeReports(businessTypeService.findByExample(GgzyBusinessType.notVirtual));
		for (GgzyBidPro bidPro : (List<GgzyBidPro>) bidProService.callRepositoryMethod(RepoMethod.findAll, specification)) {
			BusinessTypeReport businessTypeReport = findBusinessTypeReport(businessTypeReports, bidPro.getBusinessType());
			businessTypeReport.addCount();
		}
		Collections.sort(businessTypeReports);
		return businessTypeReports;
	}

	/**
	 * 发布公告业务类型统计
	 * 
	 * @param specification
	 * @return
	 */
	@Transactional(readOnly = true)
	public List<BusinessTypeReport> analysisNotice(Specification<GgzyNotice> specification) {
		List<BusinessTypeReport> businessTypeReports = createBusinessTypeReports(businessTypeService.findByExample(GgzyBusinessType.notVirtual));
		for (GgzyNotice notice : (List<GgzyNotice>) noticeService.callRepositoryMethod(RepoMethod.findAll, specification)) {
			BusinessTypeReport businessTypeReport = findBusinessTypeReport(businessTypeReports, notice.getBidPro().getBusinessType());
			businessTypeReport.addCount();
		}
		Collections.sort(businessTypeReports);
		return businessTypeReports;
	}

	/**
	 * 开标标段统计
	 * 
	 * @return
	 */
	public List analysisOpenning(Map<String, ?> params) {
		String sql = "select bw.*,nvl(ct.total,0) total from ggzy_business_type bw left join (select count(1) total, business_type_id from ggzy_bid_opening bo join ggzy_notice t on t.notice_id=bo.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id) ct on ct.business_type_id=bw.business_type_id where bw.virtual_Type=0 order by bw.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 废标统计
	 * 
	 * @return
	 */
	public List analysisException(Map<String, ?> params, String step) {
		String sql = "select bw.*,nvl(ct.total,0) total from ggzy_business_type bw left join (select count(1) total, business_type_id from ggzy_exceptional_case ec join ggzy_notice n on n.notice_id=ec.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime and ec.step=:step group by bp.business_type_id) ct on ct.business_type_id=bw.business_type_id where bw.virtual_Type=0 order by bw.sort_index";
		Map<String, Object> params_ = new HashMap<String, Object>(params);
		params_.put("step", step);
		return reportDao.queryForMap(sql, params_);
	}

	/**
	 * 评标情况统计
	 * 
	 * @return
	 */
	public List analysisEval(Map<String, ?> params) {
		String sql = "select bw.*,nvl(ct.total,0) total,nvl(price,0) price from ggzy_business_type bw left join (select count(1) total, business_type_id, sum(bd.price) price from ggzy_evaluation_report er join ggzy_notice t on t.notice_id=er.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id join ggzy_bidding_candidate bc on bc.notice_id=er.notice_id and bc.tenders_id=er.tenders_id join ggzy_apply_tender at on at.apply_tender_id=bc.apply_tender_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id) ct on ct.business_type_id=bw.business_type_id where bw.virtual_Type=0 order by bw.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 中标公示统计
	 * 
	 * @return
	 */
	public List analysisPulicity(Map<String, ?> params) {
		String sql = "select bw.*,nvl(ct.total,0) total from ggzy_business_type bw left join (select count(1) total, business_type_id from ggzy_bid_publicity bp join ggzy_notice n on n.notice_id=bp.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(bp.audit_time,'yyyy-mm-dd') >= :startTime and to_char(bp.audit_time,'yyyy-mm-dd') <= :endTime group by bp.business_type_id) ct on ct.business_type_id=bw.business_type_id where bw.virtual_Type=0 order by bw.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 中标通知统计
	 * 
	 * @param params
	 * @return
	 */
	public List analysisResNotice(Map<String, ?> params) {
		String sql = "select bw.*,nvl(ct.total,0) total from ggzy_business_type bw left join (select count(1) total, business_type_id from ggzy_bidding_res_notice bp join ggzy_notice n on n.notice_id=bp.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(bp.print_time,'yyyy-mm-dd') >= :startTime and to_char(bp.print_time,'yyyy-mm-dd') <= :endTime group by bp.business_type_id) ct on ct.business_type_id=bw.business_type_id where bw.virtual_Type=0 order by bw.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计各类业务中标次数排名第一的企业
	 * 
	 * @param params
	 * @return
	 */
	public List analysisBusinessFirst(Map<String, ?> params) {
		String sql = "select bt.name,bid.*,bs.subject_name from ( select * from ( select row_number() over(partition by business_type_id order by bid_amount desc,apply_amount desc) rn,bid.* from (select business_type_id, bid.bidding_subject_id,bid.apply_amount, bid.bid_amount, bid.bid_price,round(bid.bid_amount/bid.apply_amount,4 )* 100 prob from (select business_type_id, a.bidding_subject_id, count(1) apply_amount ,sum(case when at.apply_tender_id=bc.apply_tender_id then 1 else 0 end)bid_amount, sum(case when at.apply_tender_id=bc.apply_tender_id then bd.price else 0 end)bid_price from ggzy_apply_tender at join ggzy_apply a on a.apply_id=at.apply_id join ggzy_bidding_candidate bc on bc.notice_id=at.notice_id and at.tenders_id=bc.tenders_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id  join ggzy_notice t on t.notice_id=at.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group  by business_type_id,a.bidding_subject_id) bid) bid) where rn = 1) bid join ggzy_business_type bt on bt.business_type_id=bid.business_type_id join ggzy_bidding_subject bs on bs.bidding_subject_id=bid.bidding_subject_id order by bt.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计各类业务专家参与情况
	 * 
	 * @param params
	 * @return
	 */
	public List analysisExpert(Map<String, ?> params) {
		String sql = "select bt.name, bid.* from ggzy_business_type bt join (select business_type_id, count(1) total, sum(ea.total) etotal, sum(bd.price) price from ggzy_evaluation_report er join ggzy_expert_apply ea on ea.notice_id=er.notice_id and ea.tenders_id=er.tenders_id join ggzy_bidding_candidate bc on bc.notice_id=er.notice_id and bc.tenders_id=er.tenders_id join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=ea.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime  group by bp.business_type_id) bid on bt.business_type_id=bid.business_type_id";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 代理机构代理业务统计
	 * 
	 * @param params
	 * @param sortType
	 *            排名方式,0代理数量,1代理金额
	 * @return
	 */
	public List analysisAgency(Map<String, ?> params, int sortType) {
		String sql = "select bid.*,to_char(round(bid.amount/bid.amount_total,4)*100,'fm9999999900.00') amount_prob,to_char(round(bid.bid_price/bid.price_total,4)*100,'fm9999999900.00') price_prob, bt.name, bs.subject_name from (select bid.* from (select bid.*,sum(bid_price) over(partition by business_type_id) price_total, sum(amount) over(partition by business_type_id) amount_total, row_number() over(partition by business_type_id order by " + (sortType == 0 ? "amount" : "bid_price") + " desc) rn from ( select business_type_id, bp.agency_id bidding_subject_id, count(1) amount , sum( bd.price)bid_price from ggzy_apply_tender at join ggzy_apply a on a.apply_id=at.apply_id join ggzy_bidding_candidate bc on bc.notice_id=at.notice_id and at.tenders_id=bc.tenders_id and bc.apply_tender_id=at.apply_tender_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id  join ggzy_notice t on t.notice_id=at.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime  group  by business_type_id,bp.agency_id) bid)bid where rn=1)bid join ggzy_business_type bt on bt.business_type_id=bid.business_type_id join ggzy_bidding_subject bs on bs.bidding_subject_id=bid.bidding_subject_id order by bt.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 专家参与次数统计,取每类业务专家参与次数前三名
	 * 
	 * @param params
	 * @param sortType
	 * @return
	 */
	public List analysisExpertAmount(Map<String, ?> params, int sortType) {
		String sql = "select bt.name,e.name expert_name, p.total,expert.*,to_char(round(expert.amount/p.total,4)*100,'fm9999999900.00') amount_prob from (select  expert.*, sum(amount) over(partition by business_type_id ) etotal, row_number() over(partition by business_type_id order by amount desc) rn from (select bp.business_type_id,ae.expert_id, count(1) amount from ggzy_bidding_candidate bc join ggzy_expert_apply ea on bc.notice_id=ea.notice_id and ea.tenders_id=bc.tenders_id join ggzy_assessment_expert ae on ae.expert_apply_id=ea.id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where ae.expert_id is not null and  to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id,ae.expert_id)expert) expert join (select business_type_id, count(1) total from ggzy_bidding_candidate bc join ggzy_expert_apply ea on bc.notice_id=ea.notice_id and ea.tenders_id=bc.tenders_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime  group by bp.business_type_id )p on p.business_type_id=expert.business_type_id join ggzy_business_type bt on bt.business_type_id=expert.business_type_id join ggzy_expert e on e.id=expert.expert_id where rn<4 order by bt.sort_index, rn";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计指定业务类型专家参与次数前20名
	 * 
	 * @param params
	 * @param sortType
	 * @return
	 */
	public List analysisBusinessExpert(Map<String, ?> params, int sortType) {
		String sql = "select bt.name,e.name expert_name, p.total,expert.*,to_char(round(expert.amount/p.total,4)*100,'fm9999999900.00') amount_prob from (select  expert.*, sum(amount) over(partition by business_type_id ) etotal, row_number() over(partition by business_type_id order by amount desc) rn from (select bp.business_type_id,ae.expert_id, count(1) amount from ggzy_bidding_candidate bc join ggzy_expert_apply ea on bc.notice_id=ea.notice_id and ea.tenders_id=bc.tenders_id join ggzy_assessment_expert ae on ae.expert_apply_id=ea.id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where ae.expert_id is not null and  to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id,ae.expert_id)expert) expert join (select business_type_id, count(1) total from ggzy_bidding_candidate bc join ggzy_expert_apply ea on bc.notice_id=ea.notice_id and ea.tenders_id=bc.tenders_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime  group by bp.business_type_id )p on p.business_type_id=expert.business_type_id join ggzy_business_type bt on bt.business_type_id=expert.business_type_id join ggzy_expert e on e.id=expert.expert_id where rn<21 and bt.business_type_id=:business_type_id order by bt.sort_index, rn";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 按专业类型统计
	 * 
	 * @param businessType
	 * @param params
	 * @return
	 */
	public List analysisMajor(GgzyBusinessType businessType, Map<String, ?> params) {
		String sql = "select business_type_id, major_type_id,sum(price) price, count(1) total";
		for (GgzyBusinessTypeWay businessTypeWay : businessType.getGgzyBusinessTypeWays()) {
			sql += ", sum(decode(business_way_id,'" + businessTypeWay.getBusinessWay().getBusinessWayId() + "', 1, 0)) " + businessTypeWay.getBusinessWay().getCode();
		}
		sql += " from (select bp.bid_pro_id,bp.business_way_id,bp.business_type_id,bp.major_type_id,bap.area_code,bd.price from ggzy_bidding_candidate bc join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id join ggzy_base_pro bap on bap.base_pro_id=bp.base_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime) group by business_type_id, major_type_id";
		sql = "select p.*,mt.name from (" + sql + ")p join ggzy_major_type mt on mt.major_type_id=p.major_type_id join ggzy_business_type_major btm on btm.major_type_id=mt.major_type_id and btm.business_type_id=:business_type_id and p.business_type_id=btm.business_type_id order by btm.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 按区域统计
	 * 
	 * @param businessType
	 * @param params
	 * @return
	 */
	public List analysisArea(GgzyBusinessType businessType, Map<String, ?> params) {
		String sql = "select business_type_id, area_code,sum(price) price, count(1) total";
		for (GgzyBusinessTypeWay businessTypeWay : businessType.getGgzyBusinessTypeWays()) {
			sql += ", sum(decode(business_way_id,'" + businessTypeWay.getBusinessWay().getBusinessWayId() + "', 1, 0)) " + businessTypeWay.getBusinessWay().getCode();
		}
		sql += " from (select bp.bid_pro_id,bp.business_way_id,bp.business_type_id,bp.major_type_id,bap.area_code,bd.price from ggzy_bidding_candidate bc join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id join ggzy_base_pro bap on bap.base_pro_id=bp.base_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime) group by business_type_id, area_code";
		sql = "select p.*,tr.name from (" + sql + ")p join ggzy_treelib tr on tr.id=p.area_code where p.business_type_id=:business_type_id order by tr.priority";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 各专业类型企业参与情况
	 * 
	 * @param businessType
	 * @param params
	 * @return
	 */
	public List analysisMajorApply(GgzyBusinessType businessType, Map<String, ?> params) {
		String sql = "select business_type_id, major_type_id,sum(price) price,sum(atotal) atotal,sum(attotal) attotal, count(1) total";
		for (GgzyBusinessTypeWay businessTypeWay : businessType.getGgzyBusinessTypeWays()) {
			sql += ", sum(decode(business_way_id,'" + businessTypeWay.getBusinessWay().getBusinessWayId() + "', 1, 0)) " + businessTypeWay.getBusinessWay().getCode();
		}
		sql += " from (select bp.bid_pro_id,bp.business_way_id,bp.business_type_id,bp.major_type_id,bap.area_code,bd.price,a.atotal,at.attotal  from ggzy_bidding_candidate bc join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id join ggzy_base_pro bap on bap.base_pro_id=bp.base_pro_id join (select a.notice_id, count(1) atotal from ggzy_apply a group by a.notice_id) a on a.notice_id=n.notice_id join (select at.notice_id,at.tenders_id, count(1) attotal from ggzy_apply_tender at group by at.notice_id,at.tenders_id) at on at.notice_id=bc.notice_id and at.tenders_id=bc.tenders_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime) group by business_type_id, major_type_id";
		sql = "select p.*,mt.name from (" + sql + ")p join ggzy_major_type mt on mt.major_type_id=p.major_type_id join ggzy_business_type_major btm on btm.major_type_id=mt.major_type_id and btm.business_type_id=:business_type_id and p.business_type_id=btm.business_type_id order by btm.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计各专业类型企业中标情况,中标
	 * 
	 * @param businessType
	 * @param params
	 * @return
	 */
	public List analysisMajorBid(GgzyBusinessType businessType, Map<String, ?> params) {
		String sql = "select bs.subject_name, mt.name,p.total,to_char(round(bid.apply_amount/p.total,4)*100,'fm9999999900.00')apply_prob, bid.* from ( select row_number() over( partition by business_type_id,major_type_id order by bid_amount desc,apply_amount desc) rn,bid.* from (select major_type_id, business_type_id, bid.bidding_subject_id,bid.apply_amount, bid.bid_amount, bid.bid_price,to_char(round(bid.bid_amount/bid.apply_amount,4 )* 100,'fm9999999900.00') prob from (select major_type_id, business_type_id, a.bidding_subject_id, count(1) apply_amount ,sum(case when at.apply_tender_id=bc.apply_tender_id then 1 else 0 end)bid_amount, sum(case when at.apply_tender_id=bc.apply_tender_id then bd.price else 0 end)bid_price from ggzy_apply_tender at join ggzy_apply a on a.apply_id=at.apply_id join ggzy_bidding_candidate bc on bc.notice_id=at.notice_id and at.tenders_id=bc.tenders_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id  join ggzy_notice t on t.notice_id=at.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group  by business_type_id,major_type_id,a.bidding_subject_id) bid) bid) bid join (select bp.business_type_id,bp.major_type_id,count(1) total from ggzy_notice_tenders nt join ggzy_notice n on n.notice_id=nt.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where exists(select 1 from ggzy_bidding_candidate bc where bc.notice_id=nt.notice_id and bc.tenders_id=nt.tenders_id) and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id,bp.major_type_id) p on p.major_type_id=bid.major_type_id and p.business_type_id=bid.business_type_id join ggzy_business_type_major btm on btm.business_type_id=bid.business_type_id and bid.major_type_id=btm.major_type_id join ggzy_major_type mt on btm.major_type_id=mt.major_type_id join ggzy_business_type bt on bt.business_type_id=bid.business_type_id join ggzy_bidding_subject bs on bs.bidding_subject_id=bid.bidding_subject_id where rn < 4 and bid.business_type_id=:business_type_id order by bt.sort_index, btm.sort_index,rn";

		return reportDao.queryForMap(sql, params);
	}

	public List analysisMajorBid20(GgzyBusinessType businessType, Map<String, ?> params) {
		String sql = "select bs.subject_name, mt.name,p.total,to_char(round(bid.apply_amount/p.total,4)*100,'fm9999999900.00')apply_prob, bid.* from ( select row_number() over( partition by business_type_id,major_type_id order by bid_amount desc,apply_amount desc) rn,bid.* from (select major_type_id, business_type_id, bid.bidding_subject_id,bid.apply_amount, bid.bid_amount, bid.bid_price,to_char(round(bid.bid_amount/bid.apply_amount,4 )* 100,'fm9999999900.00') prob from (select major_type_id, business_type_id, a.bidding_subject_id, count(1) apply_amount ,sum(case when at.apply_tender_id=bc.apply_tender_id then 1 else 0 end)bid_amount, sum(case when at.apply_tender_id=bc.apply_tender_id then bd.price else 0 end)bid_price from ggzy_apply_tender at join ggzy_apply a on a.apply_id=at.apply_id join ggzy_bidding_candidate bc on bc.notice_id=at.notice_id and at.tenders_id=bc.tenders_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id  join ggzy_notice t on t.notice_id=at.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group  by business_type_id,major_type_id,a.bidding_subject_id) bid) bid) bid join (select bp.business_type_id,bp.major_type_id,count(1) total from ggzy_notice_tenders nt join ggzy_notice n on n.notice_id=nt.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where exists(select 1 from ggzy_bidding_candidate bc where bc.notice_id=nt.notice_id and bc.tenders_id=nt.tenders_id) and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime group by bp.business_type_id,bp.major_type_id) p on p.major_type_id=bid.major_type_id and p.business_type_id=bid.business_type_id join ggzy_business_type_major btm on btm.business_type_id=bid.business_type_id and bid.major_type_id=btm.major_type_id join ggzy_major_type mt on btm.major_type_id=mt.major_type_id join ggzy_business_type bt on bt.business_type_id=bid.business_type_id join ggzy_bidding_subject bs on bs.bidding_subject_id=bid.bidding_subject_id where rn < 21 and bid.business_type_id=:business_type_id and mt.major_type_id=:major_type_id order by bt.sort_index, btm.sort_index,rn";

		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计指定业务类型下,代理机构代理项目情况,取前5
	 * 
	 * @param params
	 * @param sortType
	 * @return
	 */
	public List analysisBusinessAgency(Map<String, ?> params, int sortType) {
		String sql = "select bid.*,to_char(round(bid.amount/bid.amount_total,4)*100,'fm9999999900.00') amount_prob,to_char(round(bid.bid_price/bid.price_total,4)*100,'fm9999999900.00') price_prob, bt.name, bs.subject_name from (select bid.* from (select bid.*,sum(bid_price) over(partition by business_type_id) price_total, sum(amount) over(partition by business_type_id) amount_total, row_number() over(partition by business_type_id order by " + (sortType == 0 ? "amount desc,bid_price" : "bid_price desc, amount") + " desc) rn from ( select business_type_id, bp.agency_id bidding_subject_id, count(1) amount , sum( bd.price)bid_price from ggzy_apply_tender at join ggzy_apply a on a.apply_id=at.apply_id join ggzy_bidding_candidate bc on bc.notice_id=at.notice_id and at.tenders_id=bc.tenders_id and bc.apply_tender_id=at.apply_tender_id join ggzy_bid_doc bd on bd.apply_tender_id=at.apply_tender_id  join ggzy_notice t on t.notice_id=at.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=t.bid_pro_id where to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(t.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime  group  by business_type_id,bp.agency_id) bid)bid where rn<6)bid join ggzy_business_type bt on bt.business_type_id=bid.business_type_id join ggzy_bidding_subject bs on bs.bidding_subject_id=bid.bidding_subject_id where bid.business_type_id=:business_type_id order by bt.sort_index,rn";
		return reportDao.queryForMap(sql, params);
	}

	/**
	 * 统计各类业务专家参与情况
	 * 
	 * @param params
	 * @return
	 */
	public List analysisBusinessExpert(Map<String, ?> params) {
		String sql = "select mt.name, bid.* from ggzy_business_type bt join (select business_type_id,major_type_id, count(1) total, sum(ea.total) etotal, sum(bd.price) price from ggzy_evaluation_report er join ggzy_expert_apply ea on ea.notice_id=er.notice_id and ea.tenders_id=er.tenders_id join ggzy_bidding_candidate bc on bc.notice_id=er.notice_id and bc.tenders_id=er.tenders_id join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=ea.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id where to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime and bp.business_type_id=:business_type_id group by bp.business_type_id,bp.major_type_id) bid on bt.business_type_id=bid.business_type_id join ggzy_business_type_major btm on btm.business_type_id=bid.business_type_id and btm.major_type_id=bid.major_type_id join ggzy_major_type mt on mt.major_type_id=bid.major_type_id order by bt.sort_index, btm.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	public List anslysisBusinessMajorPrice(Map<String, ?> params) {
		String sql = "select mt.name, bid.*,to_char(round(mtotal/total,4)*100, 'fm9999999990.00') amount_prob, to_char(prob*100, 'fm9999999990.00') price_prob, compute_price-bid_price save_price from (select business_type_id,major_type_id,sum(price) bid_price, sum(compute_price) compute_price,count(1) mtotal,sum(count(1)) over(partition by business_type_id) total,round(avg((compute_price-price)/compute_price),4) prob from (select bp.bid_pro_id,bp.business_way_id,bp.business_type_id,bp.major_type_id,bap.area_code,bd.price,t.compute_value*decode(tr.code,'1', 1, 10000) compute_price from ggzy_bidding_candidate bc join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id join ggzy_base_pro bap on bap.base_pro_id=bp.base_pro_id join ggzy_tenders t on t.tenders_id=bc.tenders_id left join ggzy_treelib tr on tr.id=t.compute_unit where bp.business_type_id=:business_type_id and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime)bid group by business_type_id,major_type_id) bid join ggzy_business_type_major btm on btm.business_type_id=bid.business_type_id and btm.major_type_id=bid.major_type_id join ggzy_major_type mt on btm.major_type_id=mt.major_type_id order by btm.sort_index";
		return reportDao.queryForMap(sql, params);
	}

	public List anslysisBusinessAreaPrice(Map<String, ?> params) {
		String sql = "select tr.name, bid.*,to_char(round(mtotal/total,4)*100, 'fm9999999990.00') amount_prob, to_char(prob*100, 'fm9999999990.00') price_prob, compute_price-bid_price save_price from (select business_type_id,area_code,sum(price) bid_price, sum(compute_price) compute_price,count(1) mtotal,sum(count(1)) over(partition by business_type_id) total,round(avg((compute_price-price)/compute_price),4) prob from (select bp.bid_pro_id,bp.business_way_id,bp.business_type_id,bp.major_type_id,bap.area_code,bd.price,t.compute_value*decode(tr.code,'1', 1, 10000) compute_price from ggzy_bidding_candidate bc join ggzy_bid_doc bd on bd.apply_tender_id=bc.apply_tender_id join ggzy_notice n on n.notice_id=bc.notice_id join ggzy_bid_pro bp on bp.bid_pro_id=n.bid_pro_id join ggzy_base_pro bap on bap.base_pro_id=bp.base_pro_id join ggzy_tenders t on t.tenders_id=bc.tenders_id left join ggzy_treelib tr on tr.id=t.compute_unit where bp.business_type_id=:business_type_id and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') >= :startTime and to_char(n.bid_doc_sub_endtime,'yyyy-mm-dd') <= :endTime)bid group by business_type_id,area_code) bid join ggzy_treelib tr on tr.id=bid.area_code order by tr.priority";
		return reportDao.queryForMap(sql, params);
	}

}
