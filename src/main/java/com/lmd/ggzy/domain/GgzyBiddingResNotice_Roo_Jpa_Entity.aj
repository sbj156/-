// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

privileged aspect GgzyBiddingResNotice_Roo_Jpa_Entity {
    
    declare @type: GgzyBiddingResNotice: @Entity;
    
    declare @type: GgzyBiddingResNotice: @Table(name = "GGZY_BIDDING_RES_NOTICE");
   /* 
    @Id
    @GenericGenerator(name="uuid" ,strategy="uuid")
    @GeneratedValue(generator="uuid")
    @Column(name = "BIDDING_RESULT_NOTICE_ID", length = 32)
    private String GgzyBiddingResNotice.biddingResultNoticeId;
    
    public String GgzyBiddingResNotice.getBiddingResultNoticeId() {
        return this.biddingResultNoticeId;
    }
    
    public void GgzyBiddingResNotice.setBiddingResultNoticeId(String id) {
        this.biddingResultNoticeId = id;
    }*/
    
}