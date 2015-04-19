package test.com.lmd.ggzy.domain;

import javax.persistence.DiscriminatorValue;

import org.springframework.roo.addon.dbre.RooDbManaged;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.json.RooJson;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooJpaEntity(versionField = "", table = "GGZY_BASE_PRO")
@RooDbManaged(automaticallyDelete = true)
@RooToString(excludeFields = { "ggzyBidProes" })
@RooJson
@DiscriminatorValue(value = "")
public class GgzyBasePro {
	
}
