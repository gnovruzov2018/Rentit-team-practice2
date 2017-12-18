// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package root.domain;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import root.domain.Plant;

privileged aspect Plant_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Plant.entityManager;
    
    public static final List<String> Plant.fieldNames4OrderClauseFilter = java.util.Arrays.asList("name", "description", "price");
    
    public static final EntityManager Plant.entityManager() {
        EntityManager em = new Plant().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Plant.countPlants() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Plant o", Long.class).getSingleResult();
    }
    
    public static List<Plant> Plant.findAllPlants() {
        return entityManager().createQuery("SELECT o FROM Plant o", Plant.class).getResultList();
    }
    
    public static List<Plant> Plant.findAllPlants(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Plant o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Plant.class).getResultList();
    }
    
    public static Plant Plant.findPlant(Long id) {
        if (id == null) return null;
        return entityManager().find(Plant.class, id);
    }
    
    public static List<Plant> Plant.findPlantEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Plant o", Plant.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Plant> Plant.findPlantEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Plant o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Plant.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Plant.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Plant.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Plant attached = Plant.findPlant(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Plant.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Plant.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Plant Plant.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Plant merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}