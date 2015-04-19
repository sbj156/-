package com.lmd.ggzy.domain.data;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.Lob;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(table = "GGZY_DATA_BLOB")
public class DataBlob {

    /**
	 * @uml.property  name="content"
	 */
    @Basic(fetch=FetchType.LAZY)
    @Column(name = "CONTENT", columnDefinition="BLOB" )
    @Lob
    private byte[] content;
    
    /**
	 * @return
	 * @uml.property  name="content"
	 */
    public byte[] getContent() {
        return this.content;
    }
    
    /**
	 * @param content
	 * @uml.property  name="content"
	 */
    public void setContent(byte[] content) {
        this.content = content;
    }
}
