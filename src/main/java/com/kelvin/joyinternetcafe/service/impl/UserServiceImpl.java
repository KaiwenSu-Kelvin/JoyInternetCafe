package com.kelvin.joyinternetcafe.service.impl;

import com.kelvin.joyinternetcafe.domain.User;
import com.kelvin.joyinternetcafe.mapper.IUserMapper;
import com.kelvin.joyinternetcafe.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserMapper userMapper;

    @Override
    public List<User> getUser(Boolean online) {
        List<User> users = userMapper.selectUser(online);
        return users;
    }

    @Override
    public User isRegistered(String identityNumber) {
        User registered = userMapper.isRegistered(identityNumber);
        return registered;
    }

    @Override
    public void userRegister(User user) {
        userMapper.userRegister(user);
    }

    @Override
    public int[] countOnlineUser() {
        int[] count = userMapper.countOnlineUser();
        return count;
    }

    @Override
    public void updateForLogout(int id) {
        userMapper.updateHours(id);
        userMapper.updateOnline(id);
    }

    @Override
    public void userRecharge(String idNumber,Double money) {
        userMapper.updateUserBalance(idNumber,money);
    }


}
