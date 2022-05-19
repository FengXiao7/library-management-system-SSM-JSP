package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/**
 * @作者 冯小7
 * @时间 2021-05-30-15:46
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Borrow {
    private Integer bookID;
    private Integer userID;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate time;
}
