package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * @作者 冯小7
 * @时间 2021-06-12-19:56
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comments {
    private Integer userID;
    private Integer bookID;
    private String bookComments;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate CommentDate;
}
