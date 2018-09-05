package cn.yaj.service.Impl;

import cn.yaj.mapper.UserMapper;
import cn.yaj.pojo.User;
import cn.yaj.pojo.UserExample;
import cn.yaj.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class userServiceImpl implements IUserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> getAllUser() {
        UserExample example = new UserExample();
        return userMapper.selectByExample(example);
    }
}
