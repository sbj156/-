package com.lmd.ggzy.domain;

import java.util.Calendar;

import javax.persistence.*;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.hibernate.annotations.*;
import org.hibernate.annotations.Cache;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity(table = "GGZY_BID_SITE")
@RooJson
@SelectBeforeUpdate
@DynamicInsert
@DynamicUpdate
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE, region = "com.lmd.ggzy.domain.GgzyBidSite")
@Entity
@Table(name = "GGZY_BID_SITE")
public class GgzyBidSite {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long id;

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 发一次公告预约一次标厅,资格预审除外
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID")
    private GgzyNotice notice;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID")
    @NotFound(action = NotFoundAction.IGNORE)
    private GgzyTenders tenders;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({
            @JoinColumn(name = "TENDERS_ID", referencedColumnName = "TENDERS_ID", insertable = false, updatable = false),
            @JoinColumn(name = "NOTICE_ID", referencedColumnName = "NOTICE_ID", insertable = false, updatable = false)
    })
    private GgzyNoticeTenders noticeTenders;
    /**
     * 开标厅
     */
    @Column
    private String openRoom;

    /**
     * 评标厅
     */
    @Column
    private String evaluationRoom;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "MM", pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(columnDefinition = "timestamp default systimestamp")
    private Calendar createTime;

    /**
     * 资格预审标厅
     */
    @Column(columnDefinition = "number(1)")
    private boolean qua;


    public boolean isQua() {
        return qua;
    }

    public void setQua(boolean qua) {
        this.qua = qua;
    }

    public GgzyNotice getNotice() {
        return notice;
    }

    public void setNotice(GgzyNotice notice) {
        this.notice = notice;
    }

    public Calendar getTime() {
        return qua ? notice.getQuaTime() : notice.getBidDocSubEndtime();
    }

    public String getOpenRoom() {
        return openRoom;
    }

    public void setOpenRoom(String openRoom) {
        this.openRoom = openRoom;
    }

    public String getEvaluationRoom() {
        return evaluationRoom;
    }

    public void setEvaluationRoom(String evaluationRoom) {
        this.evaluationRoom = evaluationRoom;
    }

    public Calendar getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Calendar createTime) {
        this.createTime = createTime;
    }

    public String toString() {
        return ReflectionToStringBuilder.toString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }

    public GgzyTenders getTenders() {
        return tenders;
    }

    public void setTenders(GgzyTenders tenders) {
        this.tenders = tenders;
    }

    public GgzyNoticeTenders getNoticeTenders() {
        return noticeTenders;
    }

    public void setNoticeTenders(GgzyNoticeTenders noticeTenders) {
        this.noticeTenders = noticeTenders;
    }
}
