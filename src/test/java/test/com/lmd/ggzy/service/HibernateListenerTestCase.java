package test.com.lmd.ggzy.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import com.lmd.ggzy.hibernate.listener.HibernateEventWiring;
import com.lmd.ggzy.repository.GgzyBidProRepository;
import com.lmd.ggzy.repository.GgzyBusinessTypeRepository;
import com.lmd.ggzy.repository.GgzyTendersRepository;
import com.lmd.ggzy.service.GgzyBidProService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = { "/spring/applicationContext*.xml"})
public class HibernateListenerTestCase {
/*
	@Autowired
	HibernateEventWiring eventWiring;*/
	/**
	 * @uml.property  name="bidProRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBidProRepository bidProRepository;
	
	/**
	 * @uml.property  name="bidProService"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBidProService bidProService;
	
	/**
	 * @uml.property  name="ggzyTendersRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyTendersRepository ggzyTendersRepository;
	
	/**
	 * @uml.property  name="businessTypeRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBusinessTypeRepository businessTypeRepository;
	@Test
	@Transactional
	public void test(){
//		baseProRepository.save(new GgzyBasePro());
//		System.out.println(bidProService.findGgzyBidPro("4028815845f9ab190145f9ac7a5d0001"));
//		GgzyBasePro basePro = baseProRepository.findOne("4028815845f8c63f0145f8d20a1b000b");
//		System.out.println(baseProRepository.getCurrySN());
		
		/*System.out.println(bidProService);
		System.out.println(bidProRepository.count());
		System.out.println(bidProRepository.getBidProCodeSN("00000000000000002"));
		System.out.println("123" + ggzyTendersRepository.getNextTendersCode("FA6F9C3108B643A2E040007F010008B9"));*/
		System.out.println(businessTypeRepository.findOne("F785D42A3F81B399E040007F0100159F").toJson());
	}
}
