package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * 这个对象用于显示借阅详细信息，包括用户名，书名，用户借阅时间。
 * 没有对应的dao层
 * @作者 冯小7
 * @时间 2021-05-30-19:09
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BorrowDetails {
    private String userName;
    private String bookName;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate time;
}
