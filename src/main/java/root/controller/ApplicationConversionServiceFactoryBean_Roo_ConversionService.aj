// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package root.controller;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;
import root.controller.ApplicationConversionServiceFactoryBean;
import root.domain.Plant;
import root.domain.PurchaseOrder;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    public Converter<Plant, String> ApplicationConversionServiceFactoryBean.getPlantToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<root.domain.Plant, java.lang.String>() {
            public String convert(Plant plant) {
                return new StringBuilder().append(plant.getName()).append(' ').append(plant.getDescription()).append(' ').append(plant.getPrice()).toString();
            }
        };
    }
    
    public Converter<Long, Plant> ApplicationConversionServiceFactoryBean.getIdToPlantConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, root.domain.Plant>() {
            public root.domain.Plant convert(java.lang.Long id) {
                return Plant.findPlant(id);
            }
        };
    }
    
    public Converter<String, Plant> ApplicationConversionServiceFactoryBean.getStringToPlantConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, root.domain.Plant>() {
            public root.domain.Plant convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Plant.class);
            }
        };
    }
    
    public Converter<PurchaseOrder, String> ApplicationConversionServiceFactoryBean.getPurchaseOrderToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<root.domain.PurchaseOrder, java.lang.String>() {
            public String convert(PurchaseOrder purchaseOrder) {
                return new StringBuilder().append(purchaseOrder.getStartDate()).append(' ').append(purchaseOrder.getEndDate()).append(' ').append(purchaseOrder.getTotal()).toString();
            }
        };
    }
    
    public Converter<Long, PurchaseOrder> ApplicationConversionServiceFactoryBean.getIdToPurchaseOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, root.domain.PurchaseOrder>() {
            public root.domain.PurchaseOrder convert(java.lang.Long id) {
                return PurchaseOrder.findPurchaseOrder(id);
            }
        };
    }
    
    public Converter<String, PurchaseOrder> ApplicationConversionServiceFactoryBean.getStringToPurchaseOrderConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, root.domain.PurchaseOrder>() {
            public root.domain.PurchaseOrder convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), PurchaseOrder.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getPlantToStringConverter());
        registry.addConverter(getIdToPlantConverter());
        registry.addConverter(getStringToPlantConverter());
        registry.addConverter(getPurchaseOrderToStringConverter());
        registry.addConverter(getIdToPurchaseOrderConverter());
        registry.addConverter(getStringToPurchaseOrderConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
