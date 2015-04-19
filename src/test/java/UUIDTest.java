import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;



public class UUIDTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		short s1= 1;
		s1 = (short)(s1 + 1);
		System.out.println(s1);
		s1+=1;
System.out.println(5&(int) Math.pow(2, 0));
		// TODO Auto-generated method stub
		/*System.out.println(UUID.randomUUID());
		System.out.println(UUID.fromString("F5E227B75A8C2C26E040007F01001E00"));*/
		/*A a = new A();
		a.setName("username");
		a.add("first name");
		a.add("last name");
		System.out.println(new JSONSerializer().include("list").serialize(a));*/
		/*Integer i = null;
		int a = i;
		System.out.println(a + 1);*/
		
//		System.out.println(DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
//		System.out.println(GregorianCalendar.class.isAssignableFrom(Calendar.class) && !GregorianCalendar.class.isAssignableFrom(Calendar.class));
		/*System.out.println(org.apache.shiro.codec.Base64.decodeToString("Z2d6eXRlbmRlcnNfbGlzdG9mcHJvX2FkZGJ0bg=="));
		PropertyPlaceholderConfigurer p = null;*/
		/*String s = String.format("%s%03d", "00000000000000004001",1);
		
		System.out.println(s);
		System.out.println(s.length());
		GgzyTreeLib lib1 = new GgzyTreeLib();
		lib1.setName("lib1");
		
		GgzyTreeLib lib2 = new GgzyTreeLib();
		lib2.setName("lib1");
		
		lib1.setParent(lib2);
		List<GgzyTreeLib> children = new ArrayList<GgzyTreeLib>();
		children.add(lib1);
		lib2.setChildren(children);
		System.out.println(lib1.toJson(new String[]{"name"}));
		System.out.println(lib1.toJson());*/
		/*String queryString = "a=1&b=2&c=";
		
		if(StringUtils.hasLength(queryString)){
			String[] params = queryString.split("&");
			for(String para : params){
				int eqIndex = para.indexOf("=");
				if(eqIndex > 0){
					System.out.println(para.substring(0, para.indexOf("=")));
					System.out.println(para.substring(eqIndex + 1) + "  val");
				}
			}
		}*/
	}
	

}
/**
 * @author  mh_cxp
 */
class A{
	/**
	 * @uml.property  name="list"
	 * @uml.associationEnd  multiplicity="(0 -1)" elementType="java.lang.String"
	 */
	private List<String> list = new ArrayList<String>();
	/**
	 * @uml.property  name="name"
	 */
	public String name ;
	/**
	 * @return
	 * @uml.property  name="list"
	 */
	public List<String> getList() {
		return list;
	}
	/**
	 * @param list
	 * @uml.property  name="list"
	 */
	public void setList(List<String> list) {
		this.list = list;
	}
	/**
	 * @return
	 * @uml.property  name="name"
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name
	 * @uml.property  name="name"
	 */
	public void setName(String name) {
		this.name = name;
	}
	public void add(String s){
		list.add(s);
	}
}
