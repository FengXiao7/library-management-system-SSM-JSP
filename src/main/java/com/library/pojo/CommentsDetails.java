package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * @作者 冯小7
 * @时间 2021-06-12-20:02
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentsDetails {
    private String userName;
    private String bookName;
    private String bookComments;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate CommentsDate;
}
