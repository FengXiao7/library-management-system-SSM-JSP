package com.library.controller;

import com.library.pojo.*;
import com.library.service.BookService;
import com.library.service.BorrowService;
import com.library.service.CommentsService;
import com.library.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

/**
 * @作者 冯小7
 * @时间 2021-05-30-12:47
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    @Qualifier("userServiceImpl")
    private UserService userService;
    @Autowired
    @Qualifier("bookServiceImpl")
    private BookService bookService;
    @Autowired
    @Qualifier("borrowServiceImpl")
    private BorrowService borrowService;
    @Autowired
    @Qualifier("commentsServiceImpl")
    private CommentsService commentsService;
    @RequestMapping("/JudgingUserExists")
    public String JudgingUserExists(HttpServletRequest request,HttpServletResponse response,Model model, User user, HttpSession session){
        //一次会话内，防止用户换号，会出现的警告信息Bug，其实用model更好
        session.removeAttribute("BorrowMsg");
        session.removeAttribute("HaveBorrow");
        session.removeAttribute("EXCEED_THE_NUMBER_OF_BORROWINGS");
        session.removeAttribute("MORE_THAN_3_MONTHS");
        boolean flag=true;
//        System.out.println("hhhhhhh");
        List<User> list = userService.getAllUser();
        //在表里一个一个找有无符合条件的用户
        for (User u : list) {
            if(u.getUserName().equals(user.getUserName())&&u.getUserPassword().equals(user.getUserPassword())){
               //找到了欢迎用户
                session.setAttribute("userName","欢迎"+u.getUserName());
                //userID主要用于借阅书籍模块
                session.setAttribute("userID",u.getUserID());
//                Cookie cookie = new Cookie("userName", user.getUserName());
//                cookie.setMaxAge(60*60*24);
//                cookie.setPath(request.getContextPath()+"/");
//                response.addCookie(cookie);
//                System.out.println(cookie.getPath());
//                System.out.println("**********************_-------------*******-----------");
//                System.out.println(cookie.getName());

                return "BookByUser/indexUser";
            }
            //密码错误的情况
            if(u.getUserName().equals(user.getUserName())&&!u.getUserPassword().equals(user.getUserPassword())){
                model.addAttribute("UserErrorPassword",u.getUserName()+"密码错误！");
                flag=false;
                break;
            }
        }
        if(flag){
            //用户名不存在的情况
            model.addAttribute("UserNotExist","不存在用户"+user.getUserName());
        }
        //密码错误的情况和用户名不存在的情况会重新登录
        return "login/loginUser";
    }
    @RequestMapping("UserRegister")
    public String UserRegister(User user,Model model){
        List<User> list = userService.getAllUser();
        //一个一个找防止用户重名
        for (User u : list) {
            if(u.getUserName().equals(user.getUserName())){
                model.addAttribute("UserAlreadyExists",u.getUserName()+"用户名已存在！");
                return "login/registerUser";
            }
        }
        //不重名的情况可以新增用户，并跳到登录界面
        userService.addUser(user);
        return "login/loginUser";
    }
    @RequestMapping("/ToUpdatePassword/{userID}")
    public String ToUpdatePassword(@PathVariable Integer userID, HttpSession session){
        String userPassword = userService.getOneUser(userID).getUserPassword();
        session.setAttribute("user_s_old_password",userPassword);
        return "BookByUser/updatePassword";
    }
    @RequestMapping("/updatePassword/{userID}")
    public String updatePassword(@PathVariable Integer userID, String userPassword){
        User user = userService.getOneUser(userID);
        user.setUserID(userID);
        user.setUserPassword(userPassword);
        userService.updateUser(user);
        return "BookByUser/allBook";
    }
    @RequestMapping("/allBook")
    public String list( HttpServletRequest httpServletRequest){
        ServletContext application = httpServletRequest.getSession().getServletContext();
        List<Books> list = bookService.queryAllBook();
        application.setAttribute("BookList",list);

        return "BookByUser/allBook";
    }
    //通过书籍名来查询对应库中的书籍
    @RequestMapping("/queryBookName")
    public String queryOneBookFromAllByName(String queryBookName, Model model, HttpServletRequest httpServletRequest){
        Books books = bookService.queryBookByName(queryBookName);
        List<Books> list=new ArrayList<>();
        list.add(books);
        //如果没有查询到，设个键提醒用户
        if(books==null){
            list.clear();
            list=bookService.queryAllBook();
            model.addAttribute("errorNotFound","未查询到");
        }
        ServletContext application = httpServletRequest.getSession().getServletContext();
        application.setAttribute("BookList",list);
        return "BookByUser/allBook";
    }

    /**
     * 分5种情况：1.借阅图书数量为0                  BorrowMsg
     *           2.当前用户已借阅10本书             EXCEED_THE_NUMBER_OF_BORROWINGS
     *           3.当前用户已借阅过这本书           HaveBorrow
     *           4.当前用户有超过3个月未归还的书。   MORE_THAN_3_MONTHS
     *           （不用考虑有多本超过3个月未归还的书的情况，因为用户有一本书超过3个月未归还时，就不能再借书了）
     *           5.没有以上4种情况，可正常借阅
     *
     *           情况3和4需要经过一层for循环，所以优先判断情况1和情况2.所以前端提醒信息1>2>3=4
     * @param BookId
     * @param UserId
     * @param httpServletRequest
     * @return
     */
    @RequestMapping("/Borrow/{BookId}/{UserId}")
    public String Borrow(@PathVariable Integer BookId,@PathVariable Integer UserId,HttpServletRequest httpServletRequest){
        HttpSession session = httpServletRequest.getSession();
        session.removeAttribute("BorrowMsg");
        session.removeAttribute("HaveBorrow");
        session.removeAttribute("EXCEED_THE_NUMBER_OF_BORROWINGS");
        session.removeAttribute("MORE_THAN_3_MONTHS");
        boolean flag=true;

        LocalDate localDate=LocalDate.now();//获取当前时间
        Books books = bookService.queryBookByID(BookId);//根据bookID查书
        User user = userService.getOneUser(UserId);//根据UserID查用户
        List<Borrow> allBorrowByUserID = borrowService.getAllBorrowByUserID(UserId);//根据userID查询该用户所有借阅信息


        //借阅图书数量为0
        if(books.getBookCounts()==0){
            session.setAttribute("BorrowMsg","很抱歉，"+user.getUserName()+"同学！"+"《"+books.getBookName()+"》"+"已无库存，请等待管理员增加库存！");
            flag=false;
        }

        //借阅图书大于10的情况
        if(allBorrowByUserID.size()>=10&&flag){
            session.setAttribute("EXCEED_THE_NUMBER_OF_BORROWINGS","很抱歉，"+user.getUserName()+"同学!"+"你已经超过最大借阅数目（10本）,请退还图书后再借阅！");
            flag=false;
        }

        //用户有超过3个月未归还的书时
        if(flag){
            for (Borrow borrow : allBorrowByUserID) {
                if(ChronoUnit.DAYS.between(borrow.getTime(),localDate)>=90){//简化为当前与借阅时间超过90，实际上应该还要考虑具体月份天数，闰年等信息
                    Integer bookID = borrow.getBookID();
                    String bookName = bookService.queryBookByID(bookID).getBookName();
                    session.setAttribute("MORE_THAN_3_MONTHS",user.getUserName()+"同学！你借阅的《"+bookName+"》3个月未归还！请归还后再借阅");
                    flag=false;
                    break;
                }
            }
        }

        //已经借阅过的情况
        if(flag){
            List<Borrow> allBorrow = borrowService.getAllBorrow();
            for (Borrow borrow : allBorrow) {
                if(borrow.getUserID().equals(UserId)&&borrow.getBookID().equals(BookId)){
                    session.setAttribute("HaveBorrow","你已借阅"+"《"+books.getBookName()+"》!，每名用户限借一本同名书！");
                    flag=false;
                    break;
                }
            }
        }
        //其余情况可正常借阅
            if(flag){
                Borrow borrow = new Borrow(BookId, UserId, localDate);
                //借阅信息存库
                borrowService.addBorrow(borrow);
                //对应图书库存减一
                books.setBookCounts(books.getBookCounts()-1);
                bookService.updateBook(books);

                //这是种很笨的方法，效率极低！最好用ajax来实现局部刷新！
                ServletContext application = httpServletRequest.getSession().getServletContext();
                List<Books> list = bookService.queryAllBook();
                application.setAttribute("BookList",list);//注意键名要一致！
            }
        return "BookByUser/allBook";
    }
    @RequestMapping("/allBorrow/{id}")
    public String allBorrow(@PathVariable("id") Integer userID,HttpSession session){
        //通过userID找到该userID下的所有借阅信息
        List<Borrow> list = borrowService.getAllBorrowByUserID(userID);
        //找到userID对应的用户名
        String userName = userService.getOneUser(userID).getUserName();
        ArrayList<Object> list1 = new ArrayList<>();
        for (Borrow borrow : list) {
          //通过借阅信息里的bookID找到对应的书名
            String bookName = bookService.queryBookByID(borrow.getBookID()).getBookName();
            //把用户名，书名，借阅时间封装好
            BorrowDetails borrowDetails = new BorrowDetails(userName, bookName, borrow.getTime());
            list1.add(borrowDetails);
        }
        session.setAttribute("AllBorrow",list1);
        return "BookByUser/borrowBook";
    }
    @RequestMapping("/giveBack/{bookName}/{userName}")
    public String giveBack(@PathVariable String bookName,@PathVariable String userName,HttpSession session){
        //通过两个Name查到对应的两个ID
        Integer userID = userService.getUserByUserName(userName).getUserID();
        Books books = bookService.queryBookByName(bookName);
        int bookID = books.getBookID();
        //删除对应的借阅信息
        borrowService.deleteBorrow(bookID,userID);
        //对应图书库存加一
        books.setBookCounts(books.getBookCounts()+1);
        //将更新数量信息入库
        bookService.updateBook(books);
        //去掉对应警告
        session.removeAttribute("EXCEED_THE_NUMBER_OF_BORROWINGS");
        session.removeAttribute("MORE_THAN_3_MONTHS");
        session.removeAttribute("HaveBorrow");
        //效率极低，最好用ajax异步刷新
        ServletContext application =session.getServletContext();
        List<Books> list = bookService.queryAllBook();
        application.setAttribute("BookList",list);//注意键名要一致！
        return "BookByUser/allBook";
    }
    @RequestMapping("/ViewDetails/{bookID}")
    public String ViewDetails(@PathVariable Integer bookID,Model model,HttpServletRequest httpServletRequest){
        //装这本书的详细信息
        Books books = bookService.queryBookByID(bookID);
        String bookName = books.getBookName();
        ServletContext application = httpServletRequest.getSession().getServletContext();
        application.setAttribute("ViewDetails",books);

        //装这本书的评论信息
        List<Comments> list = commentsService.getAllCommentsByBookID(bookID);
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
            return "BookByUser/ViewDetails";
        }
        model.addAttribute("the_book_has_never_been_reviewed","《"+bookName+"》"+"从未被评论过！快来抢沙发吧！");
        return "BookByUser/ViewDetails";
    }
    @RequestMapping("/queryBookType/{bookType}")
    public String queryBookType(@PathVariable String bookType,HttpServletRequest httpServletRequest){
        List<Books> books = bookService.queryBookByType(bookType);
        //效率极低，最好用ajax异步刷新
        ServletContext application = httpServletRequest.getSession().getServletContext();
        application.removeAttribute("BookList");
        application.setAttribute("BookList",books);
        return "BookByUser/allBook";
    }
    @RequestMapping("/ToImprovePersonalInformation/{userID}")
    public String ToImprovePersonalInformation(@PathVariable Integer userID,HttpSession session){
        User user = userService.getOneUser(userID);
        session.setAttribute("PersonalInformation",user);
        return "BookByUser/ImprovePersonalInformation";
    }
    @RequestMapping("/ImprovePersonalInformation/{userID}")
    public String ImprovePersonalInformation(@PathVariable Integer userID,String userName,String userPhone,String userSex,Integer userAge,HttpSession session){
        session.removeAttribute("DuplicateName");
        User user = userService.getOneUser(userID);
        List<User> allUser = userService.getAllUser();
        //修改的名字与其他用户重名的情况
        for (User u : allUser) {
            if(u.getUserName().equals(userName)&&u.getUserID()!=userID){
                session.setAttribute("DuplicateName","'"+userName+"'"+"与其他用户重名！");
                //变回原来的名字
                userName=user.getUserName();
                break;
            }
        }
        user.setUserPhone(userPhone);
        user.setUserSex(userSex);
        user.setUserAge(userAge);
        user.setUserName(userName);
        userService.updateUser(user);
        session.setAttribute("userName",userName);
        return "BookByUser/allBook";
    }
    @RequestMapping("/LogOutUser/{userID}")
    public String LogOutUser(@PathVariable Integer userID){
        //先将用户所有借阅信息和评论信息删除，再注销用户
        borrowService.deleteBorrowByUserID(userID);
        commentsService.deleteCommentsByUserID(userID);
        userService.deleteUser(userID);
        return "login/loginUser";
    }
    @RequestMapping("/ToComment/{bookID}/{userID}")
    public String ToComment(@PathVariable Integer bookID,@PathVariable Integer userID,Model model){
        String userName = userService.getOneUser(userID).getUserName();
        Books books = bookService.queryBookByID(bookID);
        String bookName = books.getBookName();
        model.addAttribute("book_details",books);

        //用户已评论过该书的情况，跳转到修改评论界面
        List<Comments> commentsByUserID = commentsService.getAllCommentsByUserID(userID);
        for (Comments comments : commentsByUserID) {
            if (comments.getBookID().equals(bookID)){
                model.addAttribute("the_book_has_been_reviewed",userName+"，您已评论过"+"《"+bookName+"》,"+"很抱歉！每名用户只能对一本书发表一次评论！");
                CommentsDetails details = new CommentsDetails(userName, bookName, comments.getBookComments(), comments.getCommentDate());
                model.addAttribute("post_commented",details);
                return "BookByUser/UpdateReviewBooks";
            }
        }


        model.addAttribute("people_review_book",userName+"对《"+bookName+"》的评论：");
        return "BookByUser/reviewBooks";
    }
    @RequestMapping("/Comment/{bookID}/{userID}")
    public String Comment(@PathVariable Integer bookID,@PathVariable Integer userID,String bookComments){
       LocalDate localDate=LocalDate.now();
        commentsService.addComments(new Comments(userID,bookID,bookComments,localDate));
        return "BookByUser/allBook";
    }
    @RequestMapping("/UpdateComment/{bookID}/{userID}")
    public String UpdateComment(@PathVariable Integer bookID,@PathVariable Integer userID,String bookComments){
       LocalDate localDate=LocalDate.now();
        commentsService.updateComments(new Comments(userID,bookID,bookComments,localDate));
        return "BookByUser/allBook";
    }
    @RequestMapping("/allComments/{userID}")
    public String allComments(@PathVariable Integer userID,HttpSession Session,Model model){
        List<Comments> comments = commentsService.getAllCommentsByUserID(userID);
        //评论过才进行操作
        if(!comments.isEmpty()){
            ArrayList<CommentsDetails> list = new ArrayList<>();
            for (Comments comment : comments) {
                String bookName = bookService.queryBookByID(comment.getBookID()).getBookName();
                String userName = userService.getOneUser(userID).getUserName();
                String bookComments = comment.getBookComments();
                LocalDate commentDate = comment.getCommentDate();
                CommentsDetails commentsDetails = new CommentsDetails(userName, bookName, bookComments, commentDate);
                list.add(commentsDetails);
            }
            Session.setAttribute("allCommentsByUser",list);
            return "BookByUser/allComments";
        }
        model.addAttribute("you_have_not_reviewed_any_books","您还没有评论过任何书！");
        return "BookByUser/allBook";
    }
}
