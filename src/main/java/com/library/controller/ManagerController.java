package com.library.controller;

import com.library.pojo.*;
import com.library.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/administrator")
public class ManagerController {
    @Autowired
    @Qualifier("managerServiceImpl")
    private ManagerService managerService;
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("borrowServiceImpl")
    private BorrowService borrowService;
    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;
    @Autowired
    @Qualifier("commentsServiceImpl")
    private CommentsService commentsService;
    //判断是否存在Manager，或者管理员密码是否错误
    @RequestMapping("/JudgingManagerExists")
    public String JudgingManagerExists(Model model,Manager manager, HttpSession session){
        System.out.println("1111111111");
        boolean flag=true;
        //这个地方必须先把超级管理员移除了，否则会出现超级管理员登录后，换号成普通管理员，也可以执行超级管理员权限的Bug
        session.removeAttribute("SuperManager");
        List<Manager> list = managerService.getAllManager();
        //在表里一个一个找
        for (Manager m : list) {
            if(m.getName().equals(manager.getName())&&!m.getPassword().equals(manager.getPassword())){
                //管理员姓名正确，密码错误的情况
                model.addAttribute("ManagerErrorPassword","管理员"+manager.getName()+"密码错误");
                flag=false;
                break;
            }
            //管理员姓名正确，密码正确的情况
            if(m.getName().equals(manager.getName())&&m.getPassword().equals(manager.getPassword())){
                //超级管理员(写死的只有一个)
                if(m.getName().equals("冯成祥")){
                    //这个地方必须用作用域大于request,写在Application里也行
                    session.setAttribute("SuperManager","冯成祥");
                }
                session.setAttribute("ManagerName","欢迎"+manager.getName()+"管理员");
                return "BookByManager/indexManager";
            }
        }
        if(flag){
            //管理员姓名错误的情况
            model.addAttribute("ManagerNotExist","不存在管理员"+manager.getName());
        }
        //管理员姓名正确，密码错误的情况和管理员姓名错误的情况会重新登录
        return "login/loginManager";
    }
    //获取所有用户
    @RequestMapping("allUser")
    public String allUser(HttpServletRequest httpServletRequest){
        List<User> list = userService.getAllUser();
        ServletContext application = httpServletRequest.getSession().getServletContext();

        application.setAttribute("allUser",list);
        return "manager/allUser";
    }
    //通过用户名来查询对应库中的用户,进而查询该用户的借阅信息
    @RequestMapping("/queryUser")
    public String queryOneBookFromAllByName(String queryUserName,Model model,HttpServletRequest httpServletRequest){

        ServletContext application = httpServletRequest.getSession().getServletContext();
        User user = userService.getUserByUserName(queryUserName);
        ArrayList<User> list = new ArrayList<>();
        list.add(user);
        if(user==null){

            list.clear();
            model.addAttribute("errorNotFoundUser","该用户不存在！");
        }

        application.setAttribute("allUser",list);

        return "manager/allUser";
    }
    //获取所有管理员
    @RequestMapping("/allManager")
    public String allManager(Model model){
        List<Manager> allManager = managerService.getAllManager();
        model.addAttribute("ManagerList",allManager);
        return "manager/allManager";
    }
    //增加管理员
    @RequestMapping("/toAddManager")
    public String toAddManager(){
        return "manager/addManager";
    }
    @RequestMapping(value = "/addManager")
    public String addManager(Manager manager){
        managerService.addManager(manager);
        return "redirect:/manager/allManager";
    }
    //修改管理员
    @RequestMapping("/toUpdate/{managerID}")// RestFul风格来传参数
    public String toUpdate(@PathVariable Integer managerID, Model model){
        Manager manager = managerService.getManager(managerID);
        manager.setManagerID(managerID);
        System.out.println(manager);
        model.addAttribute("QueryOneManager",manager);
        return "manager/updateManager";
    }
    @RequestMapping(value = "/updateManager")
    public String updateManager(Manager manager){
        managerService.updateManager(manager);
        return "redirect:/manager/allManager";
    }
    //删除管理员
    @RequestMapping("/delete/{managerID}")
    public String deleteManager(@PathVariable Integer managerID){
        managerService.deleteManager(managerID);
        return "redirect:/manager/allManager";
    }
    //显示所有借阅信息
    @RequestMapping("/allBorrow")
    public String allBorrow(HttpServletRequest httpServletRequest){
        List<Borrow> allBorrow = borrowService.getAllBorrow();
        ServletContext application = httpServletRequest.getSession().getServletContext();
        List<BorrowDetails> list = new ArrayList<>();
        for (Borrow borrow : allBorrow) {
            Integer bookID = borrow.getBookID();
            Integer userID = borrow.getUserID();
            LocalDate time = borrow.getTime();
            String userName = userService.getOneUser(userID).getUserName();
            String bookName = bookService.queryBookByID(bookID).getBookName();
            BorrowDetails borrowDetails = new BorrowDetails(userName, bookName, time);
            list.add(borrowDetails);
        }
        application.setAttribute("BorrowList",list);
        return "manager/allBorrow";
    }
    //根据书号查看书的借阅情况
    @RequestMapping("AllBorrowByBookID/{bookID}")
    public String AllBorrowByBookID(@PathVariable Integer bookID,HttpServletRequest httpServletRequest){
        ServletContext application = httpServletRequest.getSession().getServletContext();
        //由于都是一本书，根据输号查书名的代码只用写一行！
        String bookName = bookService.queryBookByID(bookID).getBookName();
        //根据书号查看书的所有借阅情况
        List<Borrow> allBorrow = borrowService.getAllBorrowByBookID(bookID);
        ArrayList<BorrowDetails> list = new ArrayList<>();
        for (Borrow borrow : allBorrow) {
            Integer userID = borrow.getUserID();
            String userName = userService.getOneUser(userID).getUserName();
            LocalDate time = borrow.getTime();
            BorrowDetails borrowDetails = new BorrowDetails(userName, bookName, time);
            list.add(borrowDetails);
        }
        if(list.isEmpty()){
            list.add(new BorrowDetails("没有人借阅过！",bookName,null));
        }

        application.setAttribute("AllBorrowByBookID",list);

        return "manager/allBorrowByBookID";
    }
    //根据用户号查看书的借阅情况
    @RequestMapping("AllBorrowByUserID/{userID}")
    public String AllBorrowByUserID(@PathVariable Integer userID,HttpServletRequest httpServletRequest){
        ServletContext application = httpServletRequest.getSession().getServletContext();
        ArrayList<BorrowDetails> list = new ArrayList<>();
        String userName = userService.getOneUser(userID).getUserName();
        List<Borrow> allBorrow = borrowService.getAllBorrowByUserID(userID);
        for (Borrow borrow : allBorrow) {
            Integer bookID = borrow.getBookID();
            String bookName = bookService.queryBookByID(bookID).getBookName();
            LocalDate time = borrow.getTime();
            BorrowDetails borrowDetails = new BorrowDetails(userName, bookName, time);
            list.add(borrowDetails);
        }
        if(list.isEmpty()){
            list.add(new BorrowDetails(userName,"没有借阅过任何书！",null));
        }

        application.setAttribute("AllBorrowByUserID",list);
        return "manager/allBorrowByUserID";
    }
    @RequestMapping("/queryBookType/{bookType}")
    public String queryBookType(@PathVariable String bookType,HttpServletRequest httpServletRequest){
        List<Books> books = bookService.queryBookByType(bookType);
        //效率极低，最好用ajax异步刷新
        ServletContext application = httpServletRequest.getSession().getServletContext();
        application.removeAttribute("BookList");
        application.setAttribute("BookList",books);
        return "BookByManager/allBook";
    }
    @RequestMapping("/AllCommentByBookID/{bookID}")
    public String AllCommentByBookID(@PathVariable Integer bookID,Model model){
        List<Comments> list = commentsService.getAllCommentsByBookID(bookID);
        String bookName = bookService.queryBookByID(bookID).getBookName();
        if(!list.isEmpty()){
            //可以写成utils进行复用，减少冗余
            ArrayList<CommentsDetails> commentsDetails = new ArrayList<>();
            for (Comments comments : list) {
                String userName = userService.getOneUser(comments.getUserID()).getUserName();
                String bookComments = comments.getBookComments();
                LocalDate commentDate = comments.getCommentDate();
                CommentsDetails details = new CommentsDetails(userName, bookName, bookComments, commentDate);
                commentsDetails.add(details);
            }
            model.addAttribute("book_review_information",commentsDetails);
            return "manager/allCommentByBookID";
        }
        model.addAttribute("the_book_has_never_been_reviewed","《"+bookName+"》"+"从未被评论过！");
        return "manager/allCommentByBookID";
    }
    @RequestMapping("/AllCommentByUserID/{userID}")
    public String AllCommentByUserID(@PathVariable Integer userID,Model model){
        List<Comments> list = commentsService.getAllCommentsByUserID(userID);
        String userName = userService.getOneUser(userID).getUserName();
        if(!list.isEmpty()){
            ArrayList<CommentsDetails> details = new ArrayList<>();
            for (Comments comments : list) {

                String bookName = bookService.queryBookByID(comments.getBookID()).getBookName();
                String bookComments = comments.getBookComments();
                LocalDate commentDate = comments.getCommentDate();
                CommentsDetails commentsDetails = new CommentsDetails(userName, bookName, bookComments, commentDate);
                details.add(commentsDetails);
            }
            model.addAttribute("user_comments_about_the_book_information",details);
            return "manager/allCommentByUserID";
        }
        model.addAttribute("this_user_has_never_reviewed_the_book",userName+"从未评论过书籍！！！");
        return "manager/allCommentByUserID";
    }
    @RequestMapping("/ViewUserOverBorrowingTime")
    public String GetUserOverBorrowingTime(HttpSession session ){
        List<User> list = userService.getAllUser();
        LocalDate localDate=LocalDate.now();
        ArrayList<UserOverBorrowingTime> arrayList = new ArrayList<>();
        //这个地方由于循环嵌套会消耗大量时间，暂时没想到什么好方法
        for (User user : list) {
            //查询每个用户的所有借阅信息
            List<Borrow> allBorrowByUserID = borrowService.getAllBorrowByUserID(user.getUserID());
            for (Borrow borrow : allBorrowByUserID) {
                //查询有无用户有超过3个月未归还图书的情况
                long days=ChronoUnit.DAYS.between(borrow.getTime(),localDate);
                if(days>=90){
                    String bookName = bookService.queryBookByID(borrow.getBookID()).getBookName();
                    //封装成一个新的实体类
                    UserOverBorrowingTime userOverBorrowingTime = new UserOverBorrowingTime(user.getUserName(), bookName, borrow.getTime(),days);
                    arrayList.add(userOverBorrowingTime);
                }
            }
        }
        session.setAttribute("ViewUserOverBorrowingTime",arrayList);
        return "manager/allUsersPastTheReturnTime";
    }
}
