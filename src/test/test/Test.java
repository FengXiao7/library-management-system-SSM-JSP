package test;

import com.library.service.BookServiceImpl;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

/**
 * @作者 冯小7
 * @时间 2021-05-29-22:52
 */
public class Test {
    @org.junit.Test
    public void updateManager(){
        BookServiceImpl bookService = new BookServiceImpl();

    }
    @org.junit.Test
    public void time(){
        LocalDate day0 = LocalDate.of(2021, 1, 1);
        LocalDate localDate=LocalDate.now();
        System.out.println(day0);
        System.out.println(localDate);
        System.out.println(day0.until(localDate, ChronoUnit.DAYS));
        System.out.println(ChronoUnit.DAYS.between(localDate,day0));
    }
    @org.junit.Test
    public void updateUserPassword(){


    }


}
