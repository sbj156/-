package com.lmd.util;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.joda.time.DateTimeUtils;
import org.joda.time.Weeks;

import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtils extends org.apache.commons.lang3.time.DateUtils{

	/**
	 * Formats a Date into a date/time string
	 * @param date
	 * @param style
	 * @return
	 */
	public static String getDate(Date date, String style){
		return new SimpleDateFormat(style).format(date);
	}
	public static String getDate(Date date){
		return getDate(date, "yyyy-MM-dd");
	}
	
	/**
	 * 获取指定日期所在周的第一天
	 * @param date    java.util.Date 或java.util.Calendar
	 * @return
	 */
	public static Date getFirstDayOfWeek(Date date){
		return org.apache.commons.lang3.time.DateUtils.iterator(date,
                RANGE_WEEK_MONDAY).next().getTime();
	}

    /**
     * 活取date 所在周的week_day
     * @param date
     * @param week_day 索引从0开始
     * @return
     */
    public static Date getDayOfWeek(Date date, int week_day){
        List<Calendar> days = new ArrayList<Calendar>();
        CollectionUtils.addAll(days, org.apache.commons.lang3.time.DateUtils.iterator(date,
                RANGE_WEEK_MONDAY));
        return days.get(week_day).getTime();
    }

    public static void main(String ...args){

        System.out.println(DateFormatUtils.format(DateUtils.addDays(new Date(), -2),"yyyy年第w周"));
    }

}
