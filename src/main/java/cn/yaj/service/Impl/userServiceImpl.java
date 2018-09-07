package cn.yaj.service.Impl;

import cn.yaj.mapper.UserMapper;
import cn.yaj.pojo.User;
import cn.yaj.pojo.UserExample;
import cn.yaj.service.IUserService;
import cn.yaj.utils.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
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
    @Override
    public int insert(User user) {
        user.setCreatetime(new Date());
        String pasword = user.getPsword();
        String md5Pasword = MD5.md5Password(pasword);
        user.setPsword(md5Pasword);
        return userMapper.insert(user);
    }

    /**
     *
     * @param username
     * @return true:用户存在，false:用户不存在
     */
    @Override
    public User getUserbykey(String username){

        User user = userMapper.selectByUserName(username);
       return user;
    }

}
