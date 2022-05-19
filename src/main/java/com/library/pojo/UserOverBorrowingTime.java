package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

/**
 *          这个类装用户超过3个月未归还图书的信息
 * @作者 冯小7
 * @时间 2021-06-13-16:07
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserOverBorrowingTime {
    private String userName;
    private String bookName;
    private LocalDate BorrowTime;//借阅时间
    private long OverDay;//未归还天数
}
