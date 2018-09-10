package cn.yaj.controller;

import cn.yaj.pojo.User;
import cn.yaj.service.IUserService;
import cn.yaj.utils.MD5;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.*;
import java.util.logging.Logger;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;


@RequestMapping("user")
@Controller
public class UserController {
    private Logger logger = Logger.getLogger("UserController");
    @Autowired
    IUserService iUserService;
    @RequestMapping("login")
    public String login(){
        return "regist";
    }
    @RequestMapping("showAllUser")
    @ResponseBody
    public void showAllUser(Model model, HttpServletResponse response) {
        List<User> allUser = iUserService.getAllUser();
        for (User u : allUser) {
            System.out.println(u.getPsword());
        }
        JSONObject json = JSONObject.fromObject(allUser);
        try {
            response.getWriter().println(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/userRegist", method = RequestMethod.GET)
    public String userRegist(User user) {
        User checkUser = iUserService.getUserbykey(user.getUsername());
        if (null == checkUser) {
            int id = iUserService.insert(user);
            logger.warning("返回的id为" + user.getId());
            if (user.getId() > 0) {
                return "login";
            } else {
                return "regist";
            }
        }
        return "regist";
    }

    @RequestMapping("userLogin")
    public String userLogin(Model model, User user) {
        User checkUser = iUserService.getUserbykey(user.getUsername());
        String msg;
        if (null == checkUser) {
            msg = "用户不存在请先注册！！！";
            model.addAttribute("msg", msg);
            return "regist";
        }
        String password = checkUser.getPsword();
        if (MD5.md5Password(user.getPsword()).equals(password)) {
            return "index";
        }
        msg = "密码错误，请重新输入密码！！！";
        model.addAttribute("msg", msg);
        return "login";
    }

    @RequestMapping(value = "/checkIsUser",produces = "text/plain;charset=utf-8")
    public void checkIsUser(User user, HttpServletResponse response) {
        System.out.print(user.getUsername());
        User checkUser = iUserService.getUserbykey(user.getUsername());
        String msg = "";
        Map<String,String> map = new HashMap<>();
        if(null == checkUser){
            msg = "用户可以注册";
            map.put("msg",msg);
            map.put("code","1");
        } else {
            msg = "用户已存在";
            map.put("msg",msg);
            map.put("code","0");
        }
        JSONObject json = JSONObject.fromObject(map);
        try {
            response.getWriter().println(json);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}