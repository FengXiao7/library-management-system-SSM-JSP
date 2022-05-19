package com.library.controller;

import com.library.pojo.Books;
import com.library.pojo.Borrow;
import com.library.service.BookService;
import com.library.service.BorrowService;
import com.library.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;
    @Autowired
    @Qualifier("borrowServiceImpl")
    private BorrowService borrowService;
    @Autowired
    @Qualifier("commentsServiceImpl")
    private CommentsService commentsService;

    //展示全部的书籍
    @RequestMapping("/allBook")
    public String list( HttpServletRequest httpServletRequest){
        ServletContext application = httpServletRequest.getSession().getServletContext();
        List<Books> list = bookService.queryAllBook();
        application.setAttribute("BookList",list);
        return "BookByManager/allBook";
    }
    //跳转到增加书籍页面
    @RequestMapping("/toAddBook")
    public String toAddPaper(){
        return "BookByManager/addBook";
    }
    //添加数据请求
    @RequestMapping(value = "/addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        return "redirect:/book/allBook";
    }
    //跳转到修改书籍页面
    @RequestMapping("/toUpdate/{id}")// RestFul风格来传参数
    public String toUpdatePaper(@PathVariable Integer id, Model model){
        Books books = bookService.queryBookByID(id);
        model.addAttribute("QueryOneBook",books);
        return "BookByManager/updateBook";
    }
    //修改书籍页面
    @RequestMapping(value = "/updateBook")
    public String updateBook(Books books){
        System.out.println(books);
        bookService.updateBook(books);
        return "redirect:/book/allBook";
    }
    //删除书籍
    @RequestMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable Integer id){
        //先将该书的所有借阅信息评论信息删除，再删书
        borrowService.deleteBorrowByBookID(id);
        commentsService.deleteCommentsByBookID(id);
        bookService.deleteBookByID(id);
        return "redirect:/book/allBook";
    }
    //通过书籍名来查询对应库中的书籍
    @RequestMapping("/queryBook")
    public String queryOneBookFromAllByName(String queryBookName,Model model,HttpServletRequest httpServletRequest){
        Books books = bookService.queryBookByName(queryBookName);
        List<Books> list=new ArrayList<>();
        list.add(books);
        //如果没有查询到，设个键提醒用户
        if(books==null){
            list.clear();
            list=bookService.queryAllBook();
            model.addAttribute("errorNotFoundBook","未查询到该书");
        }
        ServletContext application = httpServletRequest.getSession().getServletContext();
        application.setAttribute("BookList",list);
        return "BookByManager/allBook";
    }


}
