package com.ff.dao;


import com.ff.model.User;

public interface UserMapper {

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User findByUsername(String username);

    User loadUserByUsername(String username);

    User querySingleUser(String username);
}
