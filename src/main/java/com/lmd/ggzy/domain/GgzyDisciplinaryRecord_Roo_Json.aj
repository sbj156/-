package com.lmd.ggzy.domain;
import com.lmd.ggzy.domain.GgzyDisciplinaryRecord;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.Collection;
import java.util.List;
privileged aspect GgzyDisciplinaryRecord_Roo_Json {
	public String GgzyDisciplinaryRecord.toJson() {
        return new JSONSerializer()
        .exclude("*.class").serialize(this);
    }
    
    public String GgzyDisciplinaryRecord.toJson(String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(this);
    }
    
    public static GgzyDisciplinaryRecord GgzyDisciplinaryRecord.fromJsonToGgzyDisciplinaryRecord(String json) {
        return new JSONDeserializer<GgzyDisciplinaryRecord>()
        .use(null, GgzyDisciplinaryRecord.class).deserialize(json);
    }
    
    public static String GgzyDisciplinaryRecord.toJsonArray(Collection<GgzyDisciplinaryRecord> collection) {
        return new JSONSerializer()
        .exclude("*.class").serialize(collection);
    }
    
    public static String GgzyDisciplinaryRecord.toJsonArray(Collection<GgzyDisciplinaryRecord> collection, String[] fields) {
        return new JSONSerializer()
        .include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<GgzyDisciplinaryRecord> GgzyDisciplinaryRecord.fromJsonArrayToGgzyDisciplinaryRecords(String json) {
        return new JSONDeserializer<List<GgzyDisciplinaryRecord>>()
        .use("values", GgzyDisciplinaryRecord.class).deserialize(json);
    }
}
