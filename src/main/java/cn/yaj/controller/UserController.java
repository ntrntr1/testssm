package cn.yaj.controller;

import cn.yaj.pojo.User;
import cn.yaj.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    IUserService iUserService;
    @RequestMapping("showAllUser")
    public String showAllUser(Model model) {
        List<User> allUser = iUserService.getAllUser();
        for (User u: allUser) {
            System.out.println(u.getPsword());
        }
        model.addAttribute("allUser",allUser);
        return "showuser";
    }
}
