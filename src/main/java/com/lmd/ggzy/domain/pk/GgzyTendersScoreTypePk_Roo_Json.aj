// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain.pk;

import com.lmd.ggzy.domain.pk.GgzyTendersScoreTypePk;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect GgzyTendersScoreTypePk_Roo_Json {
    
    public String GgzyTendersScoreTypePk.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyTendersScoreTypePk.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyTendersScoreTypePk GgzyTendersScoreTypePk.fromJsonToGgzyTendersScoreTypePk(String json) {
        return new JSONDeserializer<GgzyTendersScoreTypePk>()
        .use(null, GgzyTendersScoreTypePk.class).deserialize(json);
    }
    
    public static String GgzyTendersScoreTypePk.toJsonArray(Collection<GgzyTendersScoreTypePk> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyTendersScoreTypePk.toJsonArray(Collection<GgzyTendersScoreTypePk> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyTendersScoreTypePk> GgzyTendersScoreTypePk.fromJsonArrayToGgzyTendersScoreTypePks(String json) {
        return new JSONDeserializer<List<GgzyTendersScoreTypePk>>()
        .use("values", GgzyTendersScoreTypePk.class).deserialize(json);
    }
    
}
