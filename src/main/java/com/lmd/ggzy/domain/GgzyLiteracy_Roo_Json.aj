package com.lmd.ggzy.domain;

import java.util.Collection;
import java.util.List;

import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;

privileged aspect GgzyLiteracy_Roo_Json {

	public String GgzyLiteracy.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyLiteracy.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyLiteracy GgzyLiteracy.fromJsonToGgzyLiteracy(String json) {
        return new JSONDeserializer<GgzyLiteracy>()
        .use(null, GgzyLiteracy.class).deserialize(json);
    }
    
    public static String GgzyLiteracy.toJsonArray(Collection<GgzyLiteracy> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyLiteracy.toJsonArray(Collection<GgzyLiteracy> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyLiteracy> GgzyLiteracy.fromJsonArrayToGgzyLiteracy(String json) {
        return new JSONDeserializer<List<GgzyLiteracy>>()
        .use("values", GgzyLiteracy.class).deserialize(json);
    }
}
