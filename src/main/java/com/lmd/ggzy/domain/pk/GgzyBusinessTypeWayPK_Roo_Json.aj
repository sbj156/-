// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain.pk;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyBusinessTypeWayPK_Roo_Json {
    
    public String GgzyBusinessTypeWayPK.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyBusinessTypeWayPK.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyBusinessTypeWayPK GgzyBusinessTypeWayPK.fromJsonToGgzyBusinessTypeWayPK(String json) {
        return new JSONDeserializer<GgzyBusinessTypeWayPK>()
        .use(null, GgzyBusinessTypeWayPK.class).deserialize(json);
    }
    
    public static String GgzyBusinessTypeWayPK.toJsonArray(Collection<GgzyBusinessTypeWayPK> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyBusinessTypeWayPK.toJsonArray(Collection<GgzyBusinessTypeWayPK> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyBusinessTypeWayPK> GgzyBusinessTypeWayPK.fromJsonArrayToGgzyBusinessTypeWayPKs(String json) {
        return new JSONDeserializer<List<GgzyBusinessTypeWayPK>>()
        .use("values", GgzyBusinessTypeWayPK.class).deserialize(json);
    }
    
}