// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import com.lmd.ggzy.domain.GgzyOtherScore;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect GgzyOtherScore_Roo_Json {
    
    public String GgzyOtherScore.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyOtherScore.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyOtherScore GgzyOtherScore.fromJsonToGgzyOtherScore(String json) {
        return new JSONDeserializer<GgzyOtherScore>()
        .use(null, GgzyOtherScore.class).deserialize(json);
    }
    
    public static String GgzyOtherScore.toJsonArray(Collection<GgzyOtherScore> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyOtherScore.toJsonArray(Collection<GgzyOtherScore> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyOtherScore> GgzyOtherScore.fromJsonArrayToGgzyOtherScores(String json) {
        return new JSONDeserializer<List<GgzyOtherScore>>()
        .use("values", GgzyOtherScore.class).deserialize(json);
    }
    
}
