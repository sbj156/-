// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.lmd.ggzy.domain.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect DataClob_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager DataClob.entityManager;
    
    public static final List<String> DataClob.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static final EntityManager DataClob.entityManager() {
        EntityManager em = new DataClob().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long DataClob.countGgzyDataClobs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM GgzyDataClob o", Long.class).getSingleResult();
    }
    
    public static List<DataClob> DataClob.findAllGgzyDataClobs() {
        return entityManager().createQuery("SELECT o FROM GgzyDataClob o", DataClob.class).getResultList();
    }
    
    public static List<DataClob> DataClob.findAllGgzyDataClobs(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM GgzyDataClob o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, DataClob.class).getResultList();
    }
    
    public static DataClob DataClob.findGgzyDataClob(Long id) {
        if (id == null) return null;
        return entityManager().find(DataClob.class, id);
    }
    
    public static List<DataClob> DataClob.findGgzyDataClobEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM GgzyDataClob o", DataClob.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<DataClob> DataClob.findGgzyDataClobEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM GgzyDataClob o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, DataClob.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void DataClob.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void DataClob.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            DataClob attached = DataClob.findGgzyDataClob(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void DataClob.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void DataClob.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public DataClob DataClob.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        DataClob merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
