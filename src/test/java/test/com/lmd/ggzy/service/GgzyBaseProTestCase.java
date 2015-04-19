package test.com.lmd.ggzy.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.expression.Expression;
import org.springframework.expression.ExpressionParser;
import org.springframework.expression.spel.standard.SpelExpressionParser;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.lmd.ggzy.domain.GgzyBasePro;
import com.lmd.ggzy.repository.GgzyBaseProRepository;
import com.lmd.ggzy.repository.GgzyTendersRepository;
//import test.com.lmd.ggzy.domain.GgzyBaseProRepositoryCustom;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/applicationContext.xml")
public class GgzyBaseProTestCase implements ApplicationContextAware{
	/**
	 * @uml.property  name="context"
	 * @uml.associationEnd  
	 */
	ApplicationContext context;
	
	/*@Value("${business_ctx}")
	private String business_ctx;
	*/
	/**
	 * @uml.property  name="repository"
	 * @uml.associationEnd  
	 */
	@Autowired
	private GgzyBaseProRepository repository;
	
	/**
	 * @uml.property  name="tendersRepository"
	 * @uml.associationEnd  
	 */
	@Autowired
	
	private GgzyTendersRepository tendersRepository;
	@Test
	public void testSave(){
		ExpressionParser parser= new SpelExpressionParser();
		Expression exp=parser.parseExpression("platform_code");
		System.out.println(exp.getValue(context));
		GgzyBasePro basePro = new GgzyBasePro();
		basePro.setProName("that is a test");
		try {
//			System.out.println(baseProRepository);
//			baseProService.saveGgzyBasePro(basePro);
//			baseProRepository.save(basePro);
			
			System.out.println(String.format("%s%06d", "00000000000", repository.getCurrySN() + 1));
			Object[] list = (Object[])tendersRepository.getNextTendersCode("40288154461c906201461c9ada130005");
			System.out.println((list[1]));
			System.out.println((list[0]) == null );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		this.context = applicationContext;
	}
}
