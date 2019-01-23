package com.zdy.model;

public class SysResource {
    
    private Integer id;

    
    private String name;

    
    private Integer moduleId;

    
    private String url;

    
    private Integer type;

    
    private String remark;

    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getName() {
        return name;
    }

    
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    
    public Integer getModuleId() {
        return moduleId;
    }

    
    public void setModuleId(Integer moduleId) {
        this.moduleId = moduleId;
    }

    
    public String getUrl() {
        return url;
    }

    
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    
    public Integer getType() {
        return type;
    }

    
    public void setType(Integer type) {
        this.type = type;
    }

    
    public String getRemark() {
        return remark;
    }

    
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}