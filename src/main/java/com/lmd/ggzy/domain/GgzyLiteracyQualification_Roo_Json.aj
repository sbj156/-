package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyLiteracyQualification_Roo_Json {

	public String GgzyLiteracyQualification.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyLiteracyQualification.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyLiteracyQualification GgzyLiteracyQualification.fromJsonToGgzyLiteracyQualification(String json) {
        return new JSONDeserializer<GgzyLiteracyQualification>()
        .use(null, GgzyLiteracyQualification.class).deserialize(json);
    }
    
    public static String GgzyLiteracyQualification.toJsonArray(Collection<GgzyLiteracyQualification> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyLiteracyQualification.toJsonArray(Collection<GgzyLiteracyQualification> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyLiteracyQualification> GgzyLiteracyQualification.fromJsonArrayToGgzyLiteracyQualification(String json) {
        return new JSONDeserializer<List<GgzyLiteracyQualification>>()
        .use("values", GgzyLiteracyQualification.class).deserialize(json);
    }
}
