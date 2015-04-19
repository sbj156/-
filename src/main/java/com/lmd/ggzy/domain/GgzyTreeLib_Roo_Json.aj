package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

public privileged aspect GgzyTreeLib_Roo_Json{
	public String GgzyTreeLib.toJson() {
        return new JSONSerializer()
        .exclude("*.class", "*.parent" ,"*.children", "*.handler","*.hibernateLazyInitializer").serialize(this);
    }
    
    public String GgzyTreeLib.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(this);
    }
    
    public static GgzyTreeLib GgzyTreeLib.fromJsonToGgzyTreeLib(String json) {
        return new JSONDeserializer<GgzyTreeLib>()
        .use(null, GgzyTreeLib.class).deserialize(json);
    }
    
    public static String GgzyTreeLib.toJsonArray(Collection<GgzyTreeLib> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyTreeLib.toJsonArray(Collection<GgzyTreeLib> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyTreeLib> GgzyTreeLib.fromJsonArrayToGgzyTreeLibs(String json) {
        return new JSONDeserializer<List<GgzyTreeLib>>()
        .use("values", GgzyTreeLib.class).deserialize(json);
    }
    
}
