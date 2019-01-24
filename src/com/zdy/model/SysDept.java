package com.zdy.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SysDept {
    
    private Integer id;

    private String deptName;

    private String deptInfo;

    
}