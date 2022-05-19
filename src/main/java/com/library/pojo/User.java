package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 * @作者 冯小7
 * @时间 2021-05-30-12:47
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer userID;
    private String userName;
    private String userPassword;
    private String userPhone;
    private String userSex;
    private Integer userAge;
}
