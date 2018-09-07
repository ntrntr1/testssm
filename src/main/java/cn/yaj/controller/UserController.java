package cn.yaj.controller;

import cn.yaj.pojo.User;
import cn.yaj.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RequestMapping("user")
@Controller
public class UserController {
    @Autowired
    IUserService iUserService;

    @RequestMapping("showAllUser")
    @ResponseBody
    public String showAllUser(Model model) {
//        List<User> allUser = iUserService.getAllUser();
//        for (User u: allUser) {
//            System.out.println(u.getPsword());
//        }
        User user1 = new User();
        user1.setUsername("dfdfff");
        user1.setPsword("ddd");
        User user2 = new User();
        user2.setUsername("dfdfff");
        user2.setPsword("ddd");
        List<User> allUser = new ArrayList<>();
        allUser.add(user1);
        allUser.add(user2);
        allUser.add(user1);
        allUser.add(user2);
        allUser.add(user1);
        allUser.add(user2);
        allUser.add(user1);
        allUser.add(user2);
        allUser.add(user1);
        allUser.add(user2);
        String a = "{\n" +
                "   \n" +
                "    \"users\": [\n" +
                "        { \"name\":\"A\", \"authority\":\"用户\"},\n" +
                "        {  \"name\":\"B\", \"authority\":\"用户\"},\n" +
                "        {  \"name\":\"C\", \"authority\":\"管理员\" }\n" +
                "    ]\n" +
                "}";
        HashMap<String,String> map = new HashMap<>();
        map.put("username","ao");
        model.addAttribute("login","a");
       String ast = "aaaaaa";
        return ast;
    }
}
