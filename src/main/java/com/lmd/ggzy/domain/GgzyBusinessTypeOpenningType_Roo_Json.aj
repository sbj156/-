// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import com.lmd.ggzy.domain.GgzyBusinessTypeOpenningType;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect GgzyBusinessTypeOpenningType_Roo_Json {
    
    public String GgzyBusinessTypeOpenningType.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyBusinessTypeOpenningType.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyBusinessTypeOpenningType GgzyBusinessTypeOpenningType.fromJsonToGgzyBusinessTypeOpenningType(String json) {
        return new JSONDeserializer<GgzyBusinessTypeOpenningType>()
        .use(null, GgzyBusinessTypeOpenningType.class).deserialize(json);
    }
    
    public static String GgzyBusinessTypeOpenningType.toJsonArray(Collection<GgzyBusinessTypeOpenningType> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyBusinessTypeOpenningType.toJsonArray(Collection<GgzyBusinessTypeOpenningType> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyBusinessTypeOpenningType> GgzyBusinessTypeOpenningType.fromJsonArrayToGgzyBusinessTypeOpenningTypes(String json) {
        return new JSONDeserializer<List<GgzyBusinessTypeOpenningType>>()
        .use("values", GgzyBusinessTypeOpenningType.class).deserialize(json);
    }
    
}
