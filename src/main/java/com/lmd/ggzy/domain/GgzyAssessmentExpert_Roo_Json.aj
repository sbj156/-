// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain;

import com.lmd.ggzy.domain.GgzyAssessmentExpert;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect GgzyAssessmentExpert_Roo_Json {
    
    public String GgzyAssessmentExpert.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyAssessmentExpert.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyAssessmentExpert GgzyAssessmentExpert.fromJsonToGgzyAssessmentExpert(String json) {
        return new JSONDeserializer<GgzyAssessmentExpert>()
        .use(null, GgzyAssessmentExpert.class).deserialize(json);
    }
    
    public static String GgzyAssessmentExpert.toJsonArray(Collection<GgzyAssessmentExpert> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyAssessmentExpert.toJsonArray(Collection<GgzyAssessmentExpert> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyAssessmentExpert> GgzyAssessmentExpert.fromJsonArrayToGgzyAssessmentExperts(String json) {
        return new JSONDeserializer<List<GgzyAssessmentExpert>>()
        .use("values", GgzyAssessmentExpert.class).deserialize(json);
    }
    
}
