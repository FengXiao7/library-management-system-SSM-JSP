package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @作者 冯小7
 * @时间 2021-05-28-15:58
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Manager {
    private Integer managerID;
    private String Name;
    private String password;
}
