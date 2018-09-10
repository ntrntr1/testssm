package cn.yaj.service;

import cn.yaj.pojo.User;

import java.util.List;
public interface IUserService {
    public List<User> getAllUser();
    public int insert(User user);
    public User getUserbykey(String username);
}
