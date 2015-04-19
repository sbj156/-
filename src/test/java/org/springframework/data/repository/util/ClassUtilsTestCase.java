package org.springframework.data.repository.util;

import org.junit.Assert;
import org.junit.Test;

import com.lmd.ggzy.domain.GgzyBidPro;


public class ClassUtilsTestCase {

	@Test
	public void test(){
		Assert.assertFalse(ClassUtils.hasProperty(GgzyBidPro.class, "bidPro.proCode"));
		
		Assert.assertFalse(ClassUtils.hasProperty(GgzyBidPro.class, "bidPro.proCode"));
		
		
	}
	
	public boolean checkProperty(Class<?> cls, String pro){
		return false;
	}
}
