// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain.pk;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyBusinessTypeMajorPK_Roo_Json {
    
    public String GgzyBusinessTypeMajorPK.toJson() {
        return new JSONSerializer().include("*")
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyBusinessTypeMajorPK.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyBusinessTypeMajorPK GgzyBusinessTypeMajorPK.fromJsonToGgzyBusinessTypeMajorPK(String json) {
        return new JSONDeserializer<GgzyBusinessTypeMajorPK>()
        .use(null, GgzyBusinessTypeMajorPK.class).deserialize(json);
    }
    
    public static String GgzyBusinessTypeMajorPK.toJsonArray(Collection<GgzyBusinessTypeMajorPK> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyBusinessTypeMajorPK.toJsonArray(Collection<GgzyBusinessTypeMajorPK> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyBusinessTypeMajorPK> GgzyBusinessTypeMajorPK.fromJsonArrayToGgzyBusinessTypeMajorPKs(String json) {
        return new JSONDeserializer<List<GgzyBusinessTypeMajorPK>>()
        .use("values", GgzyBusinessTypeMajorPK.class).deserialize(json);
    }
    
}
