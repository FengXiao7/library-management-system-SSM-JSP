package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *  3个纯跳转控制器
 * @作者 冯小7
 * @时间 2021-05-29-17:47
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @RequestMapping("/manager")
    public String manager(){
        return "login/loginManager";
    }
    @RequestMapping("/user")
    public String user(){
        return "login/loginUser";
    }
    @RequestMapping("/register")
    public String register(){
        return "login/registerUser";
    }
}
