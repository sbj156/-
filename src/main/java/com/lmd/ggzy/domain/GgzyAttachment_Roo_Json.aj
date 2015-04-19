// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyAttachment_Roo_Json {
    
    public String GgzyAttachment.toJson() {
        return new JSONSerializer()
        .exclude("*.class", "*.handler","*.hibernateLazyInitializer").serialize(this);
    }
    
    public String GgzyAttachment.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*").serialize(this);
    }
    
    public static GgzyAttachment GgzyAttachment.fromJsonToGgzyAttachment(String json) {
        return new JSONDeserializer<GgzyAttachment>()
        .use(null, GgzyAttachment.class).deserialize(json);
    }
    
    public static String GgzyAttachment.toJsonArray(Collection<GgzyAttachment> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyAttachment.toJsonArray(Collection<GgzyAttachment> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyAttachment> GgzyAttachment.fromJsonArrayToGgzyAttachments(String json) {
        return new JSONDeserializer<List<GgzyAttachment>>()
        .use("values", GgzyAttachment.class).deserialize(json);
    }
    
}