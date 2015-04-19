import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang3.ArrayUtils;
import org.junit.Test;


public class MapTestCase {

	@Test
	public void test(){
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("a", new String[]{"1111"});
		for(Entry<String, Object> entry : m.entrySet()){
			Object v = entry.getValue();
			if(v instanceof String[]){
				String[] v_ = (String[])v;
				if(v_.length == 1)
					System.out.println("1111111111111111111111");
			}else{
				System.out.println(22222);
			}
		}
		
	}
	
	@Test
	public void test1(){
		System.out.println(ArrayUtils.toString(new String[]{"1111"}, "{}"));
	}
}
