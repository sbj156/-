// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyProQuaApplyDoc_Roo_Json {
    
    public String GgzyProQuaApplyDoc.toJson() {
        return new JSONSerializer()
        .exclude("*.class", "*.handler","*.hibernateLazyInitializer").serialize(this);
    }
    
    public String GgzyProQuaApplyDoc.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(this);
    }
    
    public static GgzyProQuaApplyDoc GgzyProQuaApplyDoc.fromJsonToGgzyProQuaApplyDoc(String json) {
        return new JSONDeserializer<GgzyProQuaApplyDoc>()
        .use(null, GgzyProQuaApplyDoc.class).deserialize(json);
    }
    
    public static String GgzyProQuaApplyDoc.toJsonArray(Collection<GgzyProQuaApplyDoc> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyProQuaApplyDoc.toJsonArray(Collection<GgzyProQuaApplyDoc> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyProQuaApplyDoc> GgzyProQuaApplyDoc.fromJsonArrayToGgzyProQuaApplyDocs(String json) {
        return new JSONDeserializer<List<GgzyProQuaApplyDoc>>()
        .use("values", GgzyProQuaApplyDoc.class).deserialize(json);
    }
    
}
