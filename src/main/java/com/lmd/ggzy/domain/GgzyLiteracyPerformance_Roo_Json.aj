package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyLiteracyPerformance_Roo_Json {

	public String GgzyLiteracyPerformance.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyLiteracyPerformance.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyLiteracyPerformance GgzyLiteracyPerformance.fromJsonToGgzyLiteracyPerformance(String json) {
        return new JSONDeserializer<GgzyLiteracyPerformance>()
        .use(null, GgzyLiteracyPerformance.class).deserialize(json);
    }
    
    public static String GgzyLiteracyPerformance.toJsonArray(Collection<GgzyLiteracyPerformance> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyLiteracyPerformance.toJsonArray(Collection<GgzyLiteracyPerformance> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyLiteracyPerformance> GgzyLiteracyPerformance.fromJsonArrayToGgzyLiteracyPerformance(String json) {
        return new JSONDeserializer<List<GgzyLiteracyPerformance>>()
        .use("values", GgzyLiteracyPerformance.class).deserialize(json);
    }
}
