// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import com.lmd.ggzy.domain.GgzyQuaResNotice;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect GgzyQuaResNotice_Roo_Json {
    
    public String GgzyQuaResNotice.toJson() {
        return new JSONSerializer()
        .exclude("*.class", "*.handler","*.hibernateLazyInitializer").serialize(this);
    }
    
    public String GgzyQuaResNotice.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(this);
    }
    
    public static GgzyQuaResNotice GgzyQuaResNotice.fromJsonToGgzyQuaResNotice(String json) {
        return new JSONDeserializer<GgzyQuaResNotice>()
        .use(null, GgzyQuaResNotice.class).deserialize(json);
    }
    
    public static String GgzyQuaResNotice.toJsonArray(Collection<GgzyQuaResNotice> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyQuaResNotice.toJsonArray(Collection<GgzyQuaResNotice> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyQuaResNotice> GgzyQuaResNotice.fromJsonArrayToGgzyQuaResNotices(String json) {
        return new JSONDeserializer<List<GgzyQuaResNotice>>()
        .use("values", GgzyQuaResNotice.class).deserialize(json);
    }
    
}
