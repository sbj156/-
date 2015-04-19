package com.lmd.ggzy.sms;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

public class RESTSmsService implements SmsService {

	@Autowired
	private RestTemplate restTemplate;

	private static final String DEFAULT_REST_URI = "http://127.0.0.1:8081/gsm/gsm/send";
	private String restURI = DEFAULT_REST_URI;
	
	@Override
	public boolean sendCaptcha(String phone, String captcha) {
		// TODO Auto-generated method stub
		/*try {
			restTemplate.postForObject(restURI + "?phone={phone}&msg={msg}", null, String.class, phone, captcha);
		} catch (RestClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}*/
		return true;
	}

	public RestTemplate getRestTemplate() {
		return restTemplate;
	}

	public void setRestTemplate(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

	public void setRestURI(String restURI) {
		this.restURI = restURI;
	}
}
