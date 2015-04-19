import java.util.Calendar;

import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.junit.Test;



public class GenerateTest {

	/**
	 * @uml.property  name="b"
	 */
	private Boolean b;
	@Test
	public void testDateTimeFormater(){
		DateTimeFormatter formatter =  org.joda.time.format.DateTimeFormat.forStyle("MM");
//		DateTimeFormat.forPattern("yyyy");
		Calendar calendar =Calendar.getInstance();
		calendar.add(Calendar.DATE, -2);
		System.out.println(calendar);
		System.out.println(DateUtils.truncate(calendar, Calendar.DATE));
		System.out.println(calendar.get(Calendar.WEEK_OF_YEAR));
	}
	
	@Test
	public void testBoolean(){
		System.out.println(b?1:2);
	}
}
