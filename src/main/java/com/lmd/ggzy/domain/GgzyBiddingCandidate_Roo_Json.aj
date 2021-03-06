// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyBiddingCandidate_Roo_Json {
    
    public String GgzyBiddingCandidate.toJson() {
        return new JSONSerializer()
        .exclude("*.class", "*.handler","*.hibernateLazyInitializer").serialize(this);
    }
    
    public String GgzyBiddingCandidate.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(this);
    }
    
    public static GgzyBiddingCandidate GgzyBiddingCandidate.fromJsonToGgzyBiddingCandidate(String json) {
        return new JSONDeserializer<GgzyBiddingCandidate>()
        .use(null, GgzyBiddingCandidate.class).deserialize(json);
    }
    
    public static String GgzyBiddingCandidate.toJsonArray(Collection<GgzyBiddingCandidate> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyBiddingCandidate.toJsonArray(Collection<GgzyBiddingCandidate> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyBiddingCandidate> GgzyBiddingCandidate.fromJsonArrayToGgzyBiddingCandidates(String json) {
        return new JSONDeserializer<List<GgzyBiddingCandidate>>()
        .use("values", GgzyBiddingCandidate.class).deserialize(json);
    }
    
}
