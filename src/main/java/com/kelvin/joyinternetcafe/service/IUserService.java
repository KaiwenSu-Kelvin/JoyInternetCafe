package com.kelvin.joyinternetcafe.service;

import com.kelvin.joyinternetcafe.domain.User;

import java.util.List;


public interface IUserService {
    List<User> getUser(Boolean online);

    User isRegistered(String identityNumber);
    void userRegister(User user);
    int[] countOnlineUser();
    void updateForLogout(int id);
    void userRecharge(String idNumber,Double money);
}
