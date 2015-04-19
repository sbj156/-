package com.lmd.util;

import org.springframework.core.convert.ConversionService;
import org.springframework.expression.EvaluationContext;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.expression.spel.support.StandardEvaluationContext;
import org.springframework.expression.spel.support.StandardTypeConverter;

public class SpelHelper {


	public static Object parseExpression(String expression, EvaluationContext context){
        ExpressionParser parser = new SpelExpressionParser();
		return parser.parseExpression(expression).getValue(context);
	}
	
	public static <T> T parseExpression(String expression, EvaluationContext context, Class<T> cls){
		ExpressionParser parser = new SpelExpressionParser();
		return parser.parseExpression(expression).getValue(context, cls);
	}
	
	public static Object parseExpression(String expression, Object variables, ConversionService conversionService){
		StandardEvaluationContext context = new StandardEvaluationContext(variables);
        context.setTypeConverter(new StandardTypeConverter(conversionService));
		ExpressionParser parser = new SpelExpressionParser();
		return parser.parseExpression(expression).getValue(context);
	}

    public static Object parseExpression(String expression, Object variables){
        StandardEvaluationContext context = new StandardEvaluationContext(variables);
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression(expression).getValue(context);
    }
	
	public static <T> T parseExpression(String expression, Object variables, Class<T> cls){
		EvaluationContext context = new StandardEvaluationContext(variables);
		ExpressionParser parser = new SpelExpressionParser();
		return parser.parseExpression(expression).getValue(context, cls);
	}

    public static <T> T parseExpression(String expression, Object variables, Class<T> cls, ConversionService conversionService){
        StandardEvaluationContext context = new StandardEvaluationContext(variables);
        context.setTypeConverter(new StandardTypeConverter(conversionService));
        ExpressionParser parser = new SpelExpressionParser();
        return parser.parseExpression(expression).getValue(context, cls);
    }
	
	public static void setValue(String expression, Object variables, Object value){
		EvaluationContext context = new StandardEvaluationContext(variables);
		ExpressionParser parser = new SpelExpressionParser();
		parser.parseExpression(expression).setValue(context, value);
	}

}
