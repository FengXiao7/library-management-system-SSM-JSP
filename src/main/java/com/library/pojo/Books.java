package com.library.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Books {

    private int bookID;
    private String bookName;
    private int bookCounts;
    private String detail;
    private String bookType;
    private String Press;
    private String bookAuthor;
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)  //此坑找了好久！！！
    private LocalDate bookDate;
    private int bookPage;


}
