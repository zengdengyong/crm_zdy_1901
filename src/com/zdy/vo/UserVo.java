package com.zdy.vo;

import lombok.Data;

@Data
public class UserVo {
	
	private Integer id;
    private String userName;
    private String userPassword;
    private String userMail;
    private String remark;
    private String userDeptName;
}
