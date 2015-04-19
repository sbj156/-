package test.com.lmd.ggzy.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lmd.ggzy.domain.GgzyBusinessType;
import com.lmd.ggzy.domain.GgzyBusinessTypeWay;
import com.lmd.ggzy.domain.GgzyBusinessWay;
import com.lmd.ggzy.service.GgzyBusinessTypeWayService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class GgzyBusinessTypeWayServiceTestCase {

	/**
	 * @uml.property  name="businessTypeWayService"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBusinessTypeWayService businessTypeWayService;
	
	@Test
	public void testDelete(){
		/*GgzyBusinessTypeWay typeWay = new GgzyBusinessTypeWay();
//		GgzyBusinessTypeWayPK pk = new GgzyBusinessTypeWayPK("4028815445834c910145834ff24c0000","F785D42A3F81B399E040007F0100159F");
		typeWay.setId(pk);
		GgzyBusinessType ggzyBusinessType = new GgzyBusinessType();
		ggzyBusinessType.setBusinessTypeId("F785D42A3F81B399E040007F0100159F");
		typeWay.setBusinessType(ggzyBusinessType);
		
		GgzyBusinessWay businessWay = new GgzyBusinessWay();
		businessWay.setBusinessWayId("4028815445834c910145834ff24c0000");
		typeWay.setBusinessWay(businessWay);
//		businessTypeWayService.saveGgzyBusinessTypeWay(typeWay);
		typeWay = businessTypeWayService.findGgzyBusinessTypeWay(pk);
		businessTypeWayService.deleteGgzyBusinessTypeWay(typeWay);
		System.out.println(typeWay);*/
		
		
	}
}
