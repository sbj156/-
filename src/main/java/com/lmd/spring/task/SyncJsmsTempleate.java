package com.lmd.spring.task;

import java.util.Map;

/**
 * jcms同步模板配置
 * 在expression.value equals(#expressionValue) 时使用此模板处理同步
 */
public class SyncJsmsTempleate{


    /**
     * 自定义字段
     * key 字段名
     * value 取值spring表达式
     */
    private Map<String, String> customFields;

    /**
     * spel表达式,
     */
    private String expression;

    /**
     * 表达式结果
     */
    private String expressionValue;

    /**
     * 同步栏目ID
     */
    private String clmId;

    /**
     * freemarker模板后缀
     */
    private String templateSuffix;

    public String getExpression() {
        return expression;
    }

    public void setExpression(String expression) {
        this.expression = expression;
    }

    public String getExpressionValue() {
        return expressionValue;
    }

    public void setExpressionValue(String expressionValue) {
        this.expressionValue = expressionValue;
    }

    public String getClmId() {
        return clmId;
    }

    public void setClmId(String clmId) {
        this.clmId = clmId;
    }

    public String getTemplateSuffix() {
        return templateSuffix;
    }

    public void setTemplateSuffix(String templateSuffix) {
        this.templateSuffix = templateSuffix;
    }

    public Map<String, String> getCustomFields() {
        return customFields;
    }

    public void setCustomFields(Map<String, String> customFields) {
        this.customFields = customFields;
    }
}