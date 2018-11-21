package com.ff.serivce;

import com.ff.dao.UserMapper;
import com.ff.model.User;
import com.ff.util.Md5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    /**
     * 检验用户登录
     * @param username
     * @param password
     * @return
     */
    public User checkLogin(String username, String password) {
        User user = userMapper.findByUsername(username);
        String userpassword = Md5Utils.pwdDigest(password);
        if (user != null && user.getPassword().equals(userpassword)) {
            return user;
        }
        return null;
    }
}
